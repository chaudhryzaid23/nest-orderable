import { Inject, Injectable } from '@nestjs/common';
import { CreateOrderableDto } from './dto/create-orderable.dto';
import { UpdateOrderableDto } from './dto/update-orderable.dto';
import { ConfigService } from '@nestjs/config';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';
import { PRISMA_SERVICE } from 'src/multi-tenant/multi-tenant.module';

import { Knex } from 'knex';
import { InjectKnex } from 'nestjs-knex';

@Injectable()
export class OrderableService {
  constructor(
    @Inject(PRISMA_SERVICE) private readonly prisma: PrismaService,
    @InjectKnex() private readonly knex: Knex,
    private readonly configService: ConfigService,
  ) {}

  create(createOrderableDto: CreateOrderableDto) {
    return 'This action adds a new orderable';
  }

  async findAll() {
    const result = await this.prismaQuery();
    return result;
  }

  async findKnex() {
    const result = await this.knexGraphQuery();
    return result;
  }

  findOne(id: number) {
    return `This action returns a #${id} orderable`;
  }

  update(id: number, updateOrderableDto: UpdateOrderableDto) {
    return `This action updates a #${id} orderable`;
  }

  remove(id: number) {
    return `This action removes a #${id} orderable`;
  }

  async PPRQueryRaw() {
    const patientId = 'AHSAN-PATIENT-ID';
    const startDate = 0;
    const endDate = 999999999999;

    const results: any[] = await this.prisma.$queryRaw`
        SELECT
            ov.orderableId AS orderableId,
            DATE(FROM_UNIXTIME(ov.acquisitionTime)) AS date,
            MAX(rv.numericValue) AS lastNumericValue,
            COUNT(rv.status) AS statusCount,
            o.* -- Include all columns from Orderable table
        FROM
            ResultableValue AS rv
        JOIN OrderableValue AS ov ON rv.orderableValueId = ov.orderableValueId
        JOIN 
        (
          SELECT 
            ov2.orderableValueId, 
            MAX(ov2.acquisitionTime) AS maxAcquisitionTime
          FROM OrderableValue ov2
          WHERE ov2.acquisitionTime >= ${startDate} 
                AND ov2.acquisitionTime <= ${endDate}
                AND ov2.patientId = ${patientId}   -- Filter by patientId in subquery
          GROUP BY ov2.orderableValueId, DATE(FROM_UNIXTIME(ov2.acquisitionTime))
        ) AS ovMax ON rv.orderableValueId = ovMax.orderableValueId AND ov.acquisitionTime = ovMax.maxAcquisitionTime
        JOIN Orderable AS o ON ov.orderableId = o.orderableId
        WHERE ov.acquisitionTime >= ${startDate} AND ov.acquisitionTime <= ${endDate} AND ov.patientId = ${patientId} -- Filter by patientId in main query
        GROUP BY ov.orderableId, DATE(FROM_UNIXTIME(ov.acquisitionTime))
        ORDER BY MAX(ov.acquisitionTime) ASC;`; // Order by the max reading time within each group

    console.log('results: ', results);

    return `Total Records are: ${results.length}`;
  }

  async prismaPatientProgressReportQueryPrisma() {
    const patientId = 'AHSAN-PATIENT-ID';
    const startDate = 0;
    const endDate = 999999999999;

    const orderables = await this.prisma.orderable.findMany({
      distinct: ['orderableId'],
      where: {
        orderableValues: {
          some: {
            acquisitionTime: { gte: startDate, lt: endDate },
            patientId: patientId,
          },
        },
      },
    });

    let orderableIds: string[] = [];

    orderables.map((rec) => {
      orderableIds.push(rec.orderableId);
    });

    // last resultableValues for for each orderable

    const results = await this.prisma.orderableValue.groupBy({
      by: ['acquisitionTime'],
      having: { acquisitionTime: { not: null } },
      where: { orderableId: { in: orderableIds }, patientId: patientId },
      orderBy: { acquisitionTime: Prisma.SortOrder.desc },
      take: 1,
    });

    return `Total Records are: ${results.length}`;
  }

  async prismaQuery() {
    const patientId = 'AHSAN-PATIENT-ID';
    const startTime = 0;
    const endTime = 999999999999;
    const recs = await this.prisma.uSEscalation.findMany({
      select: { orderableValue: { select: { orderableId: true } } },
      where: {
        orderableValue: {
          patientId,
          acquisitionTime: { gte: startTime, lte: endTime },
        },
      },
    });

    let orderableIds: Set<string> = new Set();

    recs.map((rec) => {
      orderableIds.add(rec.orderableValue.orderableId);
    });
    const result = await this.prisma.orderableValue.findMany({
      where: {
        patientId,
        acquisitionTime: { gte: startTime, lte: endTime },
        orderableId: { in: Array.from(orderableIds) },
      },
    });

    return `Total Records are: ${result.length}`;
  }

  async knexQuery(): Promise<string> {
    const patientId = 'AHSAN-PATIENT-ID';
    const startTime = 0;
    const endTime = 999999999999;

    const knexQuery = this.knex
      .select(this.knex.raw(`any_value(acquisitionTime) as c`))
      .from('OrderableValue')
      .where('acquisitionTime', '>', Number(startTime))
      .where('acquisitionTime', '<', Number(endTime))
      .innerJoin('Patient', 'Patient.patientId', 'OrderableValue.patientId')
      .where('Patient.patientId', '=', patientId)
      .groupBy(this.knex.raw(`DATE(FROM_UNIXTIME(acquisitionTime))`));

    const result: { c: bigint }[] = await this.prisma.$queryRawUnsafe(
      knexQuery.toQuery(),
    );

    return `Total Records are: ${result.length}`;
  }

  async knexGraphQuery(): Promise<string> {
    const patientId = 'AHSAN-PATIENT-ID';
    const startTime = 0;
    const endTime = 999999999999;

    const knexQuery1 = this.knex
      .distinct('OrderableValue.orderableId')
      .from('USEscalation')
      .innerJoin(
        'OrderableValue',
        'OrderableValue.orderableValueId',
        'USEscalation.orderableValueId',
      )
      .where('OrderableValue.patientId', '=', 'AHSAN-PATIENT-ID')
      .where('acquisitionTime', '>', Number(startTime))
      .where('acquisitionTime', '<', Number(endTime));

    const knexQuery = this.knex
      .select('orderableValueId')
      .from('OrderableValue')
      .where('orderableId', 'in', knexQuery1)
      .where('OrderableValue.patientId', '=', 'AHSAN-PATIENT-ID')
      .where('acquisitionTime', '>', Number(startTime))
      .where('acquisitionTime', '<', Number(endTime));

    console.log(knexQuery.toQuery());

    const result: { c: bigint }[] = await this.prisma.$queryRawUnsafe(
      knexQuery.toQuery(),
    );

    console.log(result);

    return `Total Records are: ${result.length}`;
  }
}
