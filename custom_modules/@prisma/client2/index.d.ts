
/**
 * Client
**/

import * as runtime from './runtime/library.js';
import $Types = runtime.Types // general types
import $Public = runtime.Types.Public
import $Utils = runtime.Types.Utils
import $Extensions = runtime.Types.Extensions
import $Result = runtime.Types.Result

export type PrismaPromise<T> = $Public.PrismaPromise<T>


/**
 * Model ApiCallLog
 * 
 */
export type ApiCallLog = $Result.DefaultSelection<Prisma.$ApiCallLogPayload>

/**
 * ##  Prisma Client ʲˢ
 * 
 * Type-safe database client for TypeScript & Node.js
 * @example
 * ```
 * const prisma = new PrismaClient()
 * // Fetch zero or more ApiCallLogs
 * const apiCallLogs = await prisma.apiCallLog.findMany()
 * ```
 *
 * 
 * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client).
 */
export class PrismaClient<
  T extends Prisma.PrismaClientOptions = Prisma.PrismaClientOptions,
  U = 'log' extends keyof T ? T['log'] extends Array<Prisma.LogLevel | Prisma.LogDefinition> ? Prisma.GetEvents<T['log']> : never : never,
  ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs
> {
  [K: symbol]: { types: Prisma.TypeMap<ExtArgs>['other'] }

    /**
   * ##  Prisma Client ʲˢ
   * 
   * Type-safe database client for TypeScript & Node.js
   * @example
   * ```
   * const prisma = new PrismaClient()
   * // Fetch zero or more ApiCallLogs
   * const apiCallLogs = await prisma.apiCallLog.findMany()
   * ```
   *
   * 
   * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client).
   */

  constructor(optionsArg ?: Prisma.Subset<T, Prisma.PrismaClientOptions>);
  $on<V extends U>(eventType: V, callback: (event: V extends 'query' ? Prisma.QueryEvent : Prisma.LogEvent) => void): void;

  /**
   * Connect with the database
   */
  $connect(): $Utils.JsPromise<void>;

  /**
   * Disconnect from the database
   */
  $disconnect(): $Utils.JsPromise<void>;

  /**
   * Add a middleware
   * @deprecated since 4.16.0. For new code, prefer client extensions instead.
   * @see https://pris.ly/d/extensions
   */
  $use(cb: Prisma.Middleware): void

/**
   * Executes a prepared raw query and returns the number of affected rows.
   * @example
   * ```
   * const result = await prisma.$executeRaw`UPDATE User SET cool = ${true} WHERE email = ${'user@email.com'};`
   * ```
   * 
   * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client/raw-database-access).
   */
  $executeRaw<T = unknown>(query: TemplateStringsArray | Prisma.Sql, ...values: any[]): Prisma.PrismaPromise<number>;

  /**
   * Executes a raw query and returns the number of affected rows.
   * Susceptible to SQL injections, see documentation.
   * @example
   * ```
   * const result = await prisma.$executeRawUnsafe('UPDATE User SET cool = $1 WHERE email = $2 ;', true, 'user@email.com')
   * ```
   * 
   * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client/raw-database-access).
   */
  $executeRawUnsafe<T = unknown>(query: string, ...values: any[]): Prisma.PrismaPromise<number>;

  /**
   * Performs a prepared raw query and returns the `SELECT` data.
   * @example
   * ```
   * const result = await prisma.$queryRaw`SELECT * FROM User WHERE id = ${1} OR email = ${'user@email.com'};`
   * ```
   * 
   * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client/raw-database-access).
   */
  $queryRaw<T = unknown>(query: TemplateStringsArray | Prisma.Sql, ...values: any[]): Prisma.PrismaPromise<T>;

  /**
   * Performs a raw query and returns the `SELECT` data.
   * Susceptible to SQL injections, see documentation.
   * @example
   * ```
   * const result = await prisma.$queryRawUnsafe('SELECT * FROM User WHERE id = $1 OR email = $2;', 1, 'user@email.com')
   * ```
   * 
   * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client/raw-database-access).
   */
  $queryRawUnsafe<T = unknown>(query: string, ...values: any[]): Prisma.PrismaPromise<T>;

  /**
   * Allows the running of a sequence of read/write operations that are guaranteed to either succeed or fail as a whole.
   * @example
   * ```
   * const [george, bob, alice] = await prisma.$transaction([
   *   prisma.user.create({ data: { name: 'George' } }),
   *   prisma.user.create({ data: { name: 'Bob' } }),
   *   prisma.user.create({ data: { name: 'Alice' } }),
   * ])
   * ```
   * 
   * Read more in our [docs](https://www.prisma.io/docs/concepts/components/prisma-client/transactions).
   */
  $transaction<P extends Prisma.PrismaPromise<any>[]>(arg: [...P], options?: { isolationLevel?: Prisma.TransactionIsolationLevel }): $Utils.JsPromise<runtime.Types.Utils.UnwrapTuple<P>>

  $transaction<R>(fn: (prisma: Omit<PrismaClient, runtime.ITXClientDenyList>) => $Utils.JsPromise<R>, options?: { maxWait?: number, timeout?: number, isolationLevel?: Prisma.TransactionIsolationLevel }): $Utils.JsPromise<R>


  $extends: $Extensions.ExtendsHook<'extends', Prisma.TypeMapCb, ExtArgs>

      /**
   * `prisma.apiCallLog`: Exposes CRUD operations for the **ApiCallLog** model.
    * Example usage:
    * ```ts
    * // Fetch zero or more ApiCallLogs
    * const apiCallLogs = await prisma.apiCallLog.findMany()
    * ```
    */
  get apiCallLog(): Prisma.ApiCallLogDelegate<ExtArgs>;
}

export namespace Prisma {
  export import DMMF = runtime.DMMF

  export type PrismaPromise<T> = $Public.PrismaPromise<T>

  /**
   * Validator
   */
  export import validator = runtime.Public.validator

  /**
   * Prisma Errors
   */
  export import PrismaClientKnownRequestError = runtime.PrismaClientKnownRequestError
  export import PrismaClientUnknownRequestError = runtime.PrismaClientUnknownRequestError
  export import PrismaClientRustPanicError = runtime.PrismaClientRustPanicError
  export import PrismaClientInitializationError = runtime.PrismaClientInitializationError
  export import PrismaClientValidationError = runtime.PrismaClientValidationError
  export import NotFoundError = runtime.NotFoundError

  /**
   * Re-export of sql-template-tag
   */
  export import sql = runtime.sqltag
  export import empty = runtime.empty
  export import join = runtime.join
  export import raw = runtime.raw
  export import Sql = runtime.Sql

  /**
   * Decimal.js
   */
  export import Decimal = runtime.Decimal

  export type DecimalJsLike = runtime.DecimalJsLike

  /**
   * Metrics 
   */
  export type Metrics = runtime.Metrics
  export type Metric<T> = runtime.Metric<T>
  export type MetricHistogram = runtime.MetricHistogram
  export type MetricHistogramBucket = runtime.MetricHistogramBucket

  /**
  * Extensions
  */
  export import Extension = $Extensions.UserArgs
  export import getExtensionContext = runtime.Extensions.getExtensionContext
  export import Args = $Public.Args
  export import Payload = $Public.Payload
  export import Result = $Public.Result
  export import Exact = $Public.Exact

  /**
   * Prisma Client JS version: 5.13.0
   * Query Engine version: b9a39a7ee606c28e3455d0fd60e78c3ba82b1a2b
   */
  export type PrismaVersion = {
    client: string
  }

  export const prismaVersion: PrismaVersion 

  /**
   * Utility Types
   */

  /**
   * From https://github.com/sindresorhus/type-fest/
   * Matches a JSON object.
   * This type can be useful to enforce some input to be JSON-compatible or as a super-type to be extended from. 
   */
  export type JsonObject = {[Key in string]?: JsonValue}

  /**
   * From https://github.com/sindresorhus/type-fest/
   * Matches a JSON array.
   */
  export interface JsonArray extends Array<JsonValue> {}

  /**
   * From https://github.com/sindresorhus/type-fest/
   * Matches any valid JSON value.
   */
  export type JsonValue = string | number | boolean | JsonObject | JsonArray | null

  /**
   * Matches a JSON object.
   * Unlike `JsonObject`, this type allows undefined and read-only properties.
   */
  export type InputJsonObject = {readonly [Key in string]?: InputJsonValue | null}

  /**
   * Matches a JSON array.
   * Unlike `JsonArray`, readonly arrays are assignable to this type.
   */
  export interface InputJsonArray extends ReadonlyArray<InputJsonValue | null> {}

  /**
   * Matches any valid value that can be used as an input for operations like
   * create and update as the value of a JSON field. Unlike `JsonValue`, this
   * type allows read-only arrays and read-only object properties and disallows
   * `null` at the top level.
   *
   * `null` cannot be used as the value of a JSON field because its meaning
   * would be ambiguous. Use `Prisma.JsonNull` to store the JSON null value or
   * `Prisma.DbNull` to clear the JSON value and set the field to the database
   * NULL value instead.
   *
   * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-by-null-values
   */
  export type InputJsonValue = string | number | boolean | InputJsonObject | InputJsonArray | { toJSON(): unknown }

  /**
   * Types of the values used to represent different kinds of `null` values when working with JSON fields.
   * 
   * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
   */
  namespace NullTypes {
    /**
    * Type of `Prisma.DbNull`.
    * 
    * You cannot use other instances of this class. Please use the `Prisma.DbNull` value.
    * 
    * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
    */
    class DbNull {
      private DbNull: never
      private constructor()
    }

    /**
    * Type of `Prisma.JsonNull`.
    * 
    * You cannot use other instances of this class. Please use the `Prisma.JsonNull` value.
    * 
    * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
    */
    class JsonNull {
      private JsonNull: never
      private constructor()
    }

    /**
    * Type of `Prisma.AnyNull`.
    * 
    * You cannot use other instances of this class. Please use the `Prisma.AnyNull` value.
    * 
    * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
    */
    class AnyNull {
      private AnyNull: never
      private constructor()
    }
  }

  /**
   * Helper for filtering JSON entries that have `null` on the database (empty on the db)
   * 
   * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
   */
  export const DbNull: NullTypes.DbNull

  /**
   * Helper for filtering JSON entries that have JSON `null` values (not empty on the db)
   * 
   * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
   */
  export const JsonNull: NullTypes.JsonNull

  /**
   * Helper for filtering JSON entries that are `Prisma.DbNull` or `Prisma.JsonNull`
   * 
   * @see https://www.prisma.io/docs/concepts/components/prisma-client/working-with-fields/working-with-json-fields#filtering-on-a-json-field
   */
  export const AnyNull: NullTypes.AnyNull

  type SelectAndInclude = {
    select: any
    include: any
  }

  type SelectAndOmit = {
    select: any
    omit: any
  }

