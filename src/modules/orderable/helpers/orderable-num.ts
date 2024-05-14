// export async function getTotalReading(
//   prisma: PrismaClient,
//   patientId: string,
//   startTime: number,
//   endTime: number,
//   knex: Knex,
// ): Promise<{ count: number; records: { c: bigint }[] }> {
//   const knexQuery = knex
//     .select(knex.raw(`any_value(acquisitionTime) as c`))
//     .from('OrderableValue')
//     .where('acquisitionTime', '>', Number(startTime))
//     .where('acquisitionTime', '<', Number(endTime))
//     .innerJoin('Patient', 'Patient.patientId', 'OrderableValue.patientId')
//     .where('Patient.patientId', '=', patientId)
//     .groupBy(knex.raw(`DATE(FROM_UNIXTIME(acquisitionTime))`));

//   const result: { c: bigint }[] = await prisma.$queryRawUnsafe(
//     knexQuery.toQuery(),
//   );

//   const count = result.length;
//   const records = result;
//   return { count, records };
// }
