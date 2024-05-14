import { Test, TestingModule } from '@nestjs/testing';
import { OrderableController } from './orderable.controller';
import { OrderableService } from './orderable.service';

describe('OrderableController', () => {
  let controller: OrderableController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [OrderableController],
      providers: [OrderableService],
    }).compile();

    controller = module.get<OrderableController>(OrderableController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