  /**
   * Get the type of the value, that the Promise holds.
   */
  export type PromiseType<T extends PromiseLike<any>> = T extends PromiseLike<infer U> ? U : T;

  /**
   * Get the return type of a function which returns a Promise.
   */
  export type PromiseReturnType<T extends (...args: any) => $Utils.JsPromise<any>> = PromiseType<ReturnType<T>>

  /**
   * From T, pick a set of properties whose keys are in the union K
   */
  type Prisma__Pick<T, K extends keyof T> = {
      [P in K]: T[P];
  };


  export type Enumerable<T> = T | Array<T>;

  export type RequiredKeys<T> = {
    [K in keyof T]-?: {} extends Prisma__Pick<T, K> ? never : K
  }[keyof T]

  export type TruthyKeys<T> = keyof {
    [K in keyof T as T[K] extends false | undefined | null ? never : K]: K
  }

  export type TrueKeys<T> = TruthyKeys<Prisma__Pick<T, RequiredKeys<T>>>

  /**
   * Subset
   * @desc From `T` pick properties that exist in `U`. Simple version of Intersection
   */
  export type Subset<T, U> = {
    [key in keyof T]: key extends keyof U ? T[key] : never;
  };

  /**
   * SelectSubset
   * @desc From `T` pick properties that exist in `U`. Simple version of Intersection.
   * Additionally, it validates, if both select and include are present. If the case, it errors.
   */
  export type SelectSubset<T, U> = {
    [key in keyof T]: key extends keyof U ? T[key] : never
  } &
    (T extends SelectAndInclude
      ? 'Please either choose `select` or `include`.'
      : T extends SelectAndOmit
        ? 'Please either choose `select` or `omit`.'
        : {})

  /**
   * Subset + Intersection
   * @desc From `T` pick properties that exist in `U` and intersect `K`
   */
  export type SubsetIntersection<T, U, K> = {
    [key in keyof T]: key extends keyof U ? T[key] : never
  } &
    K

  type Without<T, U> = { [P in Exclude<keyof T, keyof U>]?: never };

  /**
   * XOR is needed to have a real mutually exclusive union type
   * https://stackoverflow.com/questions/42123407/does-typescript-support-mutually-exclusive-types
   */
  type XOR<T, U> =
    T extends object ?
    U extends object ?
      (Without<T, U> & U) | (Without<U, T> & T)
    : U : T


  /**
   * Is T a Record?
   */
  type IsObject<T extends any> = T extends Array<any>
  ? False
  : T extends Date
  ? False
  : T extends Uint8Array
  ? False
  : T extends BigInt
  ? False
  : T extends object
  ? True
  : False


  /**
   * If it's T[], return T
   */
  export type UnEnumerate<T extends unknown> = T extends Array<infer U> ? U : T

  /**
   * From ts-toolbelt
   */

  type __Either<O extends object, K extends Key> = Omit<O, K> &
    {
      // Merge all but K
      [P in K]: Prisma__Pick<O, P & keyof O> // With K possibilities
    }[K]

  type EitherStrict<O extends object, K extends Key> = Strict<__Either<O, K>>

  type EitherLoose<O extends object, K extends Key> = ComputeRaw<__Either<O, K>>

  type _Either<
    O extends object,
    K extends Key,
    strict extends Boolean
  > = {
    1: EitherStrict<O, K>
    0: EitherLoose<O, K>
  }[strict]

  type Either<
    O extends object,
    K extends Key,
    strict extends Boolean = 1
  > = O extends unknown ? _Either<O, K, strict> : never

  export type Union = any

  type PatchUndefined<O extends object, O1 extends object> = {
    [K in keyof O]: O[K] extends undefined ? At<O1, K> : O[K]
  } & {}

  /** Helper Types for "Merge" **/
  export type IntersectOf<U extends Union> = (
    U extends unknown ? (k: U) => void : never
  ) extends (k: infer I) => void
    ? I
    : never

  export type Overwrite<O extends object, O1 extends object> = {
      [K in keyof O]: K extends keyof O1 ? O1[K] : O[K];
  } & {};

  type _Merge<U extends object> = IntersectOf<Overwrite<U, {
      [K in keyof U]-?: At<U, K>;
  }>>;

  type Key = string | number | symbol;
  type AtBasic<O extends object, K extends Key> = K extends keyof O ? O[K] : never;
  type AtStrict<O extends object, K extends Key> = O[K & keyof O];
  type AtLoose<O extends object, K extends Key> = O extends unknown ? AtStrict<O, K> : never;
  export type At<O extends object, K extends Key, strict extends Boolean = 1> = {
      1: AtStrict<O, K>;
      0: AtLoose<O, K>;
  }[strict];

  export type ComputeRaw<A extends any> = A extends Function ? A : {
    [K in keyof A]: A[K];
  } & {};

  export type OptionalFlat<O> = {
    [K in keyof O]?: O[K];
  } & {};

  type _Record<K extends keyof any, T> = {
    [P in K]: T;
  };

  // cause typescript not to expand types and preserve names
  type NoExpand<T> = T extends unknown ? T : never;

  // this type assumes the passed object is entirely optional
  type AtLeast<O extends object, K extends string> = NoExpand<
    O extends unknown
    ? | (K extends keyof O ? { [P in K]: O[P] } & O : O)
      | {[P in keyof O as P extends K ? K : never]-?: O[P]} & O
    : never>;

  type _Strict<U, _U = U> = U extends unknown ? U & OptionalFlat<_Record<Exclude<Keys<_U>, keyof U>, never>> : never;

  export type Strict<U extends object> = ComputeRaw<_Strict<U>>;
  /** End Helper Types for "Merge" **/

  export type Merge<U extends object> = ComputeRaw<_Merge<Strict<U>>>;

  /**
  A [[Boolean]]
  */
  export type Boolean = True | False

  // /**
  // 1
  // */
  export type True = 1

  /**
  0
  */
  export type False = 0

  export type Not<B extends Boolean> = {
    0: 1
    1: 0
  }[B]

  export type Extends<A1 extends any, A2 extends any> = [A1] extends [never]
    ? 0 // anything `never` is false
    : A1 extends A2
    ? 1
    : 0

  export type Has<U extends Union, U1 extends Union> = Not<
    Extends<Exclude<U1, U>, U1>
  >

  export type Or<B1 extends Boolean, B2 extends Boolean> = {
    0: {
      0: 0
      1: 1
    }
    1: {
      0: 1
      1: 1
    }
  }[B1][B2]

  export type Keys<U extends Union> = U extends unknown ? keyof U : never

  type Cast<A, B> = A extends B ? A : B;

  export const type: unique symbol;



  /**
   * Used by group by
   */

  export type GetScalarType<T, O> = O extends object ? {
    [P in keyof T]: P extends keyof O
      ? O[P]
      : never
  } : never

  type FieldPaths<
    T,
    U = Omit<T, '_avg' | '_sum' | '_count' | '_min' | '_max'>
  > = IsObject<T> extends True ? U : T

  type GetHavingFields<T> = {
    [K in keyof T]: Or<
      Or<Extends<'OR', K>, Extends<'AND', K>>,
      Extends<'NOT', K>
    > extends True
      ? // infer is only needed to not hit TS limit
        // based on the brilliant idea of Pierre-Antoine Mills
        // https://github.com/microsoft/TypeScript/issues/30188#issuecomment-478938437
        T[K] extends infer TK
        ? GetHavingFields<UnEnumerate<TK> extends object ? Merge<UnEnumerate<TK>> : never>
        : never
      : {} extends FieldPaths<T[K]>
      ? never
      : K
  }[keyof T]

  /**
   * Convert tuple to union
   */
  type _TupleToUnion<T> = T extends (infer E)[] ? E : never
  type TupleToUnion<K extends readonly any[]> = _TupleToUnion<K>
  type MaybeTupleToUnion<T> = T extends any[] ? TupleToUnion<T> : T

  /**
   * Like `Pick`, but additionally can also accept an array of keys
   */
  type PickEnumerable<T, K extends Enumerable<keyof T> | keyof T> = Prisma__Pick<T, MaybeTupleToUnion<K>>

  /**
   * Exclude all keys with underscores
   */
  type ExcludeUnderscoreKeys<T extends string> = T extends `_${string}` ? never : T


  export type FieldRef<Model, FieldType> = runtime.FieldRef<Model, FieldType>

  type FieldRefInputType<Model, FieldType> = Model extends never ? never : FieldRef<Model, FieldType>


  export const ModelName: {
    ApiCallLog: 'ApiCallLog'
  };

  export type ModelName = (typeof ModelName)[keyof typeof ModelName]


  export type Datasources = {
    db?: Datasource
  }


  interface TypeMapCb extends $Utils.Fn<{extArgs: $Extensions.InternalArgs}, $Utils.Record<string, any>> {
    returns: Prisma.TypeMap<this['params']['extArgs']>
  }

