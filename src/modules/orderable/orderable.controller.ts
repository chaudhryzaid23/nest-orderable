import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { OrderableService } from './orderable.service';
import { CreateOrderableDto } from './dto/create-orderable.dto';
import { UpdateOrderableDto } from './dto/update-orderable.dto';
import { ConfigService } from '@nestjs/config';

@Controller('orderable')
export class OrderableController {
  constructor(private readonly orderableService: OrderableService) {}

  @Post()
  create(@Body() createOrderableDto: CreateOrderableDto) {
    return this.orderableService.create(createOrderableDto);
  }

  @Get()
  findAll() {
    // return this.orderableService.PPRQueryRaw();
    const patientId = 'a3c33f6a-6f56-410d-a3c3-2861211911d1';
    return this.orderableService.PPRQueryPrismaMixed(patientId);
  }

  @Get('patient-progress-report')
  findAllKnex() {
    return this.orderableService.findKnex();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.orderableService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateOrderableDto: UpdateOrderableDto,
  ) {
    return this.orderableService.update(+id, updateOrderableDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.orderableService.remove(+id);
  }
}
