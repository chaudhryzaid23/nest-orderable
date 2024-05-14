import { PartialType } from '@nestjs/mapped-types';
import { CreateOrderableDto } from './create-orderable.dto';

export class UpdateOrderableDto extends PartialType(CreateOrderableDto) {}
