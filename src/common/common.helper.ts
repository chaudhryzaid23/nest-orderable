import { Request } from 'express';

export function getHost(req: Request) {
  let host: string = req.headers.host!;
  if (req.originalUrl.includes('private/api')) {
    // @ts-ignore
    host = req.headers['header-host'];
    if (!host) {
      return 'impossiblestring';
    }
  }

  // check 127.0.0.1 to support tests
  return host.includes('127.0.0.1:') ? 'localhost:3000' : host;
}
