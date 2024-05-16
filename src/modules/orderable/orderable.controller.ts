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
    return this.orderableService.PPRQueryPrismaMixed();
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
