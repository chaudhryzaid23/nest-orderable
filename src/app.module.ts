import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { ModulesModule } from './modules/modules.module';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { PrismaModule } from './prisma/prisma.module';
import multiTenantConfig, {
  TenantConfig,
} from './multi-tenant/multi-tenant.config';
import {
  MultiTenantModule,
  TENANT_CONFIG,
} from './multi-tenant/multi-tenant.module';
import { KnexModule } from 'nestjs-knex';
import { EnvironmentVars } from './common/common.types';

@Module({
  imports: [
    ModulesModule,
    ConfigModule.forRoot({
      isGlobal: true,
      load: [multiTenantConfig],
    }),
    KnexModule.forRootAsync({
      imports: [ConfigModule],
      inject: [ConfigService],
      useFactory: (configService: ConfigService) => ({
        config: {
          client: 'mysql2',
          useNullAsDefault: true,
          pool: { min: 0, max: 0 },
          debug: configService.get<number>(EnvironmentVars.LOG_QUERIES) == 0,
        },
      }),
    }),
    MultiTenantModule,
  ],
  controllers: [AppController],
  providers: [AppService],
})
export class AppModule {}
