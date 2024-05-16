import { Inject, Injectable } from '@nestjs/common';
import { CreateOrderableDto } from './dto/create-orderable.dto';
import { UpdateOrderableDto } from './dto/update-orderable.dto';
import { ConfigService } from '@nestjs/config';
import { Prisma } from '@prisma/client';
import { PrismaService } from 'src/prisma/prisma.service';
import { PRISMA_SERVICE } from 'src/multi-tenant/multi-tenant.module';

import { Knex } from 'knex';
import { InjectKnex } from 'nestjs-knex';

interface DailyTime {
  maxAcquisitionDate: number;
  maxAcquisitionTime: number;
}

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
    const startDate = 1713052800;
    const endDate = 1715767365;

    const results: any[] = await this.prisma.$queryRaw`
        SELECT
            ov.orderableId AS orderableId,
            DATE(FROM_UNIXTIME(ov.acquisitionTime)) AS date,
            ov.acquisitionTime,
            rv.numericValue AS lastNumericValue,
            ovMax.orderableValueId,
            rv.resultableValueId,
            rv.status, -- Include ResultableValue status
            o.* -- Include all columns from Orderable table
        FROM
            ResultableValue AS rv
        JOIN OrderableValue AS ov ON rv.orderableValueId = ov.orderableValueId
        JOIN 
        (
            SELECT 
                ov2.orderableValueId, 
                MAX(ov2.acquisitionTime) AS maxAcquisitionTime
            FROM 
                OrderableValue ov2
            WHERE 
                ov2.acquisitionTime >= ${startDate} 
                AND ov2.acquisitionTime <= ${endDate}
                AND ov2.patientId = ${patientId}
            GROUP BY 
                ov2.orderableValueId, 
                DATE(FROM_UNIXTIME(ov2.acquisitionTime))
        ) AS ovMax ON rv.orderableValueId = ovMax.orderableValueId AND ov.acquisitionTime = ovMax.maxAcquisitionTime
        JOIN Orderable AS o ON ov.orderableId = o.orderableId
        WHERE ov.acquisitionTime >= ${startDate} AND ov.acquisitionTime <= ${endDate} AND ov.patientId = ${patientId}
        ORDER BY ov.acquisitionTime ASC;`; // Order by the max reading time within each group

    console.log('results: ', results);

    return `Total Records are: ${results.length}`;
  }

  async PPRQueryPrismaMixed() {
    const patientId = 'a3c33f6a-6f56-410d-a3c3-2861211911d1';
    const startDate = 1713052800;
    const endDate = 1715767365;

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
    let acquisitionTimes: number[] = [];
    orderables.map((rec) => {
      orderableIds.push(rec.orderableId);
    });

    for (let currOrderableId of orderableIds) {
      const relevantTimes = await this.prisma.$queryRaw<DailyTime[]>`
      SELECT 
          DATE(CONVERT_TZ(FROM_UNIXTIME(ov2.acquisitionTime), 'UTC','America/Dallas')) AS maxAcquisitionDate,
          MAX(ov2.acquisitionTime) AS maxAcquisitionTime
      FROM OrderableValue ov2 
      JOIN
          Orderable AS o ON o.orderableId=ov2.orderableId
      WHERE
          o.orderableId = ${currOrderableId}
          AND ov2.acquisitionTime >= ${startDate} 
          AND ov2.acquisitionTime <= ${endDate}
          AND ov2.patientId = ${patientId} 
      GROUP BY DATE(CONVERT_TZ(FROM_UNIXTIME(ov2.acquisitionTime), 'UTC','America/Dallas'))`;

      relevantTimes.forEach((relevantTime, i) => {
        acquisitionTimes.push(relevantTime.maxAcquisitionTime);
      });
    }

    const recs = await this.prisma.orderableValue.findMany({
      select: {
        acquisitionTime: true,
        orderable: { select: { name: true } },
        resultableValues: {
          select: {
            numericValue: true,
            resultable: { select: { name: true } },
          },
        },
      },
      where: {
        acquisitionTime: { in: acquisitionTimes },
      },
    });

    console.log('recs', recs);

    // return `Total Records are: ${results.length}`;
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
