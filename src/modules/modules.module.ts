import { Module } from '@nestjs/common';
import { OrderableModule } from './orderable/orderable.module';

@Module({
  imports: [OrderableModule]
})
export class ModulesModule {}
