import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ConfigService } from '@nestjs/config';
import { TenantConfig } from './multi-tenant/multi-tenant.config';
import { PrismaService } from './prisma/prisma.service';
import { EnvironmentVars } from './common/common.types';
import { MultiTenantMiddleware } from './multi-tenant/multi-tenant.middleware';

function processSchedulesAndReminders(configService: ConfigService) {
  const tenantConfigs: { [host: string]: TenantConfig } =
    configService.get('multiTenant');

  for (const [host, tConfig] of Object.entries(tenantConfigs)) {
    const prisma = new PrismaService({
      logQueries: configService.get<number>(EnvironmentVars.LOG_QUERIES) == 1,
      url: `mysql://${tConfig.DB_USER}:${tConfig.DB_PASSWORD}@${tConfig.DB_HOST_MAIN}/${tConfig.DB_NAME}?connection_limit=20`,
    });

    MultiTenantMiddleware.prismas[host] = prisma;

    // console.log(prisma, host);

    prisma.$disconnect();
  }
}

async function bootstrap() {
  const app = await NestFactory.create(AppModule);

  console.log('app init');

  await app.init();

  const configService = app.get(ConfigService);
  processSchedulesAndReminders(configService);

  await app.listen(3000);
}
bootstrap();
