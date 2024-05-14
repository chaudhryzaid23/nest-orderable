import { Module } from '@nestjs/common';
import { OrderableService } from './orderable.service';
import { OrderableController } from './orderable.controller';
import { ConfigService } from '@nestjs/config';

@Module({
  controllers: [OrderableController],
  providers: [OrderableService],
})
export class OrderableModule {}