  export type TypeMap<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    meta: {
      modelProps: 'apiCallLog'
      txIsolationLevel: Prisma.TransactionIsolationLevel
    },
    model: {
      ApiCallLog: {
        payload: Prisma.$ApiCallLogPayload<ExtArgs>
        fields: Prisma.ApiCallLogFieldRefs
        operations: {
          findUnique: {
            args: Prisma.ApiCallLogFindUniqueArgs<ExtArgs>,
            result: $Utils.PayloadToResult<Prisma.$ApiCallLogPayload> | null
          }
          findUniqueOrThrow: {
            args: Prisma.ApiCallLogFindUniqueOrThrowArgs<ExtArgs>,
            result: $Utils.PayloadToResult<Prisma.$ApiCallLogPayload>
          }
          findFirst: {
            args: Prisma.ApiCallLogFindFirstArgs<ExtArgs>,
            result: $Utils.PayloadToResult<Prisma.$ApiCallLogPayload> | null
          }
          findFirstOrThrow: {
            args: Prisma.ApiCallLogFindFirstOrThrowArgs<ExtArgs>,
            result: $Utils.PayloadToResult<Prisma.$ApiCallLogPayload>
          }
          findMany: {
            args: Prisma.ApiCallLogFindManyArgs<ExtArgs>,
            result: $Utils.PayloadToResult<Prisma.$ApiCallLogPayload>[]
          }
          create: {
            args: Prisma.ApiCallLogCreateArgs<ExtArgs>,
            result: $Utils.PayloadToResult<Prisma.$ApiCallLogPayload>
          }
          createMany: {
            args: Prisma.ApiCallLogCreateManyArgs<ExtArgs>,
            result: Prisma.BatchPayload
          }
          delete: {
            args: Prisma.ApiCallLogDeleteArgs<ExtArgs>,
            result: $Utils.PayloadToResult<Prisma.$ApiCallLogPayload>
          }
          update: {
            args: Prisma.ApiCallLogUpdateArgs<ExtArgs>,
            result: $Utils.PayloadToResult<Prisma.$ApiCallLogPayload>
          }
          deleteMany: {
            args: Prisma.ApiCallLogDeleteManyArgs<ExtArgs>,
            result: Prisma.BatchPayload
          }
          updateMany: {
            args: Prisma.ApiCallLogUpdateManyArgs<ExtArgs>,
            result: Prisma.BatchPayload
          }
          upsert: {
            args: Prisma.ApiCallLogUpsertArgs<ExtArgs>,
            result: $Utils.PayloadToResult<Prisma.$ApiCallLogPayload>
          }
          aggregate: {
            args: Prisma.ApiCallLogAggregateArgs<ExtArgs>,
            result: $Utils.Optional<AggregateApiCallLog>
          }
          groupBy: {
            args: Prisma.ApiCallLogGroupByArgs<ExtArgs>,
            result: $Utils.Optional<ApiCallLogGroupByOutputType>[]
          }
          count: {
            args: Prisma.ApiCallLogCountArgs<ExtArgs>,
            result: $Utils.Optional<ApiCallLogCountAggregateOutputType> | number
          }
        }
      }
    }
  } & {
    other: {
      payload: any
      operations: {
        $executeRawUnsafe: {
          args: [query: string, ...values: any[]],
          result: any
        }
        $executeRaw: {
          args: [query: TemplateStringsArray | Prisma.Sql, ...values: any[]],
          result: any
        }
        $queryRawUnsafe: {
          args: [query: string, ...values: any[]],
          result: any
        }
        $queryRaw: {
          args: [query: TemplateStringsArray | Prisma.Sql, ...values: any[]],
          result: any
        }
      }
    }
  }
  export const defineExtension: $Extensions.ExtendsHook<'define', Prisma.TypeMapCb, $Extensions.DefaultArgs>
  export type DefaultPrismaClient = PrismaClient
  export type ErrorFormat = 'pretty' | 'colorless' | 'minimal'
  export interface PrismaClientOptions {
    /**
     * Overwrites the datasource url from your schema.prisma file
     */
    datasources?: Datasources
    /**
     * Overwrites the datasource url from your schema.prisma file
     */
    datasourceUrl?: string
    /**
     * @default "colorless"
     */
    errorFormat?: ErrorFormat
    /**
     * @example
     * ```
     * // Defaults to stdout
     * log: ['query', 'info', 'warn', 'error']
     * 
     * // Emit as events
     * log: [
     *   { emit: 'stdout', level: 'query' },
     *   { emit: 'stdout', level: 'info' },
     *   { emit: 'stdout', level: 'warn' }
     *   { emit: 'stdout', level: 'error' }
     * ]
     * ```
     * Read more in our [docs](https://www.prisma.io/docs/reference/tools-and-interfaces/prisma-client/logging#the-log-option).
     */
    log?: (LogLevel | LogDefinition)[]
    /**
     * The default values for transactionOptions
     * maxWait ?= 2000
     * timeout ?= 5000
     */
    transactionOptions?: {
      maxWait?: number
      timeout?: number
      isolationLevel?: Prisma.TransactionIsolationLevel
    }
  }

  /* Types for Logging */
  export type LogLevel = 'info' | 'query' | 'warn' | 'error'
  export type LogDefinition = {
    level: LogLevel
    emit: 'stdout' | 'event'
  }

  export type GetLogType<T extends LogLevel | LogDefinition> = T extends LogDefinition ? T['emit'] extends 'event' ? T['level'] : never : never
  export type GetEvents<T extends any> = T extends Array<LogLevel | LogDefinition> ?
    GetLogType<T[0]> | GetLogType<T[1]> | GetLogType<T[2]> | GetLogType<T[3]>
    : never

  export type QueryEvent = {
    timestamp: Date
    query: string
    params: string
    duration: number
    target: string
  }

  export type LogEvent = {
    timestamp: Date
    message: string
    target: string
  }
  /* End Types for Logging */


  export type PrismaAction =
    | 'findUnique'
    | 'findUniqueOrThrow'
    | 'findMany'
    | 'findFirst'
    | 'findFirstOrThrow'
    | 'create'
    | 'createMany'
    | 'update'
    | 'updateMany'
    | 'upsert'
    | 'delete'
    | 'deleteMany'
    | 'executeRaw'
    | 'queryRaw'
    | 'aggregate'
    | 'count'
    | 'runCommandRaw'
    | 'findRaw'
    | 'groupBy'

  /**
   * These options are being passed into the middleware as "params"
   */
  export type MiddlewareParams = {
    model?: ModelName
    action: PrismaAction
    args: any
    dataPath: string[]
    runInTransaction: boolean
  }

  /**
   * The `T` type makes sure, that the `return proceed` is not forgotten in the middleware implementation
   */
  export type Middleware<T = any> = (
    params: MiddlewareParams,
    next: (params: MiddlewareParams) => $Utils.JsPromise<T>,
  ) => $Utils.JsPromise<T>

  // tested in getLogLevel.test.ts
  export function getLogLevel(log: Array<LogLevel | LogDefinition>): LogLevel | undefined;

  /**
   * `PrismaClient` proxy available in interactive transactions.
   */
  export type TransactionClient = Omit<Prisma.DefaultPrismaClient, runtime.ITXClientDenyList>

  export type Datasource = {
    url?: string
  }

  /**
   * Count Types
   */



  /**
   * Models
   */

  /**
   * Model ApiCallLog
   */

  export type AggregateApiCallLog = {
    _count: ApiCallLogCountAggregateOutputType | null
    _avg: ApiCallLogAvgAggregateOutputType | null
    _sum: ApiCallLogSumAggregateOutputType | null
    _min: ApiCallLogMinAggregateOutputType | null
    _max: ApiCallLogMaxAggregateOutputType | null
  }

  export type ApiCallLogAvgAggregateOutputType = {
    timeTaken: number | null
    dateCreated: number | null
    dateUpdated: number | null
  }

  export type ApiCallLogSumAggregateOutputType = {
    timeTaken: number | null
    dateCreated: bigint | null
    dateUpdated: bigint | null
  }

  export type ApiCallLogMinAggregateOutputType = {
    apiCallLogId: string | null
    endpoint: string | null
    timeTaken: number | null
    username: string | null
    agent: string | null
    appVersion: string | null
    request: string | null
    response: string | null
    method: string | null
    mobile: string | null
    device: string | null
    createdById: string | null
    dateCreated: bigint | null
    dateUpdated: bigint | null
  }

  export type ApiCallLogMaxAggregateOutputType = {
    apiCallLogId: string | null
    endpoint: string | null
    timeTaken: number | null
    username: string | null
    agent: string | null
    appVersion: string | null
    request: string | null
    response: string | null
    method: string | null
    mobile: string | null
    device: string | null
    createdById: string | null
    dateCreated: bigint | null
    dateUpdated: bigint | null
  }

  export type ApiCallLogCountAggregateOutputType = {
    apiCallLogId: number
    endpoint: number
    timeTaken: number
    username: number
    agent: number
    appVersion: number
    request: number
    response: number
    method: number
    mobile: number
    device: number
    createdById: number
    dateCreated: number
    dateUpdated: number
    _all: number
  }


  export type ApiCallLogAvgAggregateInputType = {
    timeTaken?: true
    dateCreated?: true
    dateUpdated?: true
  }

  export type ApiCallLogSumAggregateInputType = {
    timeTaken?: true
    dateCreated?: true
    dateUpdated?: true
  }

  export type ApiCallLogMinAggregateInputType = {
    apiCallLogId?: true
    endpoint?: true
    timeTaken?: true
    username?: true
    agent?: true
    appVersion?: true
    request?: true
    response?: true
    method?: true
    mobile?: true
    device?: true
    createdById?: true
    dateCreated?: true
    dateUpdated?: true
  }

  export type ApiCallLogMaxAggregateInputType = {
    apiCallLogId?: true
    endpoint?: true
    timeTaken?: true
    username?: true
    agent?: true
    appVersion?: true
    request?: true
    response?: true
    method?: true
    mobile?: true
    device?: true
    createdById?: true
    dateCreated?: true
    dateUpdated?: true
  }

  export type ApiCallLogCountAggregateInputType = {
    apiCallLogId?: true
    endpoint?: true
    timeTaken?: true
    username?: true
    agent?: true
    appVersion?: true
    request?: true
    response?: true
    method?: true
    mobile?: true
    device?: true
    createdById?: true
    dateCreated?: true
    dateUpdated?: true
    _all?: true
  }

  export type ApiCallLogAggregateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which ApiCallLog to aggregate.
     */
    where?: ApiCallLogWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of ApiCallLogs to fetch.
     */
    orderBy?: ApiCallLogOrderByWithRelationInput | ApiCallLogOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the start position
     */
    cursor?: ApiCallLogWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` ApiCallLogs from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` ApiCallLogs.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Count returned ApiCallLogs
    **/
    _count?: true | ApiCallLogCountAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to average
    **/
    _avg?: ApiCallLogAvgAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to sum
    **/
    _sum?: ApiCallLogSumAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the minimum value
    **/
    _min?: ApiCallLogMinAggregateInputType
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/aggregations Aggregation Docs}
     * 
     * Select which fields to find the maximum value
    **/
    _max?: ApiCallLogMaxAggregateInputType
  }

  export type GetApiCallLogAggregateType<T extends ApiCallLogAggregateArgs> = {
        [P in keyof T & keyof AggregateApiCallLog]: P extends '_count' | 'count'
      ? T[P] extends true
        ? number
        : GetScalarType<T[P], AggregateApiCallLog[P]>
      : GetScalarType<T[P], AggregateApiCallLog[P]>
  }




  export type ApiCallLogGroupByArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    where?: ApiCallLogWhereInput
    orderBy?: ApiCallLogOrderByWithAggregationInput | ApiCallLogOrderByWithAggregationInput[]
    by: ApiCallLogScalarFieldEnum[] | ApiCallLogScalarFieldEnum
    having?: ApiCallLogScalarWhereWithAggregatesInput
    take?: number
    skip?: number
    _count?: ApiCallLogCountAggregateInputType | true
    _avg?: ApiCallLogAvgAggregateInputType
    _sum?: ApiCallLogSumAggregateInputType
    _min?: ApiCallLogMinAggregateInputType
    _max?: ApiCallLogMaxAggregateInputType
  }

  export type ApiCallLogGroupByOutputType = {
    apiCallLogId: string
    endpoint: string
    timeTaken: number | null
    username: string | null
    agent: string | null
    appVersion: string | null
    request: string
    response: string | null
    method: string
    mobile: string | null
    device: string | null
    createdById: string | null
    dateCreated: bigint | null
    dateUpdated: bigint | null
    _count: ApiCallLogCountAggregateOutputType | null
    _avg: ApiCallLogAvgAggregateOutputType | null
    _sum: ApiCallLogSumAggregateOutputType | null
    _min: ApiCallLogMinAggregateOutputType | null
    _max: ApiCallLogMaxAggregateOutputType | null
  }

  type GetApiCallLogGroupByPayload<T extends ApiCallLogGroupByArgs> = Prisma.PrismaPromise<
    Array<
      PickEnumerable<ApiCallLogGroupByOutputType, T['by']> &
        {
          [P in ((keyof T) & (keyof ApiCallLogGroupByOutputType))]: P extends '_count'
            ? T[P] extends boolean
              ? number
              : GetScalarType<T[P], ApiCallLogGroupByOutputType[P]>
            : GetScalarType<T[P], ApiCallLogGroupByOutputType[P]>
        }
      >
    >


  export type ApiCallLogSelect<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = $Extensions.GetSelect<{
    apiCallLogId?: boolean
    endpoint?: boolean
    timeTaken?: boolean
    username?: boolean
    agent?: boolean
    appVersion?: boolean
    request?: boolean
    response?: boolean
    method?: boolean
    mobile?: boolean
    device?: boolean
    createdById?: boolean
    dateCreated?: boolean
    dateUpdated?: boolean
  }, ExtArgs["result"]["apiCallLog"]>

  export type ApiCallLogSelectScalar = {
    apiCallLogId?: boolean
    endpoint?: boolean
    timeTaken?: boolean
    username?: boolean
    agent?: boolean
    appVersion?: boolean
    request?: boolean
    response?: boolean
    method?: boolean
    mobile?: boolean
    device?: boolean
    createdById?: boolean
    dateCreated?: boolean
    dateUpdated?: boolean
  }



  export type $ApiCallLogPayload<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    name: "ApiCallLog"
    objects: {}
    scalars: $Extensions.GetPayloadResult<{
      apiCallLogId: string
      endpoint: string
      timeTaken: number | null
      username: string | null
      agent: string | null
      appVersion: string | null
      request: string
      response: string | null
      method: string
      mobile: string | null
      device: string | null
      createdById: string | null
      dateCreated: bigint | null
      dateUpdated: bigint | null
    }, ExtArgs["result"]["apiCallLog"]>
    composites: {}
  }


  type ApiCallLogGetPayload<S extends boolean | null | undefined | ApiCallLogDefaultArgs> = $Result.GetResult<Prisma.$ApiCallLogPayload, S>

  type ApiCallLogCountArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = 
    Omit<ApiCallLogFindManyArgs, 'select' | 'include' | 'distinct'> & {
      select?: ApiCallLogCountAggregateInputType | true
    }

  export interface ApiCallLogDelegate<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> {
    [K: symbol]: { types: Prisma.TypeMap<ExtArgs>['model']['ApiCallLog'], meta: { name: 'ApiCallLog' } }
    /**
     * Find zero or one ApiCallLog that matches the filter.
     * @param {ApiCallLogFindUniqueArgs} args - Arguments to find a ApiCallLog
     * @example
     * // Get one ApiCallLog
     * const apiCallLog = await prisma.apiCallLog.findUnique({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
    **/
    findUnique<T extends ApiCallLogFindUniqueArgs<ExtArgs>>(
      args: SelectSubset<T, ApiCallLogFindUniqueArgs<ExtArgs>>
    ): Prisma__ApiCallLogClient<$Result.GetResult<Prisma.$ApiCallLogPayload<ExtArgs>, T, 'findUnique'> | null, null, ExtArgs>

    /**
     * Find one ApiCallLog that matches the filter or throw an error  with `error.code='P2025'` 
     *     if no matches were found.
     * @param {ApiCallLogFindUniqueOrThrowArgs} args - Arguments to find a ApiCallLog
     * @example
     * // Get one ApiCallLog
     * const apiCallLog = await prisma.apiCallLog.findUniqueOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
    **/
    findUniqueOrThrow<T extends ApiCallLogFindUniqueOrThrowArgs<ExtArgs>>(
      args?: SelectSubset<T, ApiCallLogFindUniqueOrThrowArgs<ExtArgs>>
    ): Prisma__ApiCallLogClient<$Result.GetResult<Prisma.$ApiCallLogPayload<ExtArgs>, T, 'findUniqueOrThrow'>, never, ExtArgs>

    /**
     * Find the first ApiCallLog that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ApiCallLogFindFirstArgs} args - Arguments to find a ApiCallLog
     * @example
     * // Get one ApiCallLog
     * const apiCallLog = await prisma.apiCallLog.findFirst({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
    **/
    findFirst<T extends ApiCallLogFindFirstArgs<ExtArgs>>(
      args?: SelectSubset<T, ApiCallLogFindFirstArgs<ExtArgs>>
    ): Prisma__ApiCallLogClient<$Result.GetResult<Prisma.$ApiCallLogPayload<ExtArgs>, T, 'findFirst'> | null, null, ExtArgs>

    /**
     * Find the first ApiCallLog that matches the filter or
     * throw `PrismaKnownClientError` with `P2025` code if no matches were found.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ApiCallLogFindFirstOrThrowArgs} args - Arguments to find a ApiCallLog
     * @example
     * // Get one ApiCallLog
     * const apiCallLog = await prisma.apiCallLog.findFirstOrThrow({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
    **/
    findFirstOrThrow<T extends ApiCallLogFindFirstOrThrowArgs<ExtArgs>>(
      args?: SelectSubset<T, ApiCallLogFindFirstOrThrowArgs<ExtArgs>>
    ): Prisma__ApiCallLogClient<$Result.GetResult<Prisma.$ApiCallLogPayload<ExtArgs>, T, 'findFirstOrThrow'>, never, ExtArgs>

    /**
     * Find zero or more ApiCallLogs that matches the filter.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ApiCallLogFindManyArgs=} args - Arguments to filter and select certain fields only.
     * @example
     * // Get all ApiCallLogs
     * const apiCallLogs = await prisma.apiCallLog.findMany()
     * 
     * // Get first 10 ApiCallLogs
     * const apiCallLogs = await prisma.apiCallLog.findMany({ take: 10 })
     * 
     * // Only select the `apiCallLogId`
     * const apiCallLogWithApiCallLogIdOnly = await prisma.apiCallLog.findMany({ select: { apiCallLogId: true } })
     * 
    **/
    findMany<T extends ApiCallLogFindManyArgs<ExtArgs>>(
      args?: SelectSubset<T, ApiCallLogFindManyArgs<ExtArgs>>
    ): Prisma.PrismaPromise<$Result.GetResult<Prisma.$ApiCallLogPayload<ExtArgs>, T, 'findMany'>>

    /**
     * Create a ApiCallLog.
     * @param {ApiCallLogCreateArgs} args - Arguments to create a ApiCallLog.
     * @example
     * // Create one ApiCallLog
     * const ApiCallLog = await prisma.apiCallLog.create({
     *   data: {
     *     // ... data to create a ApiCallLog
     *   }
     * })
     * 
    **/
    create<T extends ApiCallLogCreateArgs<ExtArgs>>(
      args: SelectSubset<T, ApiCallLogCreateArgs<ExtArgs>>
    ): Prisma__ApiCallLogClient<$Result.GetResult<Prisma.$ApiCallLogPayload<ExtArgs>, T, 'create'>, never, ExtArgs>

    /**
     * Create many ApiCallLogs.
     *     @param {ApiCallLogCreateManyArgs} args - Arguments to create many ApiCallLogs.
     *     @example
     *     // Create many ApiCallLogs
     *     const apiCallLog = await prisma.apiCallLog.createMany({
     *       data: {
     *         // ... provide data here
     *       }
     *     })
     *     
    **/
    createMany<T extends ApiCallLogCreateManyArgs<ExtArgs>>(
      args?: SelectSubset<T, ApiCallLogCreateManyArgs<ExtArgs>>
    ): Prisma.PrismaPromise<BatchPayload>

    /**
     * Delete a ApiCallLog.
     * @param {ApiCallLogDeleteArgs} args - Arguments to delete one ApiCallLog.
     * @example
     * // Delete one ApiCallLog
     * const ApiCallLog = await prisma.apiCallLog.delete({
     *   where: {
     *     // ... filter to delete one ApiCallLog
     *   }
     * })
     * 
    **/
    delete<T extends ApiCallLogDeleteArgs<ExtArgs>>(
      args: SelectSubset<T, ApiCallLogDeleteArgs<ExtArgs>>
    ): Prisma__ApiCallLogClient<$Result.GetResult<Prisma.$ApiCallLogPayload<ExtArgs>, T, 'delete'>, never, ExtArgs>

    /**
     * Update one ApiCallLog.
     * @param {ApiCallLogUpdateArgs} args - Arguments to update one ApiCallLog.
     * @example
     * // Update one ApiCallLog
     * const apiCallLog = await prisma.apiCallLog.update({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
    **/
    update<T extends ApiCallLogUpdateArgs<ExtArgs>>(
      args: SelectSubset<T, ApiCallLogUpdateArgs<ExtArgs>>
    ): Prisma__ApiCallLogClient<$Result.GetResult<Prisma.$ApiCallLogPayload<ExtArgs>, T, 'update'>, never, ExtArgs>

    /**
     * Delete zero or more ApiCallLogs.
     * @param {ApiCallLogDeleteManyArgs} args - Arguments to filter ApiCallLogs to delete.
     * @example
     * // Delete a few ApiCallLogs
     * const { count } = await prisma.apiCallLog.deleteMany({
     *   where: {
     *     // ... provide filter here
     *   }
     * })
     * 
    **/
    deleteMany<T extends ApiCallLogDeleteManyArgs<ExtArgs>>(
      args?: SelectSubset<T, ApiCallLogDeleteManyArgs<ExtArgs>>
    ): Prisma.PrismaPromise<BatchPayload>

    /**
     * Update zero or more ApiCallLogs.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ApiCallLogUpdateManyArgs} args - Arguments to update one or more rows.
     * @example
     * // Update many ApiCallLogs
     * const apiCallLog = await prisma.apiCallLog.updateMany({
     *   where: {
     *     // ... provide filter here
     *   },
     *   data: {
     *     // ... provide data here
     *   }
     * })
     * 
    **/
    updateMany<T extends ApiCallLogUpdateManyArgs<ExtArgs>>(
      args: SelectSubset<T, ApiCallLogUpdateManyArgs<ExtArgs>>
    ): Prisma.PrismaPromise<BatchPayload>

    /**
     * Create or update one ApiCallLog.
     * @param {ApiCallLogUpsertArgs} args - Arguments to update or create a ApiCallLog.
     * @example
     * // Update or create a ApiCallLog
     * const apiCallLog = await prisma.apiCallLog.upsert({
     *   create: {
     *     // ... data to create a ApiCallLog
     *   },
     *   update: {
     *     // ... in case it already exists, update
     *   },
     *   where: {
     *     // ... the filter for the ApiCallLog we want to update
     *   }
     * })
    **/
    upsert<T extends ApiCallLogUpsertArgs<ExtArgs>>(
      args: SelectSubset<T, ApiCallLogUpsertArgs<ExtArgs>>
    ): Prisma__ApiCallLogClient<$Result.GetResult<Prisma.$ApiCallLogPayload<ExtArgs>, T, 'upsert'>, never, ExtArgs>

    /**
     * Count the number of ApiCallLogs.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ApiCallLogCountArgs} args - Arguments to filter ApiCallLogs to count.
     * @example
     * // Count the number of ApiCallLogs
     * const count = await prisma.apiCallLog.count({
     *   where: {
     *     // ... the filter for the ApiCallLogs we want to count
     *   }
     * })
    **/
    count<T extends ApiCallLogCountArgs>(
      args?: Subset<T, ApiCallLogCountArgs>,
    ): Prisma.PrismaPromise<
      T extends $Utils.Record<'select', any>
        ? T['select'] extends true
          ? number
          : GetScalarType<T['select'], ApiCallLogCountAggregateOutputType>
        : number
    >

    /**
     * Allows you to perform aggregations operations on a ApiCallLog.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ApiCallLogAggregateArgs} args - Select which aggregations you would like to apply and on what fields.
     * @example
     * // Ordered by age ascending
     * // Where email contains prisma.io
     * // Limited to the 10 users
     * const aggregations = await prisma.user.aggregate({
     *   _avg: {
     *     age: true,
     *   },
     *   where: {
     *     email: {
     *       contains: "prisma.io",
     *     },
     *   },
     *   orderBy: {
     *     age: "asc",
     *   },
     *   take: 10,
     * })
    **/
    aggregate<T extends ApiCallLogAggregateArgs>(args: Subset<T, ApiCallLogAggregateArgs>): Prisma.PrismaPromise<GetApiCallLogAggregateType<T>>

    /**
     * Group by ApiCallLog.
     * Note, that providing `undefined` is treated as the value not being there.
     * Read more here: https://pris.ly/d/null-undefined
     * @param {ApiCallLogGroupByArgs} args - Group by arguments.
     * @example
     * // Group by city, order by createdAt, get count
     * const result = await prisma.user.groupBy({
     *   by: ['city', 'createdAt'],
     *   orderBy: {
     *     createdAt: true
     *   },
     *   _count: {
     *     _all: true
     *   },
     * })
     * 
    **/
    groupBy<
      T extends ApiCallLogGroupByArgs,
      HasSelectOrTake extends Or<
        Extends<'skip', Keys<T>>,
        Extends<'take', Keys<T>>
      >,
      OrderByArg extends True extends HasSelectOrTake
        ? { orderBy: ApiCallLogGroupByArgs['orderBy'] }
        : { orderBy?: ApiCallLogGroupByArgs['orderBy'] },
      OrderFields extends ExcludeUnderscoreKeys<Keys<MaybeTupleToUnion<T['orderBy']>>>,
      ByFields extends MaybeTupleToUnion<T['by']>,
      ByValid extends Has<ByFields, OrderFields>,
      HavingFields extends GetHavingFields<T['having']>,
      HavingValid extends Has<ByFields, HavingFields>,
      ByEmpty extends T['by'] extends never[] ? True : False,
      InputErrors extends ByEmpty extends True
      ? `Error: "by" must not be empty.`
      : HavingValid extends False
      ? {
          [P in HavingFields]: P extends ByFields
            ? never
            : P extends string
            ? `Error: Field "${P}" used in "having" needs to be provided in "by".`
            : [
                Error,
                'Field ',
                P,
                ` in "having" needs to be provided in "by"`,
              ]
        }[HavingFields]
      : 'take' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "take", you also need to provide "orderBy"'
      : 'skip' extends Keys<T>
      ? 'orderBy' extends Keys<T>
        ? ByValid extends True
          ? {}
          : {
              [P in OrderFields]: P extends ByFields
                ? never
                : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
            }[OrderFields]
        : 'Error: If you provide "skip", you also need to provide "orderBy"'
      : ByValid extends True
      ? {}
      : {
          [P in OrderFields]: P extends ByFields
            ? never
            : `Error: Field "${P}" in "orderBy" needs to be provided in "by"`
        }[OrderFields]
    >(args: SubsetIntersection<T, ApiCallLogGroupByArgs, OrderByArg> & InputErrors): {} extends InputErrors ? GetApiCallLogGroupByPayload<T> : Prisma.PrismaPromise<InputErrors>
  /**
   * Fields of the ApiCallLog model
   */
  readonly fields: ApiCallLogFieldRefs;
  }

  /**
   * The delegate class that acts as a "Promise-like" for ApiCallLog.
   * Why is this prefixed with `Prisma__`?
   * Because we want to prevent naming conflicts as mentioned in
   * https://github.com/prisma/prisma-client-js/issues/707
   */
  export interface Prisma__ApiCallLogClient<T, Null = never, ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> extends Prisma.PrismaPromise<T> {
    readonly [Symbol.toStringTag]: 'PrismaPromise';


    /**
     * Attaches callbacks for the resolution and/or rejection of the Promise.
     * @param onfulfilled The callback to execute when the Promise is resolved.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of which ever callback is executed.
     */
    then<TResult1 = T, TResult2 = never>(onfulfilled?: ((value: T) => TResult1 | PromiseLike<TResult1>) | undefined | null, onrejected?: ((reason: any) => TResult2 | PromiseLike<TResult2>) | undefined | null): $Utils.JsPromise<TResult1 | TResult2>;
    /**
     * Attaches a callback for only the rejection of the Promise.
     * @param onrejected The callback to execute when the Promise is rejected.
     * @returns A Promise for the completion of the callback.
     */
    catch<TResult = never>(onrejected?: ((reason: any) => TResult | PromiseLike<TResult>) | undefined | null): $Utils.JsPromise<T | TResult>;
    /**
     * Attaches a callback that is invoked when the Promise is settled (fulfilled or rejected). The
     * resolved value cannot be modified from the callback.
     * @param onfinally The callback to execute when the Promise is settled (fulfilled or rejected).
     * @returns A Promise for the completion of the callback.
     */
    finally(onfinally?: (() => void) | undefined | null): $Utils.JsPromise<T>;
  }



  /**
   * Fields of the ApiCallLog model
   */ 
  interface ApiCallLogFieldRefs {
    readonly apiCallLogId: FieldRef<"ApiCallLog", 'String'>
    readonly endpoint: FieldRef<"ApiCallLog", 'String'>
    readonly timeTaken: FieldRef<"ApiCallLog", 'Float'>
    readonly username: FieldRef<"ApiCallLog", 'String'>
    readonly agent: FieldRef<"ApiCallLog", 'String'>
    readonly appVersion: FieldRef<"ApiCallLog", 'String'>
    readonly request: FieldRef<"ApiCallLog", 'String'>
    readonly response: FieldRef<"ApiCallLog", 'String'>
    readonly method: FieldRef<"ApiCallLog", 'String'>
    readonly mobile: FieldRef<"ApiCallLog", 'String'>
    readonly device: FieldRef<"ApiCallLog", 'String'>
    readonly createdById: FieldRef<"ApiCallLog", 'String'>
    readonly dateCreated: FieldRef<"ApiCallLog", 'BigInt'>
    readonly dateUpdated: FieldRef<"ApiCallLog", 'BigInt'>
  }
    

  // Custom InputTypes
  /**
   * ApiCallLog findUnique
   */
  export type ApiCallLogFindUniqueArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ApiCallLog
     */
    select?: ApiCallLogSelect<ExtArgs> | null
    /**
     * Filter, which ApiCallLog to fetch.
     */
    where: ApiCallLogWhereUniqueInput
  }

  /**
   * ApiCallLog findUniqueOrThrow
   */
  export type ApiCallLogFindUniqueOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ApiCallLog
     */
    select?: ApiCallLogSelect<ExtArgs> | null
    /**
     * Filter, which ApiCallLog to fetch.
     */
    where: ApiCallLogWhereUniqueInput
  }

  /**
   * ApiCallLog findFirst
   */
  export type ApiCallLogFindFirstArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ApiCallLog
     */
    select?: ApiCallLogSelect<ExtArgs> | null
    /**
     * Filter, which ApiCallLog to fetch.
     */
    where?: ApiCallLogWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of ApiCallLogs to fetch.
     */
    orderBy?: ApiCallLogOrderByWithRelationInput | ApiCallLogOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for ApiCallLogs.
     */
    cursor?: ApiCallLogWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` ApiCallLogs from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` ApiCallLogs.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of ApiCallLogs.
     */
    distinct?: ApiCallLogScalarFieldEnum | ApiCallLogScalarFieldEnum[]
  }

  /**
   * ApiCallLog findFirstOrThrow
   */
  export type ApiCallLogFindFirstOrThrowArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ApiCallLog
     */
    select?: ApiCallLogSelect<ExtArgs> | null
    /**
     * Filter, which ApiCallLog to fetch.
     */
    where?: ApiCallLogWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of ApiCallLogs to fetch.
     */
    orderBy?: ApiCallLogOrderByWithRelationInput | ApiCallLogOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for searching for ApiCallLogs.
     */
    cursor?: ApiCallLogWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` ApiCallLogs from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` ApiCallLogs.
     */
    skip?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/distinct Distinct Docs}
     * 
     * Filter by unique combinations of ApiCallLogs.
     */
    distinct?: ApiCallLogScalarFieldEnum | ApiCallLogScalarFieldEnum[]
  }

  /**
   * ApiCallLog findMany
   */
  export type ApiCallLogFindManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ApiCallLog
     */
    select?: ApiCallLogSelect<ExtArgs> | null
    /**
     * Filter, which ApiCallLogs to fetch.
     */
    where?: ApiCallLogWhereInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/sorting Sorting Docs}
     * 
     * Determine the order of ApiCallLogs to fetch.
     */
    orderBy?: ApiCallLogOrderByWithRelationInput | ApiCallLogOrderByWithRelationInput[]
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination#cursor-based-pagination Cursor Docs}
     * 
     * Sets the position for listing ApiCallLogs.
     */
    cursor?: ApiCallLogWhereUniqueInput
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Take `±n` ApiCallLogs from the position of the cursor.
     */
    take?: number
    /**
     * {@link https://www.prisma.io/docs/concepts/components/prisma-client/pagination Pagination Docs}
     * 
     * Skip the first `n` ApiCallLogs.
     */
    skip?: number
    distinct?: ApiCallLogScalarFieldEnum | ApiCallLogScalarFieldEnum[]
  }

  /**
   * ApiCallLog create
   */
  export type ApiCallLogCreateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ApiCallLog
     */
    select?: ApiCallLogSelect<ExtArgs> | null
    /**
     * The data needed to create a ApiCallLog.
     */
    data: XOR<ApiCallLogCreateInput, ApiCallLogUncheckedCreateInput>
  }

  /**
   * ApiCallLog createMany
   */
  export type ApiCallLogCreateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to create many ApiCallLogs.
     */
    data: ApiCallLogCreateManyInput | ApiCallLogCreateManyInput[]
    skipDuplicates?: boolean
  }

  /**
   * ApiCallLog update
   */
  export type ApiCallLogUpdateArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ApiCallLog
     */
    select?: ApiCallLogSelect<ExtArgs> | null
    /**
     * The data needed to update a ApiCallLog.
     */
    data: XOR<ApiCallLogUpdateInput, ApiCallLogUncheckedUpdateInput>
    /**
     * Choose, which ApiCallLog to update.
     */
    where: ApiCallLogWhereUniqueInput
  }

  /**
   * ApiCallLog updateMany
   */
  export type ApiCallLogUpdateManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * The data used to update ApiCallLogs.
     */
    data: XOR<ApiCallLogUpdateManyMutationInput, ApiCallLogUncheckedUpdateManyInput>
    /**
     * Filter which ApiCallLogs to update
     */
    where?: ApiCallLogWhereInput
  }

  /**
   * ApiCallLog upsert
   */
  export type ApiCallLogUpsertArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ApiCallLog
     */
    select?: ApiCallLogSelect<ExtArgs> | null
    /**
     * The filter to search for the ApiCallLog to update in case it exists.
     */
    where: ApiCallLogWhereUniqueInput
    /**
     * In case the ApiCallLog found by the `where` argument doesn't exist, create a new ApiCallLog with this data.
     */
    create: XOR<ApiCallLogCreateInput, ApiCallLogUncheckedCreateInput>
    /**
     * In case the ApiCallLog was found with the provided `where` argument, update it with this data.
     */
    update: XOR<ApiCallLogUpdateInput, ApiCallLogUncheckedUpdateInput>
  }

  /**
   * ApiCallLog delete
   */
  export type ApiCallLogDeleteArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ApiCallLog
     */
    select?: ApiCallLogSelect<ExtArgs> | null
    /**
     * Filter which ApiCallLog to delete.
     */
    where: ApiCallLogWhereUniqueInput
  }

  /**
   * ApiCallLog deleteMany
   */
  export type ApiCallLogDeleteManyArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Filter which ApiCallLogs to delete
     */
    where?: ApiCallLogWhereInput
  }

  /**
   * ApiCallLog without action
   */
  export type ApiCallLogDefaultArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = {
    /**
     * Select specific fields to fetch from the ApiCallLog
     */
    select?: ApiCallLogSelect<ExtArgs> | null
  }


  /**
   * Enums
   */

  export const TransactionIsolationLevel: {
    ReadUncommitted: 'ReadUncommitted',
    ReadCommitted: 'ReadCommitted',
    RepeatableRead: 'RepeatableRead',
    Serializable: 'Serializable'
  };

  export type TransactionIsolationLevel = (typeof TransactionIsolationLevel)[keyof typeof TransactionIsolationLevel]


  export const ApiCallLogScalarFieldEnum: {
    apiCallLogId: 'apiCallLogId',
    endpoint: 'endpoint',
    timeTaken: 'timeTaken',
    username: 'username',
    agent: 'agent',
    appVersion: 'appVersion',
    request: 'request',
    response: 'response',
    method: 'method',
    mobile: 'mobile',
    device: 'device',
    createdById: 'createdById',
    dateCreated: 'dateCreated',
    dateUpdated: 'dateUpdated'
  };

  export type ApiCallLogScalarFieldEnum = (typeof ApiCallLogScalarFieldEnum)[keyof typeof ApiCallLogScalarFieldEnum]


  export const SortOrder: {
    asc: 'asc',
    desc: 'desc'
  };

  export type SortOrder = (typeof SortOrder)[keyof typeof SortOrder]


  export const NullsOrder: {
    first: 'first',
    last: 'last'
  };

  export type NullsOrder = (typeof NullsOrder)[keyof typeof NullsOrder]


  /**
   * Field references 
   */


  /**
   * Reference to a field of type 'String'
   */
  export type StringFieldRefInput<$PrismaModel> = FieldRefInputType<$PrismaModel, 'String'>
    


  /**
   * Reference to a field of type 'Float'
   */
  export type FloatFieldRefInput<$PrismaModel> = FieldRefInputType<$PrismaModel, 'Float'>
    


  /**
   * Reference to a field of type 'BigInt'
   */
  export type BigIntFieldRefInput<$PrismaModel> = FieldRefInputType<$PrismaModel, 'BigInt'>
    


  /**
   * Reference to a field of type 'Int'
   */
  export type IntFieldRefInput<$PrismaModel> = FieldRefInputType<$PrismaModel, 'Int'>
    
  /**
   * Deep Input Types
   */


  export type ApiCallLogWhereInput = {
    AND?: ApiCallLogWhereInput | ApiCallLogWhereInput[]
    OR?: ApiCallLogWhereInput[]
    NOT?: ApiCallLogWhereInput | ApiCallLogWhereInput[]
    apiCallLogId?: StringFilter<"ApiCallLog"> | string
    endpoint?: StringFilter<"ApiCallLog"> | string
    timeTaken?: FloatNullableFilter<"ApiCallLog"> | number | null
    username?: StringNullableFilter<"ApiCallLog"> | string | null
    agent?: StringNullableFilter<"ApiCallLog"> | string | null
    appVersion?: StringNullableFilter<"ApiCallLog"> | string | null
    request?: StringFilter<"ApiCallLog"> | string
    response?: StringNullableFilter<"ApiCallLog"> | string | null
    method?: StringFilter<"ApiCallLog"> | string
    mobile?: StringNullableFilter<"ApiCallLog"> | string | null
    device?: StringNullableFilter<"ApiCallLog"> | string | null
    createdById?: StringNullableFilter<"ApiCallLog"> | string | null
    dateCreated?: BigIntNullableFilter<"ApiCallLog"> | bigint | number | null
    dateUpdated?: BigIntNullableFilter<"ApiCallLog"> | bigint | number | null
  }

  export type ApiCallLogOrderByWithRelationInput = {
    apiCallLogId?: SortOrder
    endpoint?: SortOrder
    timeTaken?: SortOrderInput | SortOrder
    username?: SortOrderInput | SortOrder
    agent?: SortOrderInput | SortOrder
    appVersion?: SortOrderInput | SortOrder
    request?: SortOrder
    response?: SortOrderInput | SortOrder
    method?: SortOrder
    mobile?: SortOrderInput | SortOrder
    device?: SortOrderInput | SortOrder
    createdById?: SortOrderInput | SortOrder
    dateCreated?: SortOrderInput | SortOrder
    dateUpdated?: SortOrderInput | SortOrder
  }

  export type ApiCallLogWhereUniqueInput = Prisma.AtLeast<{
    apiCallLogId?: string
    AND?: ApiCallLogWhereInput | ApiCallLogWhereInput[]
    OR?: ApiCallLogWhereInput[]
    NOT?: ApiCallLogWhereInput | ApiCallLogWhereInput[]
    endpoint?: StringFilter<"ApiCallLog"> | string
    timeTaken?: FloatNullableFilter<"ApiCallLog"> | number | null
    username?: StringNullableFilter<"ApiCallLog"> | string | null
    agent?: StringNullableFilter<"ApiCallLog"> | string | null
    appVersion?: StringNullableFilter<"ApiCallLog"> | string | null
    request?: StringFilter<"ApiCallLog"> | string
    response?: StringNullableFilter<"ApiCallLog"> | string | null
    method?: StringFilter<"ApiCallLog"> | string
    mobile?: StringNullableFilter<"ApiCallLog"> | string | null
    device?: StringNullableFilter<"ApiCallLog"> | string | null
    createdById?: StringNullableFilter<"ApiCallLog"> | string | null
    dateCreated?: BigIntNullableFilter<"ApiCallLog"> | bigint | number | null
    dateUpdated?: BigIntNullableFilter<"ApiCallLog"> | bigint | number | null
  }, "apiCallLogId">

  export type ApiCallLogOrderByWithAggregationInput = {
    apiCallLogId?: SortOrder
    endpoint?: SortOrder
    timeTaken?: SortOrderInput | SortOrder
    username?: SortOrderInput | SortOrder
    agent?: SortOrderInput | SortOrder
    appVersion?: SortOrderInput | SortOrder
    request?: SortOrder
    response?: SortOrderInput | SortOrder
    method?: SortOrder
    mobile?: SortOrderInput | SortOrder
    device?: SortOrderInput | SortOrder
    createdById?: SortOrderInput | SortOrder
    dateCreated?: SortOrderInput | SortOrder
    dateUpdated?: SortOrderInput | SortOrder
    _count?: ApiCallLogCountOrderByAggregateInput
    _avg?: ApiCallLogAvgOrderByAggregateInput
    _max?: ApiCallLogMaxOrderByAggregateInput
    _min?: ApiCallLogMinOrderByAggregateInput
    _sum?: ApiCallLogSumOrderByAggregateInput
  }

  export type ApiCallLogScalarWhereWithAggregatesInput = {
    AND?: ApiCallLogScalarWhereWithAggregatesInput | ApiCallLogScalarWhereWithAggregatesInput[]
    OR?: ApiCallLogScalarWhereWithAggregatesInput[]
    NOT?: ApiCallLogScalarWhereWithAggregatesInput | ApiCallLogScalarWhereWithAggregatesInput[]
    apiCallLogId?: StringWithAggregatesFilter<"ApiCallLog"> | string
    endpoint?: StringWithAggregatesFilter<"ApiCallLog"> | string
    timeTaken?: FloatNullableWithAggregatesFilter<"ApiCallLog"> | number | null
    username?: StringNullableWithAggregatesFilter<"ApiCallLog"> | string | null
    agent?: StringNullableWithAggregatesFilter<"ApiCallLog"> | string | null
    appVersion?: StringNullableWithAggregatesFilter<"ApiCallLog"> | string | null
    request?: StringWithAggregatesFilter<"ApiCallLog"> | string
    response?: StringNullableWithAggregatesFilter<"ApiCallLog"> | string | null
    method?: StringWithAggregatesFilter<"ApiCallLog"> | string
    mobile?: StringNullableWithAggregatesFilter<"ApiCallLog"> | string | null
    device?: StringNullableWithAggregatesFilter<"ApiCallLog"> | string | null
    createdById?: StringNullableWithAggregatesFilter<"ApiCallLog"> | string | null
    dateCreated?: BigIntNullableWithAggregatesFilter<"ApiCallLog"> | bigint | number | null
    dateUpdated?: BigIntNullableWithAggregatesFilter<"ApiCallLog"> | bigint | number | null
  }

  export type ApiCallLogCreateInput = {
    apiCallLogId: string
    endpoint: string
    timeTaken?: number | null
    username?: string | null
    agent?: string | null
    appVersion?: string | null
    request: string
    response?: string | null
    method: string
    mobile?: string | null
    device?: string | null
    createdById?: string | null
    dateCreated?: bigint | number | null
    dateUpdated?: bigint | number | null
  }

  export type ApiCallLogUncheckedCreateInput = {
    apiCallLogId: string
    endpoint: string
    timeTaken?: number | null
    username?: string | null
    agent?: string | null
    appVersion?: string | null
    request: string
    response?: string | null
    method: string
    mobile?: string | null
    device?: string | null
    createdById?: string | null
    dateCreated?: bigint | number | null
    dateUpdated?: bigint | number | null
  }

  export type ApiCallLogUpdateInput = {
    apiCallLogId?: StringFieldUpdateOperationsInput | string
    endpoint?: StringFieldUpdateOperationsInput | string
    timeTaken?: NullableFloatFieldUpdateOperationsInput | number | null
    username?: NullableStringFieldUpdateOperationsInput | string | null
    agent?: NullableStringFieldUpdateOperationsInput | string | null
    appVersion?: NullableStringFieldUpdateOperationsInput | string | null
    request?: StringFieldUpdateOperationsInput | string
    response?: NullableStringFieldUpdateOperationsInput | string | null
    method?: StringFieldUpdateOperationsInput | string
    mobile?: NullableStringFieldUpdateOperationsInput | string | null
    device?: NullableStringFieldUpdateOperationsInput | string | null
    createdById?: NullableStringFieldUpdateOperationsInput | string | null
    dateCreated?: NullableBigIntFieldUpdateOperationsInput | bigint | number | null
    dateUpdated?: NullableBigIntFieldUpdateOperationsInput | bigint | number | null
  }

  export type ApiCallLogUncheckedUpdateInput = {
    apiCallLogId?: StringFieldUpdateOperationsInput | string
    endpoint?: StringFieldUpdateOperationsInput | string
    timeTaken?: NullableFloatFieldUpdateOperationsInput | number | null
    username?: NullableStringFieldUpdateOperationsInput | string | null
    agent?: NullableStringFieldUpdateOperationsInput | string | null
    appVersion?: NullableStringFieldUpdateOperationsInput | string | null
    request?: StringFieldUpdateOperationsInput | string
    response?: NullableStringFieldUpdateOperationsInput | string | null
    method?: StringFieldUpdateOperationsInput | string
    mobile?: NullableStringFieldUpdateOperationsInput | string | null
    device?: NullableStringFieldUpdateOperationsInput | string | null
    createdById?: NullableStringFieldUpdateOperationsInput | string | null
    dateCreated?: NullableBigIntFieldUpdateOperationsInput | bigint | number | null
    dateUpdated?: NullableBigIntFieldUpdateOperationsInput | bigint | number | null
  }

  export type ApiCallLogCreateManyInput = {
    apiCallLogId: string
    endpoint: string
    timeTaken?: number | null
    username?: string | null
    agent?: string | null
    appVersion?: string | null
    request: string
    response?: string | null
    method: string
    mobile?: string | null
    device?: string | null
    createdById?: string | null
    dateCreated?: bigint | number | null
    dateUpdated?: bigint | number | null
  }

  export type ApiCallLogUpdateManyMutationInput = {
    apiCallLogId?: StringFieldUpdateOperationsInput | string
    endpoint?: StringFieldUpdateOperationsInput | string
    timeTaken?: NullableFloatFieldUpdateOperationsInput | number | null
    username?: NullableStringFieldUpdateOperationsInput | string | null
    agent?: NullableStringFieldUpdateOperationsInput | string | null
    appVersion?: NullableStringFieldUpdateOperationsInput | string | null
    request?: StringFieldUpdateOperationsInput | string
    response?: NullableStringFieldUpdateOperationsInput | string | null
    method?: StringFieldUpdateOperationsInput | string
    mobile?: NullableStringFieldUpdateOperationsInput | string | null
    device?: NullableStringFieldUpdateOperationsInput | string | null
    createdById?: NullableStringFieldUpdateOperationsInput | string | null
    dateCreated?: NullableBigIntFieldUpdateOperationsInput | bigint | number | null
    dateUpdated?: NullableBigIntFieldUpdateOperationsInput | bigint | number | null
  }

  export type ApiCallLogUncheckedUpdateManyInput = {
    apiCallLogId?: StringFieldUpdateOperationsInput | string
    endpoint?: StringFieldUpdateOperationsInput | string
    timeTaken?: NullableFloatFieldUpdateOperationsInput | number | null
    username?: NullableStringFieldUpdateOperationsInput | string | null
    agent?: NullableStringFieldUpdateOperationsInput | string | null
    appVersion?: NullableStringFieldUpdateOperationsInput | string | null
    request?: StringFieldUpdateOperationsInput | string
    response?: NullableStringFieldUpdateOperationsInput | string | null
    method?: StringFieldUpdateOperationsInput | string
    mobile?: NullableStringFieldUpdateOperationsInput | string | null
    device?: NullableStringFieldUpdateOperationsInput | string | null
    createdById?: NullableStringFieldUpdateOperationsInput | string | null
    dateCreated?: NullableBigIntFieldUpdateOperationsInput | bigint | number | null
    dateUpdated?: NullableBigIntFieldUpdateOperationsInput | bigint | number | null
  }

  export type StringFilter<$PrismaModel = never> = {
    equals?: string | StringFieldRefInput<$PrismaModel>
    in?: string[]
    notIn?: string[]
    lt?: string | StringFieldRefInput<$PrismaModel>
    lte?: string | StringFieldRefInput<$PrismaModel>
    gt?: string | StringFieldRefInput<$PrismaModel>
    gte?: string | StringFieldRefInput<$PrismaModel>
    contains?: string | StringFieldRefInput<$PrismaModel>
    startsWith?: string | StringFieldRefInput<$PrismaModel>
    endsWith?: string | StringFieldRefInput<$PrismaModel>
    not?: NestedStringFilter<$PrismaModel> | string
  }

  export type FloatNullableFilter<$PrismaModel = never> = {
    equals?: number | FloatFieldRefInput<$PrismaModel> | null
    in?: number[] | null
    notIn?: number[] | null
    lt?: number | FloatFieldRefInput<$PrismaModel>
    lte?: number | FloatFieldRefInput<$PrismaModel>
    gt?: number | FloatFieldRefInput<$PrismaModel>
    gte?: number | FloatFieldRefInput<$PrismaModel>
    not?: NestedFloatNullableFilter<$PrismaModel> | number | null
  }

  export type StringNullableFilter<$PrismaModel = never> = {
    equals?: string | StringFieldRefInput<$PrismaModel> | null
    in?: string[] | null
    notIn?: string[] | null
    lt?: string | StringFieldRefInput<$PrismaModel>
    lte?: string | StringFieldRefInput<$PrismaModel>
    gt?: string | StringFieldRefInput<$PrismaModel>
    gte?: string | StringFieldRefInput<$PrismaModel>
    contains?: string | StringFieldRefInput<$PrismaModel>
    startsWith?: string | StringFieldRefInput<$PrismaModel>
    endsWith?: string | StringFieldRefInput<$PrismaModel>
    not?: NestedStringNullableFilter<$PrismaModel> | string | null
  }

  export type BigIntNullableFilter<$PrismaModel = never> = {
    equals?: bigint | number | BigIntFieldRefInput<$PrismaModel> | null
    in?: bigint[] | number[] | null
    notIn?: bigint[] | number[] | null
    lt?: bigint | number | BigIntFieldRefInput<$PrismaModel>
    lte?: bigint | number | BigIntFieldRefInput<$PrismaModel>
    gt?: bigint | number | BigIntFieldRefInput<$PrismaModel>
    gte?: bigint | number | BigIntFieldRefInput<$PrismaModel>
    not?: NestedBigIntNullableFilter<$PrismaModel> | bigint | number | null
  }

  export type SortOrderInput = {
    sort: SortOrder
    nulls?: NullsOrder
  }

  export type ApiCallLogCountOrderByAggregateInput = {
    apiCallLogId?: SortOrder
    endpoint?: SortOrder
    timeTaken?: SortOrder
    username?: SortOrder
    agent?: SortOrder
    appVersion?: SortOrder
    request?: SortOrder
    response?: SortOrder
    method?: SortOrder
    mobile?: SortOrder
    device?: SortOrder
    createdById?: SortOrder
    dateCreated?: SortOrder
    dateUpdated?: SortOrder
  }

  export type ApiCallLogAvgOrderByAggregateInput = {
    timeTaken?: SortOrder
    dateCreated?: SortOrder
    dateUpdated?: SortOrder
  }

  export type ApiCallLogMaxOrderByAggregateInput = {
    apiCallLogId?: SortOrder
    endpoint?: SortOrder
    timeTaken?: SortOrder
    username?: SortOrder
    agent?: SortOrder
    appVersion?: SortOrder
    request?: SortOrder
    response?: SortOrder
    method?: SortOrder
    mobile?: SortOrder
    device?: SortOrder
    createdById?: SortOrder
    dateCreated?: SortOrder
    dateUpdated?: SortOrder
  }

  export type ApiCallLogMinOrderByAggregateInput = {
    apiCallLogId?: SortOrder
    endpoint?: SortOrder
    timeTaken?: SortOrder
    username?: SortOrder
    agent?: SortOrder
    appVersion?: SortOrder
    request?: SortOrder
    response?: SortOrder
    method?: SortOrder
    mobile?: SortOrder
    device?: SortOrder
    createdById?: SortOrder
    dateCreated?: SortOrder
    dateUpdated?: SortOrder
  }

  export type ApiCallLogSumOrderByAggregateInput = {
    timeTaken?: SortOrder
    dateCreated?: SortOrder
    dateUpdated?: SortOrder
  }

  export type StringWithAggregatesFilter<$PrismaModel = never> = {
    equals?: string | StringFieldRefInput<$PrismaModel>
    in?: string[]
    notIn?: string[]
    lt?: string | StringFieldRefInput<$PrismaModel>
    lte?: string | StringFieldRefInput<$PrismaModel>
    gt?: string | StringFieldRefInput<$PrismaModel>
    gte?: string | StringFieldRefInput<$PrismaModel>
    contains?: string | StringFieldRefInput<$PrismaModel>
    startsWith?: string | StringFieldRefInput<$PrismaModel>
    endsWith?: string | StringFieldRefInput<$PrismaModel>
    not?: NestedStringWithAggregatesFilter<$PrismaModel> | string
    _count?: NestedIntFilter<$PrismaModel>
    _min?: NestedStringFilter<$PrismaModel>
    _max?: NestedStringFilter<$PrismaModel>
  }

  export type FloatNullableWithAggregatesFilter<$PrismaModel = never> = {
    equals?: number | FloatFieldRefInput<$PrismaModel> | null
    in?: number[] | null
    notIn?: number[] | null
    lt?: number | FloatFieldRefInput<$PrismaModel>
    lte?: number | FloatFieldRefInput<$PrismaModel>
    gt?: number | FloatFieldRefInput<$PrismaModel>
    gte?: number | FloatFieldRefInput<$PrismaModel>
    not?: NestedFloatNullableWithAggregatesFilter<$PrismaModel> | number | null
    _count?: NestedIntNullableFilter<$PrismaModel>
    _avg?: NestedFloatNullableFilter<$PrismaModel>
    _sum?: NestedFloatNullableFilter<$PrismaModel>
    _min?: NestedFloatNullableFilter<$PrismaModel>
    _max?: NestedFloatNullableFilter<$PrismaModel>
  }

  export type StringNullableWithAggregatesFilter<$PrismaModel = never> = {
    equals?: string | StringFieldRefInput<$PrismaModel> | null
    in?: string[] | null
    notIn?: string[] | null
    lt?: string | StringFieldRefInput<$PrismaModel>
    lte?: string | StringFieldRefInput<$PrismaModel>
    gt?: string | StringFieldRefInput<$PrismaModel>
    gte?: string | StringFieldRefInput<$PrismaModel>
    contains?: string | StringFieldRefInput<$PrismaModel>
    startsWith?: string | StringFieldRefInput<$PrismaModel>
    endsWith?: string | StringFieldRefInput<$PrismaModel>
    not?: NestedStringNullableWithAggregatesFilter<$PrismaModel> | string | null
    _count?: NestedIntNullableFilter<$PrismaModel>
    _min?: NestedStringNullableFilter<$PrismaModel>
    _max?: NestedStringNullableFilter<$PrismaModel>
  }

  export type BigIntNullableWithAggregatesFilter<$PrismaModel = never> = {
    equals?: bigint | number | BigIntFieldRefInput<$PrismaModel> | null
    in?: bigint[] | number[] | null
    notIn?: bigint[] | number[] | null
    lt?: bigint | number | BigIntFieldRefInput<$PrismaModel>
    lte?: bigint | number | BigIntFieldRefInput<$PrismaModel>
    gt?: bigint | number | BigIntFieldRefInput<$PrismaModel>
    gte?: bigint | number | BigIntFieldRefInput<$PrismaModel>
    not?: NestedBigIntNullableWithAggregatesFilter<$PrismaModel> | bigint | number | null
    _count?: NestedIntNullableFilter<$PrismaModel>
    _avg?: NestedFloatNullableFilter<$PrismaModel>
    _sum?: NestedBigIntNullableFilter<$PrismaModel>
    _min?: NestedBigIntNullableFilter<$PrismaModel>
    _max?: NestedBigIntNullableFilter<$PrismaModel>
  }

  export type StringFieldUpdateOperationsInput = {
    set?: string
  }

  export type NullableFloatFieldUpdateOperationsInput = {
    set?: number | null
    increment?: number
    decrement?: number
    multiply?: number
    divide?: number
  }

  export type NullableStringFieldUpdateOperationsInput = {
    set?: string | null
  }

  export type NullableBigIntFieldUpdateOperationsInput = {
    set?: bigint | number | null
    increment?: bigint | number
    decrement?: bigint | number
    multiply?: bigint | number
    divide?: bigint | number
  }

  export type NestedStringFilter<$PrismaModel = never> = {
    equals?: string | StringFieldRefInput<$PrismaModel>
    in?: string[]
    notIn?: string[]
    lt?: string | StringFieldRefInput<$PrismaModel>
    lte?: string | StringFieldRefInput<$PrismaModel>
    gt?: string | StringFieldRefInput<$PrismaModel>
    gte?: string | StringFieldRefInput<$PrismaModel>
    contains?: string | StringFieldRefInput<$PrismaModel>
    startsWith?: string | StringFieldRefInput<$PrismaModel>
    endsWith?: string | StringFieldRefInput<$PrismaModel>
    not?: NestedStringFilter<$PrismaModel> | string
  }

  export type NestedFloatNullableFilter<$PrismaModel = never> = {
    equals?: number | FloatFieldRefInput<$PrismaModel> | null
    in?: number[] | null
    notIn?: number[] | null
    lt?: number | FloatFieldRefInput<$PrismaModel>
    lte?: number | FloatFieldRefInput<$PrismaModel>
    gt?: number | FloatFieldRefInput<$PrismaModel>
    gte?: number | FloatFieldRefInput<$PrismaModel>
    not?: NestedFloatNullableFilter<$PrismaModel> | number | null
  }

  export type NestedStringNullableFilter<$PrismaModel = never> = {
    equals?: string | StringFieldRefInput<$PrismaModel> | null
    in?: string[] | null
    notIn?: string[] | null
    lt?: string | StringFieldRefInput<$PrismaModel>
    lte?: string | StringFieldRefInput<$PrismaModel>
    gt?: string | StringFieldRefInput<$PrismaModel>
    gte?: string | StringFieldRefInput<$PrismaModel>
    contains?: string | StringFieldRefInput<$PrismaModel>
    startsWith?: string | StringFieldRefInput<$PrismaModel>
    endsWith?: string | StringFieldRefInput<$PrismaModel>
    not?: NestedStringNullableFilter<$PrismaModel> | string | null
  }

  export type NestedBigIntNullableFilter<$PrismaModel = never> = {
    equals?: bigint | number | BigIntFieldRefInput<$PrismaModel> | null
    in?: bigint[] | number[] | null
    notIn?: bigint[] | number[] | null
    lt?: bigint | number | BigIntFieldRefInput<$PrismaModel>
    lte?: bigint | number | BigIntFieldRefInput<$PrismaModel>
    gt?: bigint | number | BigIntFieldRefInput<$PrismaModel>
    gte?: bigint | number | BigIntFieldRefInput<$PrismaModel>
    not?: NestedBigIntNullableFilter<$PrismaModel> | bigint | number | null
  }

  export type NestedStringWithAggregatesFilter<$PrismaModel = never> = {
    equals?: string | StringFieldRefInput<$PrismaModel>
    in?: string[]
    notIn?: string[]
    lt?: string | StringFieldRefInput<$PrismaModel>
    lte?: string | StringFieldRefInput<$PrismaModel>
    gt?: string | StringFieldRefInput<$PrismaModel>
    gte?: string | StringFieldRefInput<$PrismaModel>
    contains?: string | StringFieldRefInput<$PrismaModel>
    startsWith?: string | StringFieldRefInput<$PrismaModel>
    endsWith?: string | StringFieldRefInput<$PrismaModel>
    not?: NestedStringWithAggregatesFilter<$PrismaModel> | string
    _count?: NestedIntFilter<$PrismaModel>
    _min?: NestedStringFilter<$PrismaModel>
    _max?: NestedStringFilter<$PrismaModel>
  }

  export type NestedIntFilter<$PrismaModel = never> = {
    equals?: number | IntFieldRefInput<$PrismaModel>
    in?: number[]
    notIn?: number[]
    lt?: number | IntFieldRefInput<$PrismaModel>
    lte?: number | IntFieldRefInput<$PrismaModel>
    gt?: number | IntFieldRefInput<$PrismaModel>
    gte?: number | IntFieldRefInput<$PrismaModel>
    not?: NestedIntFilter<$PrismaModel> | number
  }

  export type NestedFloatNullableWithAggregatesFilter<$PrismaModel = never> = {
    equals?: number | FloatFieldRefInput<$PrismaModel> | null
    in?: number[] | null
    notIn?: number[] | null
    lt?: number | FloatFieldRefInput<$PrismaModel>
    lte?: number | FloatFieldRefInput<$PrismaModel>
    gt?: number | FloatFieldRefInput<$PrismaModel>
    gte?: number | FloatFieldRefInput<$PrismaModel>
    not?: NestedFloatNullableWithAggregatesFilter<$PrismaModel> | number | null
    _count?: NestedIntNullableFilter<$PrismaModel>
    _avg?: NestedFloatNullableFilter<$PrismaModel>
    _sum?: NestedFloatNullableFilter<$PrismaModel>
    _min?: NestedFloatNullableFilter<$PrismaModel>
    _max?: NestedFloatNullableFilter<$PrismaModel>
  }

  export type NestedIntNullableFilter<$PrismaModel = never> = {
    equals?: number | IntFieldRefInput<$PrismaModel> | null
    in?: number[] | null
    notIn?: number[] | null
    lt?: number | IntFieldRefInput<$PrismaModel>
    lte?: number | IntFieldRefInput<$PrismaModel>
    gt?: number | IntFieldRefInput<$PrismaModel>
    gte?: number | IntFieldRefInput<$PrismaModel>
    not?: NestedIntNullableFilter<$PrismaModel> | number | null
  }

  export type NestedStringNullableWithAggregatesFilter<$PrismaModel = never> = {
    equals?: string | StringFieldRefInput<$PrismaModel> | null
    in?: string[] | null
    notIn?: string[] | null
    lt?: string | StringFieldRefInput<$PrismaModel>
    lte?: string | StringFieldRefInput<$PrismaModel>
    gt?: string | StringFieldRefInput<$PrismaModel>
    gte?: string | StringFieldRefInput<$PrismaModel>
    contains?: string | StringFieldRefInput<$PrismaModel>
    startsWith?: string | StringFieldRefInput<$PrismaModel>
    endsWith?: string | StringFieldRefInput<$PrismaModel>
    not?: NestedStringNullableWithAggregatesFilter<$PrismaModel> | string | null
    _count?: NestedIntNullableFilter<$PrismaModel>
    _min?: NestedStringNullableFilter<$PrismaModel>
    _max?: NestedStringNullableFilter<$PrismaModel>
  }

  export type NestedBigIntNullableWithAggregatesFilter<$PrismaModel = never> = {
    equals?: bigint | number | BigIntFieldRefInput<$PrismaModel> | null
    in?: bigint[] | number[] | null
    notIn?: bigint[] | number[] | null
    lt?: bigint | number | BigIntFieldRefInput<$PrismaModel>
    lte?: bigint | number | BigIntFieldRefInput<$PrismaModel>
    gt?: bigint | number | BigIntFieldRefInput<$PrismaModel>
    gte?: bigint | number | BigIntFieldRefInput<$PrismaModel>
    not?: NestedBigIntNullableWithAggregatesFilter<$PrismaModel> | bigint | number | null
    _count?: NestedIntNullableFilter<$PrismaModel>
    _avg?: NestedFloatNullableFilter<$PrismaModel>
    _sum?: NestedBigIntNullableFilter<$PrismaModel>
    _min?: NestedBigIntNullableFilter<$PrismaModel>
    _max?: NestedBigIntNullableFilter<$PrismaModel>
  }



  /**
   * Aliases for legacy arg types
   */
    /**
     * @deprecated Use ApiCallLogDefaultArgs instead
     */
    export type ApiCallLogArgs<ExtArgs extends $Extensions.InternalArgs = $Extensions.DefaultArgs> = ApiCallLogDefaultArgs<ExtArgs>

  /**
   * Batch Payload for updateMany & deleteMany & createMany
   */

  export type BatchPayload = {
    count: number
  }

  /**
   * DMMF
   */
  export const dmmf: runtime.BaseDMMF
}