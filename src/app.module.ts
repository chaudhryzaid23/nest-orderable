import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ModulesModule } from './modules/modules.module';
import { ConfigModule } from '@nestjs/config';
import { PrismaModule } from './prisma/prisma.module';
import multiTenantConfig, {
  TenantConfig,
} from './multi-tenant/multi-tenant.config';
import {
  MultiTenantModule,
  TENANT_CONFIG,
} from './multi-tenant/multi-tenant.module';

@Module({
  imports: [
    ModulesModule,
    ConfigModule.forRoot({
      isGlobal: true,
      load: [multiTenantConfig],
    }),
    MultiTenantModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
