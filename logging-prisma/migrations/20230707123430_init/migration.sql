-- CreateTable
CREATE TABLE `ApiCallLog` (
    `apiCallLogId` CHAR(40) NOT NULL,
    `endpoint` TEXT NOT NULL,
    `timeTaken` DOUBLE NULL,
    `username` VARCHAR(191) NULL,
    `agent` VARCHAR(191) NULL,
    `appVersion` VARCHAR(191) NULL,
    `request` TEXT NOT NULL,
    `response` TEXT NULL,
    `method` VARCHAR(191) NOT NULL,
    `mobile` VARCHAR(191) NULL,
    `device` VARCHAR(191) NULL,
    `createdById` CHAR(40) NULL,
    `dateCreated` BIGINT NULL,
    `dateUpdated` BIGINT NULL,

    PRIMARY KEY (`apiCallLogId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
