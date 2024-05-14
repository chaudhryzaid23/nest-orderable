import { Test, TestingModule } from '@nestjs/testing';
import { OrderableService } from './orderable.service';

describe('OrderableService', () => {
  let service: OrderableService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [OrderableService],
    }).compile();

    service = module.get<OrderableService>(OrderableService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
