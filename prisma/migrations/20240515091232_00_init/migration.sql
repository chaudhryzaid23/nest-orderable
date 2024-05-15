-- CreateTable
CREATE TABLE `User` (
    `userId` CHAR(40) NOT NULL,
    `username` VARCHAR(191) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `firstName` VARCHAR(191) NOT NULL,
    `image` VARCHAR(300) NULL,
    `title` VARCHAR(191) NULL,
    `middleName` VARCHAR(191) NULL,
    `lastName` VARCHAR(191) NULL,
    `fullName` VARCHAR(191) NOT NULL,
    `gender` ENUM('MALE', 'FEMALE', 'OTHER') NULL,
    `birthDate` BIGINT NULL,
    `birthDateString` VARCHAR(191) NULL DEFAULT '-',
    `email` VARCHAR(100) NULL,
    `mobile` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NULL,
    `nic` VARCHAR(191) NULL,
    `address1` VARCHAR(191) NULL,
    `address2` VARCHAR(191) NULL,
    `zipCode` VARCHAR(191) NULL,
    `isActivated` BOOLEAN NOT NULL DEFAULT false,
    `emailVerified` BOOLEAN NOT NULL DEFAULT false,
    `phoneVerified` BOOLEAN NOT NULL DEFAULT false,
    `useTwoFactor` BOOLEAN NOT NULL DEFAULT false,
    `otpSecret` VARCHAR(40) NULL,
    `incorrectPasswordCount` INTEGER NULL DEFAULT 0,
    `emergencyContactPerson` VARCHAR(191) NULL,
    `emergencyContactPhone` VARCHAR(191) NULL,
    `userInt` INTEGER NULL,
    `userDate` BIGINT NULL,
    `userString` CHAR(255) NULL,
    `userFloat` DOUBLE NULL,
    `isDeleted` BOOLEAN NOT NULL DEFAULT false,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    UNIQUE INDEX `User_username_key`(`username`),
    UNIQUE INDEX `User_email_key`(`email`),
    UNIQUE INDEX `User_mobile_key`(`mobile`),
    UNIQUE INDEX `User_nic_key`(`nic`),
    PRIMARY KEY (`userId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `UsedPassword` (
    `usedPasswordId` CHAR(40) NOT NULL,
    `userId` CHAR(40) NOT NULL,
    `password` VARCHAR(191) NOT NULL,
    `setOn` BIGINT NOT NULL,

    PRIMARY KEY (`usedPasswordId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `UserSession` (
    `sessionId` CHAR(40) NOT NULL,
    `sessionData` TEXT NOT NULL,
    `device` VARCHAR(191) NOT NULL,
    `deviceName` VARCHAR(191) NULL,
    `deviceModel` VARCHAR(191) NULL,
    `osName` VARCHAR(191) NULL,
    `osVersion` VARCHAR(191) NULL,
    `tzOffset` BIGINT NULL,
    `userId` CHAR(40) NOT NULL,

    PRIMARY KEY (`sessionId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `UserCode` (
    `userCodeId` CHAR(40) NOT NULL,
    `codeType` ENUM('ACCOUNT_VERIFICATION', 'VERIFY_PHONE', 'FORGOT_PASSWORD', 'TWO_FACTOR_LOGIN') NOT NULL,
    `code` CHAR(8) NOT NULL,
    `expiresAt` BIGINT NOT NULL,
    `appSignature` CHAR(32) NULL,
    `userId` CHAR(40) NOT NULL,
    `isDeleted` BOOLEAN NOT NULL DEFAULT false,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`userCodeId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Annoucements` (
    `annoucementId` CHAR(40) NOT NULL,
    `employeeId` CHAR(40) NOT NULL,
    `sentOn` BIGINT NOT NULL,
    `noOfPatients` INTEGER NULL,
    `noOfPractices` INTEGER NULL,
    `noOfEmployees` INTEGER NULL,
    `mode` ENUM('ALL', 'PUSH_NOTIFICATIONS', 'EMAIL') NOT NULL,
    `announcementTo` ENUM('PATIENTS', 'PRACTICES', 'PRACTICES_EMPLOYEES') NOT NULL DEFAULT 'PATIENTS',
    `emailTitle` TEXT NULL,
    `emailDescription` TEXT NULL,
    `notificationTitle` TEXT NULL,
    `notificationsDescription` TEXT NULL,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`annoucementId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PracticePatientAnnoucements` (
    `practicePatientId` CHAR(40) NOT NULL,
    `healthcareFacilityId` VARCHAR(191) NOT NULL,
    `patientId` VARCHAR(191) NOT NULL,
    `annoucementId` CHAR(40) NOT NULL,

    PRIMARY KEY (`practicePatientId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AnnouncementRegistery` (
    `announcementRegisteryId` CHAR(40) NOT NULL,
    `healthcareFacilityId` CHAR(40) NULL,
    `employeeId` CHAR(40) NULL,
    `patientId` CHAR(40) NULL,
    `announcementId` CHAR(40) NOT NULL,

    PRIMARY KEY (`announcementRegisteryId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `UserDevice` (
    `userDeviceId` CHAR(40) NOT NULL,
    `deviceId` CHAR(32) NOT NULL,
    `deviceName` CHAR(64) NOT NULL,
    `deviceModel` CHAR(64) NOT NULL,
    `deviceType` CHAR(64) NOT NULL,
    `userId` CHAR(40) NOT NULL,

    PRIMARY KEY (`userDeviceId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Setting` (
    `settingId` CHAR(40) NOT NULL,
    `settingName` VARCHAR(100) NOT NULL,
    `settingJson` TEXT NOT NULL,

    UNIQUE INDEX `Setting_settingName_key`(`settingName`),
    PRIMARY KEY (`settingId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `UserSetting` (
    `userSettingId` CHAR(40) NOT NULL,
    `notify` BOOLEAN NOT NULL DEFAULT true,
    `theme` ENUM('LIGHT', 'DARK') NOT NULL DEFAULT 'LIGHT',
    `language` VARCHAR(191) NULL,
    `userId` VARCHAR(191) NOT NULL,
    `userSettingJson` TEXT NOT NULL,

    UNIQUE INDEX `UserSetting_userId_key`(`userId`),
    PRIMARY KEY (`userSettingId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Specialty` (
    `specialtyId` CHAR(40) NOT NULL,
    `specialty` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Specialty_specialty_key`(`specialty`),
    PRIMARY KEY (`specialtyId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `InsuranceCompany` (
    `insuranceCompanyId` CHAR(40) NOT NULL,
    `name` VARCHAR(100) NOT NULL,
    `isDeleted` BOOLEAN NOT NULL DEFAULT false,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    UNIQUE INDEX `InsuranceCompany_name_key`(`name`),
    PRIMARY KEY (`insuranceCompanyId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `InsurancePlan` (
    `insurancePlanId` CHAR(40) NOT NULL,
    `plan` VARCHAR(100) NOT NULL,
    `isDeleted` BOOLEAN NOT NULL DEFAULT false,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,
    `insuranceCompanyId` CHAR(40) NOT NULL,

    PRIMARY KEY (`insurancePlanId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Guardian` (
    `guardianId` CHAR(40) NOT NULL,
    `userId` CHAR(40) NOT NULL,
    `isDeleted` BOOLEAN NOT NULL DEFAULT false,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    UNIQUE INDEX `Guardian_userId_key`(`userId`),
    PRIMARY KEY (`guardianId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Patient` (
    `patientId` CHAR(40) NOT NULL,
    `patientType` ENUM('ACUTE', 'CHRONIC', 'REMOTE_MONITORING') NOT NULL DEFAULT 'CHRONIC',
    `patientCode` INTEGER NOT NULL AUTO_INCREMENT,
    `pin` VARCHAR(191) NULL,
    `isPinSet` BOOLEAN NOT NULL DEFAULT false,
    `insuranceStatus` ENUM('INSURED', 'COPAY', 'WONT_COPAY', 'UNINSURED') NULL,
    `copayAmount` DOUBLE NULL,
    `userId` VARCHAR(191) NOT NULL,
    `fatherName` VARCHAR(191) NULL,
    `husbandName` VARCHAR(191) NULL,
    `passportNo` CHAR(30) NULL,
    `bloodGroup` CHAR(30) NULL,
    `caregiverFirstName` VARCHAR(191) NULL,
    `caregiverLastName` VARCHAR(191) NULL,
    `caregiverRelation` VARCHAR(191) NULL,
    `caregiverMobile` VARCHAR(191) NULL,
    `height` INTEGER NULL,
    `age` INTEGER NULL,
    `hospitalNo` CHAR(40) NOT NULL,
    `externalHn` CHAR(30) NULL,
    `isDemoPatient` BOOLEAN NOT NULL DEFAULT false,
    `termsAgreed` BOOLEAN NOT NULL DEFAULT false,
    `flag` BOOLEAN NOT NULL DEFAULT false,
    `doctorNotes` VARCHAR(500) NULL,
    `admissionStatus` ENUM('NOT_ADMITTED', 'ADMITTED', 'DISCHARGED') NOT NULL DEFAULT 'NOT_ADMITTED',
    `activationStatus` ENUM('REFERRED', 'INSURANCE_VERIFIED', 'ACCEPTED', 'DECLINED', 'DID_NOT_ANSWER', 'TRAINING_SCHEDULED', 'ASSIGNED', 'ACTIVE', 'INACTIVE', 'TERMINATE') NOT NULL DEFAULT 'REFERRED',
    `isReferredMailSent` BOOLEAN NOT NULL DEFAULT false,
    `medicareId` CHAR(40) NULL,
    `memberId` CHAR(40) NULL,
    `groupNo` CHAR(40) NULL,
    `insurancePlanId` CHAR(40) NULL,
    `healthcareFacilityId` CHAR(40) NOT NULL,
    `librePatientId` CHAR(40) NULL,
    `librePracticeId` CHAR(40) NULL,
    `dateCreated` BIGINT NULL,
    `dateUpdated` BIGINT NULL,
    `referralDate` BIGINT NULL,

    UNIQUE INDEX `Patient_patientCode_key`(`patientCode`),
    UNIQUE INDEX `Patient_userId_key`(`userId`),
    UNIQUE INDEX `Patient_hospitalNo_key`(`hospitalNo`),
    PRIMARY KEY (`patientId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ActivationStatusHistory` (
    `activationStatusHistoryId` CHAR(40) NOT NULL,
    `patientId` CHAR(40) NOT NULL,
    `newStatus` ENUM('REFERRED', 'INSURANCE_VERIFIED', 'ACCEPTED', 'DECLINED', 'DID_NOT_ANSWER', 'TRAINING_SCHEDULED', 'ASSIGNED', 'ACTIVE', 'INACTIVE', 'TERMINATE') NOT NULL,
    `dateCreated` BIGINT NOT NULL,

    PRIMARY KEY (`activationStatusHistoryId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `FlagToPatients` (
    `flagToPatientId` CHAR(40) NOT NULL,
    `patientId` CHAR(40) NULL,
    `userCreatedId` CHAR(40) NULL,
    `userResolveId` CHAR(40) NULL,
    `comment` TEXT NULL,
    `resolutionDate` BIGINT NULL,
    `issueStatus` ENUM('RESOLVED', 'UNRESOLVED') NOT NULL,
    `issueDetail` TEXT NOT NULL,
    `issueType` ENUM('APP', 'DEVICE', 'READINGS', 'OTHER', 'SUGGESTIONS') NOT NULL,
    `preferTime` ENUM('MORNING', 'AFTERNOON', 'EVENING', 'ANYTIME') NULL,
    `audioUrl` VARCHAR(191) NULL,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`flagToPatientId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CommentToPatients` (
    `commentToPatientId` CHAR(40) NOT NULL,
    `comment` TEXT NOT NULL,
    `patientId` CHAR(40) NOT NULL,
    `employeeId` CHAR(40) NOT NULL,
    `employeeActivityTimeId` CHAR(40) NULL,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    UNIQUE INDEX `CommentToPatients_employeeActivityTimeId_key`(`employeeActivityTimeId`),
    PRIMARY KEY (`commentToPatientId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Designation` (
    `designationId` CHAR(40) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`designationId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `EmployeeToDesignation` (
    `EmployeeToDesignationId` CHAR(40) NOT NULL,
    `employeeId` CHAR(40) NOT NULL,
    `designationId` CHAR(40) NOT NULL,

    PRIMARY KEY (`EmployeeToDesignationId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `GuardianToPatient` (
    `guardianToPatientId` CHAR(40) NOT NULL,
    `guardianId` CHAR(40) NOT NULL,
    `patientId` CHAR(40) NOT NULL,

    UNIQUE INDEX `GuardianToPatient_guardianId_patientId_key`(`guardianId`, `patientId`),
    PRIMARY KEY (`guardianToPatientId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Document` (
    `documentId` CHAR(40) NOT NULL,
    `patientId` CHAR(40) NOT NULL,
    `reminderInstanceId` CHAR(40) NULL,
    `employeeId` CHAR(40) NULL,
    `documentType` ENUM('MONTHLY_REPORT', 'FOLLOW_UP_REPORT', 'HANDOVER_SHEET', 'ALERT_REPORT', 'MISSED_CALL_LOGS', 'READINGS_REPORT', 'ESCALATION_SUMMARY', 'LIBRE_REPORT', 'PRE_AUTHORIZATION', 'CARE_PLAN') NOT NULL,
    `info` TEXT NULL,
    `infoJson` JSON NULL,
    `pdfUrl` TEXT NULL,
    `invoiceId` CHAR(40) NULL,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,
    `status` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`documentId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DocumentToOrderable` (
    `documentToOrderableId` CHAR(40) NOT NULL,
    `orderableId` CHAR(40) NOT NULL,
    `documentId` CHAR(40) NOT NULL,

    PRIMARY KEY (`documentToOrderableId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Role` (
    `roleId` CHAR(40) NOT NULL,
    `name` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Role_name_key`(`name`),
    PRIMARY KEY (`roleId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `UserRole` (
    `userRoleId` CHAR(40) NOT NULL,
    `userId` CHAR(40) NOT NULL,
    `roleId` CHAR(40) NOT NULL,

    PRIMARY KEY (`userRoleId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ResourcePermission` (
    `resourcePermissionId` CHAR(40) NOT NULL,
    `resourceName` VARCHAR(191) NOT NULL,
    `create` BOOLEAN NOT NULL DEFAULT false,
    `view` BOOLEAN NOT NULL DEFAULT false,
    `roleId` CHAR(40) NOT NULL,

    PRIMARY KEY (`resourcePermissionId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Employee` (
    `employeeId` CHAR(40) NOT NULL,
    `employeeNo` CHAR(20) NULL,
    `nationalProviderNo` VARCHAR(191) NOT NULL,
    `providerTransactionAccessNo` VARCHAR(191) NOT NULL,
    `showAnonymousData` BOOLEAN NOT NULL DEFAULT false,
    `employeeType` ENUM('CHI_US', 'CHI_PAK', 'PRACTICE_EMPLOYEE') NOT NULL DEFAULT 'PRACTICE_EMPLOYEE',
    `specialtyId` CHAR(40) NULL,
    `userId` CHAR(40) NOT NULL,
    `signature` VARCHAR(191) NOT NULL DEFAULT 'Null',
    `isDeleted` BOOLEAN NOT NULL DEFAULT false,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    UNIQUE INDEX `Employee_employeeNo_key`(`employeeNo`),
    UNIQUE INDEX `Employee_userId_key`(`userId`),
    PRIMARY KEY (`employeeId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `HealthcareFacilityToEmployee` (
    `healthcareFacilityToEmployeeId` CHAR(40) NOT NULL,
    `employeeId` CHAR(40) NOT NULL,
    `healthcareFacilityId` CHAR(40) NOT NULL,

    PRIMARY KEY (`healthcareFacilityToEmployeeId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `HealthcareFacility` (
    `healthcareFacilityId` CHAR(40) NOT NULL,
    `pocId` CHAR(40) NULL,
    `chiPOCId` CHAR(40) NULL,
    `tzOffset` INTEGER NOT NULL DEFAULT -18000,
    `name` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NOT NULL,
    `taxpayerIdentificationNo` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NULL,
    `fax` VARCHAR(191) NULL,
    `financialEmail` VARCHAR(191) NULL,
    `financialFax` VARCHAR(191) NULL,
    `enableFax` BOOLEAN NULL DEFAULT false,
    `enableEmail` BOOLEAN NULL DEFAULT false,
    `address` VARCHAR(191) NOT NULL,
    `city` VARCHAR(191) NOT NULL,
    `postalCode` VARCHAR(191) NULL,
    `state` VARCHAR(191) NULL,
    `settings` TEXT NOT NULL,
    `percentTax` DOUBLE NULL,
    `discount` DOUBLE NULL,
    `isPercentDiscount` BOOLEAN NOT NULL DEFAULT false,
    `isDeleted` BOOLEAN NOT NULL DEFAULT false,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`healthcareFacilityId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `HealthcareFacilityToFaxesEmails` (
    `healthcareFacilityToFaxesEmailsId` CHAR(40) NOT NULL,
    `healthcareFacilityId` CHAR(40) NOT NULL,
    `email` VARCHAR(191) NULL,
    `fax` VARCHAR(191) NULL,
    `emailFaxType` ENUM('FINANCIAL_FAX', 'FINANCIAL_EMAIL', 'PRACTICE_FAX', 'PRACTICE_EMAIL') NOT NULL,

    PRIMARY KEY (`healthcareFacilityToFaxesEmailsId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Orderable` (
    `orderableId` CHAR(40) NOT NULL,
    `name` CHAR(40) NOT NULL,
    `abbr` CHAR(30) NULL,
    `icon` CHAR(200) NULL,
    `times` VARCHAR(191) NULL,
    `instructions` VARCHAR(191) NULL,
    `orderableType` ENUM('VITAL', 'HOMECARE', 'MEDICINE', 'RADIOLOGY', 'LAB') NOT NULL,
    `isDeleted` BOOLEAN NOT NULL DEFAULT false,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    UNIQUE INDEX `Orderable_name_key`(`name`),
    PRIMARY KEY (`orderableId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Resultable` (
    `resultableId` CHAR(40) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `key` VARCHAR(191) NOT NULL,
    `abbr` VARCHAR(191) NOT NULL,
    `dataType` ENUM('NUMBER', 'TEXT', 'DATA', 'FILEURL') NOT NULL,
    `resultUnit` VARCHAR(191) NULL,
    `icon` VARCHAR(191) NULL,
    `warnLow` DOUBLE NULL,
    `normalLow` DOUBLE NULL,
    `normalHigh` DOUBLE NULL,
    `warnHigh` DOUBLE NULL,
    `minErrorValue` DOUBLE NULL,
    `maxErrorValue` DOUBLE NULL,
    `abnormalLow` DOUBLE NULL,
    `abnormalHigh` DOUBLE NULL,
    `order` INTEGER NOT NULL DEFAULT 300,
    `isDeleted` BOOLEAN NOT NULL DEFAULT false,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`resultableId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrderableToResultable` (
    `orderableToResultableId` CHAR(40) NOT NULL,
    `orderableId` CHAR(40) NOT NULL,
    `resultableId` CHAR(40) NOT NULL,

    PRIMARY KEY (`orderableToResultableId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `OrderableValue` (
    `orderableValueId` CHAR(40) NOT NULL,
    `orderableId` CHAR(40) NOT NULL,
    `rmsAdmissionId` CHAR(40) NULL,
    `rmsScheduleInstanceId` CHAR(40) NULL,
    `patientId` CHAR(40) NOT NULL,
    `deviceInventoryId` CHAR(40) NULL,
    `rmsOrderId` CHAR(40) NULL,
    `observationTime` BIGINT NULL,
    `acquisitionTime` BIGINT NULL,
    `captureTime` BIGINT NULL,
    `readingTime` BIGINT NULL,
    `status` ENUM('SEEN', 'UNHANDLED', 'HANDLED', 'INVALID', 'ESCALATED_TO_RN', 'ESCALATED_TO_PRACTICE', 'ESCALATED_AND_HANDLED') NOT NULL DEFAULT 'UNHANDLED',
    `colorStatus` ENUM('NORMAL', 'ABNORMAL', 'WARNING', 'CRITICAL', 'INVALID') NOT NULL DEFAULT 'NORMAL',
    `isValid` BOOLEAN NOT NULL DEFAULT true,
    `isManual` BOOLEAN NOT NULL DEFAULT false,
    `isLibre` BOOLEAN NOT NULL DEFAULT false,
    `isLive` BOOLEAN NOT NULL DEFAULT false,
    `cmFile` CHAR(255) NULL,
    `comments` TEXT NULL,
    `liveOrderableValueId` CHAR(40) NULL,

    UNIQUE INDEX `OrderableValue_rmsScheduleInstanceId_key`(`rmsScheduleInstanceId`),
    PRIMARY KEY (`orderableValueId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ResultableValue` (
    `resultableValueId` VARCHAR(191) NOT NULL,
    `orderableValueId` CHAR(40) NOT NULL,
    `resultableId` CHAR(40) NOT NULL,
    `medicationId` CHAR(40) NULL,
    `numericValue` DOUBLE NULL,
    `textValue` VARCHAR(191) NULL,
    `dataValue` MEDIUMTEXT NULL,
    `fileUrls` VARCHAR(500) NULL,
    `status` ENUM('ABNORMAL_LOW', 'CRITICAL_LOW', 'WARNING_LOW', 'NORMAL', 'WARNING_HIGH', 'CRITIAL_HIGH', 'ABNORMAL_HIGH') NULL,

    PRIMARY KEY (`resultableValueId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PatientResultableRange` (
    `patientResultableRangeId` CHAR(40) NOT NULL,
    `patientId` CHAR(40) NOT NULL,
    `resultableId` VARCHAR(191) NOT NULL,
    `warnLow` DOUBLE NOT NULL,
    `normalLow` DOUBLE NOT NULL,
    `normalHigh` DOUBLE NOT NULL,
    `warnHigh` DOUBLE NOT NULL,
    `minValue` DOUBLE NOT NULL,
    `maxValue` DOUBLE NOT NULL,
    `abnormalLow` DOUBLE NULL,
    `abnormalHigh` DOUBLE NULL,

    PRIMARY KEY (`patientResultableRangeId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RMSAdmission` (
    `rmsAdmissionId` CHAR(40) NOT NULL,
    `admissionDate` BIGINT NOT NULL,
    `dischargeDate` BIGINT NULL,
    `primaryDoctorId` CHAR(40) NOT NULL,
    `patientId` CHAR(40) NOT NULL,
    `isPinned` BOOLEAN NOT NULL DEFAULT false,
    `isDeleted` BOOLEAN NOT NULL DEFAULT false,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,
    `healthcareFacilityId` CHAR(40) NOT NULL,

    PRIMARY KEY (`rmsAdmissionId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RMSAdmissionCaregiver` (
    `rmsAdmissionCaregiverId` CHAR(40) NOT NULL,
    `rmsAdmissionId` CHAR(40) NOT NULL,
    `caregiverId` CHAR(40) NOT NULL,
    `isPrimary` BOOLEAN NOT NULL DEFAULT false,
    `dateStarted` BIGINT NOT NULL,
    `dateStopped` BIGINT NULL,
    `isDeleted` BOOLEAN NOT NULL DEFAULT false,

    PRIMARY KEY (`rmsAdmissionCaregiverId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RMSOrder` (
    `rmsOrderId` CHAR(40) NOT NULL,
    `orderType` ENUM('DAILY', 'WEEKLY', 'ADVANCED') NOT NULL,
    `isContinuous` BOOLEAN NOT NULL DEFAULT false,
    `rmsAdmissionId` CHAR(40) NULL,
    `patientId` CHAR(40) NOT NULL,
    `orderableId` CHAR(40) NOT NULL,
    `medicationId` CHAR(40) NULL,
    `iCD10CodeId` CHAR(40) NULL,
    `orderById` CHAR(40) NOT NULL,
    `pillboxSlot` INTEGER NULL,
    `deviceInventoryId` CHAR(40) NULL,
    `alertGap` INTEGER NOT NULL DEFAULT 600,
    `graceTime` INTEGER NOT NULL DEFAULT 1800,
    `isDeleted` BOOLEAN NOT NULL DEFAULT false,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`rmsOrderId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RMSOrderToResultable` (
    `rmsOrderToResultableId` CHAR(40) NOT NULL,
    `rmsOrderId` CHAR(40) NOT NULL,
    `resultableId` CHAR(40) NOT NULL,

    PRIMARY KEY (`rmsOrderToResultableId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RMSSchedule` (
    `rmsScheduleId` CHAR(40) NOT NULL,
    `rmsOrderId` CHAR(40) NOT NULL,
    `medicationQuantity` DOUBLE NULL,
    `startTime` BIGINT NOT NULL,
    `endTime` BIGINT NOT NULL,
    `repeatValue` INTEGER NOT NULL,
    `repeatUnit` ENUM('DAY', 'WEEK', 'MONTH') NOT NULL,

    PRIMARY KEY (`rmsScheduleId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RMSScheduleInstance` (
    `rmsScheduleInstanceId` CHAR(40) NOT NULL,
    `rmsScheduleId` CHAR(40) NOT NULL,
    `dueTime` BIGINT NOT NULL,
    `processed` BOOLEAN NOT NULL DEFAULT false,
    `taken` BOOLEAN NOT NULL DEFAULT false,
    `orderableId` CHAR(40) NOT NULL,
    `medicationId` CHAR(40) NULL,

    PRIMARY KEY (`rmsScheduleInstanceId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RPMSubject` (
    `rpmSubjectId` CHAR(40) NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `orderableValueId` CHAR(40) NULL,
    `orderableId` CHAR(40) NULL,
    `patientId` CHAR(40) NOT NULL,
    `ownerId` CHAR(40) NULL,
    `escalatedToId` CHAR(40) NULL,
    `messageWorkflow` ENUM('ESCALATED', 'RESPONDED', 'CLOSED', 'ORDERABLE', 'GENERAL', 'HANDOVERSHEET') NOT NULL DEFAULT 'GENERAL',
    `isDeleted` BOOLEAN NOT NULL DEFAULT false,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,
    `handoverSheetStatus` ENUM('READINGSUNREMARKABLE', 'READINGSDISCUSSION', 'READINGSDISCUSSED', 'READINGSONHOLD') NULL,
    `totalCallTime` BIGINT NULL,

    PRIMARY KEY (`rpmSubjectId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `RPMMessage` (
    `rpmMessageId` CHAR(40) NOT NULL,
    `rpmSubjectId` CHAR(40) NOT NULL,
    `messageType` ENUM('TEXT', 'AUDIO', 'VIDEO', 'PDF', 'IMAGE') NOT NULL,
    `messageText` TEXT NULL,
    `messageUrl` VARCHAR(191) NULL,
    `messageDuration` DOUBLE NULL,
    `copyToPatient` BOOLEAN NOT NULL,
    `senderId` CHAR(40) NULL,
    `isRead` BOOLEAN NOT NULL DEFAULT false,
    `isDeleted` BOOLEAN NOT NULL DEFAULT false,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`rpmMessageId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `UserSubject` (
    `userSubjectId` CHAR(40) NOT NULL,
    `userId` CHAR(40) NOT NULL,
    `subjectId` CHAR(40) NOT NULL,

    PRIMARY KEY (`userSubjectId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `UserMessage` (
    `messageStatusId` CHAR(40) NOT NULL,
    `messageId` CHAR(40) NOT NULL,
    `userId` CHAR(40) NOT NULL,
    `isRead` BOOLEAN NOT NULL DEFAULT false,
    `messageDeliveryStatus` ENUM('SENT', 'DELIVERED', 'SEEN') NOT NULL DEFAULT 'SENT',

    PRIMARY KEY (`messageStatusId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Manufacturer` (
    `manufacturerId` CHAR(40) NOT NULL,
    `manufacturer` VARCHAR(191) NOT NULL,
    `isDeleted` BOOLEAN NOT NULL DEFAULT false,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`manufacturerId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DeviceType` (
    `deviceTypeId` CHAR(40) NOT NULL,
    `deviceType` VARCHAR(191) NOT NULL,
    `isDeleted` BOOLEAN NOT NULL DEFAULT false,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`deviceTypeId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DeviceModel` (
    `deviceModelId` CHAR(40) NOT NULL,
    `deviceModel` VARCHAR(191) NOT NULL,
    `commProtocol` ENUM('BLUETOOTH', 'GSM', 'WIFI') NOT NULL DEFAULT 'BLUETOOTH',
    `modelCode` VARCHAR(191) NOT NULL,
    `deviceAbbr` VARCHAR(191) NULL,
    `deviceIcon` VARCHAR(191) NULL,
    `supportMultiple` BOOLEAN NOT NULL DEFAULT false,
    `supportContinuous` BOOLEAN NOT NULL DEFAULT false,
    `instructions` VARCHAR(3000) NULL,
    `instructionVideo` VARCHAR(300) NULL,
    `manufacturerId` CHAR(40) NOT NULL,
    `deviceTypeId` CHAR(40) NOT NULL,
    `orderThreshold` INTEGER NOT NULL DEFAULT 30,
    `defaultOrderQuantity` INTEGER NOT NULL DEFAULT 50,
    `isDeleted` BOOLEAN NOT NULL DEFAULT false,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    UNIQUE INDEX `DeviceModel_deviceModel_key`(`deviceModel`),
    PRIMARY KEY (`deviceModelId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DeviceModelToResultable` (
    `deviceModelToResultableId` CHAR(40) NOT NULL,
    `resultableId` CHAR(40) NOT NULL,
    `deviceModelId` CHAR(40) NOT NULL,

    PRIMARY KEY (`deviceModelToResultableId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DeviceInventory` (
    `deviceInventoryId` CHAR(40) NOT NULL,
    `deviceUniqueCode` VARCHAR(191) NOT NULL,
    `deviceIOSCode` VARCHAR(191) NULL,
    `deviceModelId` CHAR(40) NOT NULL,
    `deviceCode` VARCHAR(191) NOT NULL,
    `deviceStatus` ENUM('AVAILABLE', 'ASSIGNED', 'UN_ASSIGNED', 'INITIATE_RETURN', 'DEVICE_LOST', 'DAMAGED') NOT NULL DEFAULT 'AVAILABLE',
    `isFaulty` BOOLEAN NOT NULL DEFAULT false,
    `isAssigned` BOOLEAN NOT NULL DEFAULT false,
    `patientId` CHAR(40) NULL,
    `isDeleted` BOOLEAN NOT NULL DEFAULT false,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    UNIQUE INDEX `DeviceInventory_deviceUniqueCode_key`(`deviceUniqueCode`),
    UNIQUE INDEX `DeviceInventory_deviceCode_key`(`deviceCode`),
    PRIMARY KEY (`deviceInventoryId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DeviceReceival` (
    `deviceReceivalId` CHAR(40) NOT NULL,
    `addedById` CHAR(40) NOT NULL,
    `deviceModelId` CHAR(40) NOT NULL,
    `deviceOrderType` ENUM('ORDER', 'INVENTORY_ADDED') NOT NULL DEFAULT 'INVENTORY_ADDED',
    `quantity` INTEGER NOT NULL,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`deviceReceivalId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DeviceOrder` (
    `deviceOrderId` CHAR(40) NOT NULL,
    `orderById` CHAR(40) NOT NULL,
    `deviceModelId` CHAR(40) NOT NULL,
    `deviceOrderType` ENUM('ORDER', 'INVENTORY_ADDED') NOT NULL DEFAULT 'ORDER',
    `orderedQuantity` INTEGER NOT NULL,
    `Status` VARCHAR(191) NOT NULL,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`deviceOrderId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DeviceInventoryHistory` (
    `deviceInventoryHistoryId` CHAR(40) NOT NULL,
    `deviceInventoryId` CHAR(40) NOT NULL,
    `deviceStatus` ENUM('AVAILABLE', 'ASSIGNED', 'UN_ASSIGNED', 'INITIATE_RETURN', 'DEVICE_LOST', 'DAMAGED') NOT NULL DEFAULT 'AVAILABLE',
    `employeeId` CHAR(40) NULL,
    `patientId` CHAR(40) NULL,
    `isDeleted` BOOLEAN NOT NULL DEFAULT false,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,
    `userUserId` CHAR(40) NULL,

    PRIMARY KEY (`deviceInventoryHistoryId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ExternalCommunicationRecord` (
    `externalCommunicationRecordId` CHAR(40) NOT NULL,
    `communicationMethod` ENUM('EMAIL', 'FAX', 'SMS') NOT NULL,
    `subject` VARCHAR(191) NOT NULL,
    `sentById` CHAR(40) NULL,
    `patientId` CHAR(40) NULL,
    `employeeId` CHAR(40) NULL,
    `healthcareFacilityId` CHAR(40) NOT NULL,
    `communicationSentTo` ENUM('PATIENT', 'HEALTHCARE_FACILITY', 'EMPLOYEE') NOT NULL,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`externalCommunicationRecordId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `MedicationRoute` (
    `medicationRouteId` CHAR(40) NOT NULL,
    `name` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `MedicationRoute_name_key`(`name`),
    PRIMARY KEY (`medicationRouteId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DosageUnit` (
    `dosageUnitId` CHAR(40) NOT NULL,
    `name` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `DosageUnit_name_key`(`name`),
    PRIMARY KEY (`dosageUnitId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `DosageForm` (
    `dosageFormId` CHAR(40) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `image` VARCHAR(191) NULL,
    `isInsulin` BOOLEAN NOT NULL DEFAULT false,
    `isInsulinCombined` BOOLEAN NOT NULL DEFAULT false,

    UNIQUE INDEX `DosageForm_name_key`(`name`),
    PRIMARY KEY (`dosageFormId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Medication` (
    `medicationId` CHAR(40) NOT NULL,
    `name` VARCHAR(191) NOT NULL,
    `genericName` LONGTEXT NULL,
    `image` VARCHAR(191) NULL,
    `packageImage` VARCHAR(191) NULL,
    `strength` VARCHAR(191) NULL,
    `frequency` VARCHAR(191) NULL,
    `times` VARCHAR(191) NULL,
    `instructions` VARCHAR(191) NULL,
    `medicationRouteId` CHAR(40) NULL,
    `dosageFormId` CHAR(40) NULL,
    `dosageUnitId` CHAR(40) NULL,
    `manufacturerId` CHAR(40) NULL,

    PRIMARY KEY (`medicationId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Allergy` (
    `allergyId` CHAR(40) NOT NULL,
    `name` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Allergy_name_key`(`name`),
    PRIMARY KEY (`allergyId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AllergyToPatient` (
    `allergyToPatientId` CHAR(40) NOT NULL,
    `allergyId` CHAR(40) NOT NULL,
    `patientId` CHAR(40) NOT NULL,

    UNIQUE INDEX `AllergyToPatient_allergyId_patientId_key`(`allergyId`, `patientId`),
    PRIMARY KEY (`allergyToPatientId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `EventLogs` (
    `eventLogId` CHAR(40) NOT NULL,
    `eventTime` BIGINT NOT NULL,
    `patientId` CHAR(40) NOT NULL,
    `orderableId` CHAR(40) NULL,
    `userId` CHAR(40) NULL,
    `eventLogType` ENUM('CALL', 'TAKEN', 'MISSED', 'NOTIFICATION_SENT', 'NOTIFICATION_FAILED', 'ON_BOARDING_COMPLETED') NOT NULL,
    `startTime` BIGINT NOT NULL,
    `endTime` BIGINT NOT NULL,

    PRIMARY KEY (`eventLogId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AuditLogs` (
    `auditLogsId` CHAR(40) NOT NULL,
    `auditTime` BIGINT NOT NULL,
    `userId` CHAR(40) NULL,
    `patientId` CHAR(40) NULL,
    `module` ENUM('SYSTEM', 'PATIENT_RECORD', 'APPOINTMENT', 'CONSULTATION', 'BILL_PAYMENTS', 'CALLS', 'ADMIN', 'SUBSCRIPTION', 'ORDERABLE', 'NOTIFICATIONS', 'COMMAND_CENTER', 'REPORTS', 'DOCTORS_SETTINGS', 'ROLES', 'IPD') NOT NULL,
    `actionType` ENUM('LOG_IN', 'LOG_OUT', 'SESSION_TIMEOUT', 'PATIENT_REGISTERED', 'PATIENT_ON_BOARDED', 'ADDVERSE_EVENT_ADDED', 'RECORD_UPDATED', 'RECORD_ACCESSED', 'MAKE_CALL', 'CALL_ACCEPTED', 'CALL_CLOSED', 'CALL_MISSED', 'CALL_RECORDING_PLAYBACK', 'CREATE_EMPLOYEE', 'UPDATED_EMPLOYEE', 'ROLE_CREATED', 'ROLE_UPDATED', 'PRIVILEGES_ASSIGNED', 'GENERIC_ADMIN_ACTIVITY', 'ORDERABLE_UPDATED', 'ORDERABLE_ASSIGNED', 'ORDERABLE_UN_ASSIGNED', 'MESSAGE_DEVLIVERED', 'FAILED_TO_SEND_MESSAGE', 'NEW_ESCALATION', 'NEW_MESSAGE', 'ESCALATION_CLOSED', 'OBSERVATION_RECIEVED', 'OBSERVATION_UPDATED', 'REPORT_CREATED', 'REPORT_ACCESSED', 'REPORT_DOWNLOADED') NOT NULL,
    `message` TEXT NOT NULL,

    PRIMARY KEY (`auditLogsId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `BillableEventReport` (
    `billableEventReportId` CHAR(40) NOT NULL,
    `generatedById` CHAR(40) NOT NULL,
    `generatedOn` BIGINT NOT NULL,
    `startTime` BIGINT NOT NULL,
    `endTime` BIGINT NOT NULL,

    PRIMARY KEY (`billableEventReportId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ICD10Code` (
    `icd10CodeId` CHAR(40) NOT NULL,
    `icd10Code` CHAR(40) NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `parentId` CHAR(40) NULL,
    `isLeaf` BOOLEAN NOT NULL,
    `level` INTEGER NOT NULL,
    `isDeleted` BOOLEAN NOT NULL DEFAULT false,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`icd10CodeId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `EmployeeToICD10Code` (
    `employeeToICD10CodeId` CHAR(40) NOT NULL,
    `icd10CodeId` CHAR(40) NOT NULL,
    `employeeId` CHAR(40) NOT NULL,

    PRIMARY KEY (`employeeToICD10CodeId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PatientToICD10Code` (
    `patientToICD10CodeId` CHAR(40) NOT NULL,
    `icd10CodeId` CHAR(40) NOT NULL,
    `addedById` CHAR(40) NOT NULL,
    `patientId` CHAR(40) NOT NULL,
    `comments` TEXT NULL,
    `startTime` BIGINT NULL,
    `endTime` BIGINT NULL,
    `isActive` BOOLEAN NOT NULL DEFAULT true,
    `isDeleted` BOOLEAN NOT NULL DEFAULT false,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`patientToICD10CodeId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AppSessionState` (
    `appSessionStateId` CHAR(40) NOT NULL,
    `userDeviceId` CHAR(40) NOT NULL,
    `patientId` CHAR(40) NOT NULL,
    `status` ENUM('Offline', 'Online', 'LoggedOut') NULL,
    `battery` INTEGER NULL,
    `bluetoothEnabled` BOOLEAN NOT NULL DEFAULT false,
    `appVersion` CHAR(32) NULL,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`appSessionStateId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AppSessionStateLog` (
    `appSessionStateLogId` CHAR(40) NOT NULL,
    `appSessionStateId` CHAR(40) NOT NULL,
    `eventTime` BIGINT NOT NULL,
    `eventType` ENUM('AppInstalled', 'LoggedIn', 'LoggedOut', 'PhoneStarted', 'PhoneShutdown', 'UIAppStarted', 'UIAppStopped', 'SvcAppStarted', 'SvcAppStopped', 'PmsStarted', 'PmsStopped', 'DmsStarted', 'DmsStopped', 'BtEnabled', 'BtDisabled', 'InetEnabled', 'InetDisabled', 'Location', 'LocEnabled', 'LocDisabled', 'Battery', 'BatteryNormal', 'BatteryCritical', 'AppVersion', 'DV_GetAdmissionDevices', 'DV_LocalDBUpdated', 'DV_ReadDB', 'DV_RetrieveKnownPeripheral', 'DV_UnpairDevice', 'DV_CallConnectOnPeripheral', 'DV_PeripheralConnected', 'DV_PeripheralDisconnected', 'GoingToBackground', 'GoingToForeground', 'WillBeTerminated', 'ScanningStarted', 'DV_Discovered', 'ForgettingPatientDetails', 'AppWoken', 'Generic') NOT NULL,
    `eventFrom` ENUM('PMS', 'SvcApp', 'App', 'UIApp', 'DMS', 'Monitor', 'BTC', 'Scanner', 'DeviceHandler') NOT NULL,
    `eventData` CHAR(164) NULL,
    `stateFrom` ENUM('AppInstalled', 'LoggedIn', 'LoggedOut', 'PhoneStarted', 'PhoneShutdown', 'UIAppStarted', 'UIAppStopped', 'SvcAppStarted', 'SvcAppStopped', 'PmsStarted', 'PmsStopped', 'DmsStarted', 'DmsStopped', 'BtEnabled', 'BtDisabled', 'InetEnabled', 'InetDisabled', 'Location', 'LocEnabled', 'LocDisabled', 'Battery', 'BatteryNormal', 'BatteryCritical', 'AppVersion', 'DV_GetAdmissionDevices', 'DV_LocalDBUpdated', 'DV_ReadDB', 'DV_RetrieveKnownPeripheral', 'DV_UnpairDevice', 'DV_CallConnectOnPeripheral', 'DV_PeripheralConnected', 'DV_PeripheralDisconnected', 'GoingToBackground', 'GoingToForeground', 'WillBeTerminated', 'ScanningStarted', 'DV_Discovered', 'ForgettingPatientDetails', 'AppWoken', 'Generic') NULL,
    `mobileOs` ENUM('Android', 'iOS') NULL,
    `stateDuration` BIGINT NULL,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`appSessionStateLogId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PatientDeviceState` (
    `deviceId` CHAR(40) NOT NULL,
    `patientId` CHAR(40) NOT NULL,
    `stateTime` BIGINT NOT NULL,
    `eventType` ENUM('MedicalDevice') NOT NULL,
    `eventFrom` ENUM('Service', 'Monitor', 'Device') NOT NULL,
    `isConnected` BOOLEAN NOT NULL,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`deviceId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PatientDeviceStateLog` (
    `patientDeviceStateLogId` CHAR(40) NOT NULL,
    `deviceId` CHAR(40) NOT NULL,
    `patientId` CHAR(40) NOT NULL,
    `stateTime` BIGINT NOT NULL,
    `eventType` ENUM('MedicalDevice') NOT NULL,
    `eventFrom` ENUM('Service', 'Monitor', 'Device') NOT NULL,
    `isConnected` BOOLEAN NOT NULL,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`patientDeviceStateLogId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Reminder` (
    `reminderId` CHAR(40) NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `notes` VARCHAR(191) NULL,
    `isAdHoc` BOOLEAN NOT NULL DEFAULT false,
    `patientId` CHAR(40) NULL,
    `ownerId` CHAR(40) NOT NULL,
    `reminderTypeId` CHAR(40) NULL,
    `startDate` INTEGER UNSIGNED NOT NULL,
    `endDate` INTEGER UNSIGNED NOT NULL,
    `startTime` INTEGER NOT NULL,
    `endTime` INTEGER NOT NULL,
    `repeatValue` INTEGER NOT NULL,
    `repeatUnit` ENUM('DAY', 'WEEK', 'MONTH') NOT NULL,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`reminderId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ReminderUser` (
    `reminderUserId` CHAR(40) NOT NULL,
    `userId` CHAR(40) NOT NULL,
    `reminderId` CHAR(40) NOT NULL,

    UNIQUE INDEX `ReminderUser_userId_reminderId_key`(`userId`, `reminderId`),
    PRIMARY KEY (`reminderUserId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ReminderInstance` (
    `reminderInstanceId` CHAR(40) NOT NULL,
    `reminderId` CHAR(40) NOT NULL,
    `status` ENUM('BOOKED', 'CANCELLED', 'COMPLETED', 'DID_NOT_ANSWER', 'RESHEDULED', 'MISSED') NULL,
    `dueTime` INTEGER UNSIGNED NOT NULL,
    `processed` BOOLEAN NOT NULL DEFAULT false,
    `isConducted` BOOLEAN NOT NULL DEFAULT false,
    `notes` TEXT NULL,
    `callDuration` INTEGER UNSIGNED NULL,
    `callStartTime` BIGINT NULL,
    `callEndTime` BIGINT NULL,
    `pdfFileUrl` VARCHAR(1024) NULL,
    `calledByEmployeeId` CHAR(40) NULL,

    PRIMARY KEY (`reminderInstanceId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `EmployeeActivityTime` (
    `employeeServiceTimeId` CHAR(40) NOT NULL,
    `patientId` CHAR(40) NULL,
    `employeeId` CHAR(40) NULL,
    `startTime` BIGINT NULL,
    `duration` INTEGER NOT NULL DEFAULT 0,
    `durationType` ENUM('HANDOVER', 'PREP_TIME', 'COMMENT') NOT NULL,
    `timeAddedStatus` BOOLEAN NOT NULL DEFAULT false,
    `timeDiscarded` BOOLEAN NOT NULL DEFAULT false,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`employeeServiceTimeId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Call` (
    `callId` CHAR(40) NOT NULL,
    `startTime` BIGINT NOT NULL,
    `endTime` BIGINT NOT NULL,
    `prepTime` INTEGER NOT NULL DEFAULT 0,
    `type` ENUM('NETWORK', 'CHARMS') NOT NULL,
    `status` ENUM('PICKED', 'DID_NOT_ANSWER') NOT NULL,
    `reason` ENUM('TRAINING', 'FOLLOW_UP', 'ADHOC_FOLLOWUP', 'ADHOC_CALL', 'HANDOVER', 'ESCALATION', 'UNKNOWN') NOT NULL DEFAULT 'UNKNOWN',
    `comment` TEXT NULL,
    `patientId` CHAR(40) NOT NULL,
    `callerEmployeeId` CHAR(40) NULL,
    `healthcareFacilityId` CHAR(40) NOT NULL,

    PRIMARY KEY (`callId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ReminderType` (
    `reminderTypeId` CHAR(40) NOT NULL,
    `type` CHAR(40) NOT NULL,
    `color` CHAR(40) NOT NULL,

    PRIMARY KEY (`reminderTypeId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `QUQuestionnaire` (
    `questionnaireId` CHAR(40) NOT NULL,
    `name` CHAR(255) NOT NULL,
    `questionnaireType` ENUM('FIRST_CHECKLIST', 'FOLLOW_UP', 'ESCALATION', 'MISCELLANEOUS', 'LEVEL1_QUESTIONNAIRE', 'LEVEL2_QUESTIONNAIRE') NULL DEFAULT 'MISCELLANEOUS',
    `orderableId` CHAR(40) NULL,
    `preNote` TEXT NULL,
    `postNote` TEXT NULL,
    `greetingScript` TEXT NULL,
    `endingScript` TEXT NULL,
    `isDeleted` BOOLEAN NOT NULL DEFAULT false,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`questionnaireId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `QUQuestion` (
    `questionId` CHAR(40) NOT NULL,
    `question` TEXT NOT NULL,
    `answerType` ENUM('SINGLE_LINE', 'MULTI_LINE', 'BOOLEAN', 'SINGLE_CHOICE', 'MULTI_CHOICE', 'SPECIAL_BOOLEAN', 'FOLLOW_UP_TIME') NOT NULL,
    `option` TEXT NULL,
    `refAnswer` VARCHAR(191) NULL,
    `order` INTEGER NULL,
    `qUQuestionnaireId` CHAR(40) NOT NULL,

    PRIMARY KEY (`questionId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `QUQuestionnaireToICD10Code` (
    `QUQuestionnaireToICD10CodeId` CHAR(40) NOT NULL,
    `questionnaireId` CHAR(40) NOT NULL,
    `icd10CodeId` CHAR(40) NOT NULL,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`QUQuestionnaireToICD10CodeId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `QUAnswerSheet` (
    `answerSheetId` CHAR(40) NOT NULL,
    `answerMarks` DOUBLE NULL,
    `questionnaireId` CHAR(40) NOT NULL,
    `patientId` CHAR(40) NOT NULL,
    `conductedById` CHAR(40) NULL,
    `pdfFileUrl` VARCHAR(1024) NULL,
    `reminderInstanceId` CHAR(40) NULL,
    `icd10CodeId` CHAR(40) NULL,
    `documentId` CHAR(40) NULL,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,
    `postNote` TEXT NULL,

    PRIMARY KEY (`answerSheetId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `QUAnswer` (
    `answerId` CHAR(40) NOT NULL,
    `answerSheetId` CHAR(40) NOT NULL,
    `questionId` CHAR(40) NOT NULL,
    `answer` TEXT NULL,

    PRIMARY KEY (`answerId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `USEscalation` (
    `usEscalationId` CHAR(40) NOT NULL,
    `openedById` CHAR(40) NOT NULL,
    `handledById` CHAR(40) NULL,
    `orderableValueId` CHAR(40) NOT NULL,
    `level1answerSheetId` CHAR(40) NOT NULL,
    `level2answerSheetId` CHAR(40) NULL,
    `readingsStartTime` BIGINT NULL,
    `readingsEndTime` BIGINT NULL,
    `pdfUrl` VARCHAR(1024) NULL,
    `makeCloseNotes` TEXT NULL,
    `escalationDuration` INTEGER NOT NULL DEFAULT 0,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    UNIQUE INDEX `USEscalation_level1answerSheetId_key`(`level1answerSheetId`),
    UNIQUE INDEX `USEscalation_level2answerSheetId_key`(`level2answerSheetId`),
    PRIMARY KEY (`usEscalationId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `EscalationGraphOrderable` (
    `escalationGraphOrderableId` CHAR(40) NOT NULL,
    `orderableId` CHAR(40) NOT NULL,
    `usEscalationId` CHAR(40) NOT NULL,

    PRIMARY KEY (`escalationGraphOrderableId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PatientRecruitment` (
    `recruitmentId` CHAR(40) NOT NULL,
    `recruitmentDate` BIGINT NOT NULL,
    `recruitedById` CHAR(40) NOT NULL,
    `healthcareFacilityId` CHAR(40) NOT NULL,
    `excelFileUrl` VARCHAR(1024) NOT NULL,

    PRIMARY KEY (`recruitmentId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Notification` (
    `notificationId` CHAR(40) NOT NULL,
    `userId` CHAR(40) NOT NULL,
    `event` VARCHAR(191) NOT NULL,
    `title` VARCHAR(191) NOT NULL,
    `body` TEXT NULL,
    `timeList` VARCHAR(191) NULL,
    `message` TEXT NOT NULL,
    `category` ENUM('APPOINTMENT', 'VITAL', 'ESCALATION', 'ANNOUCEMENTS') NULL,
    `type` ENUM('info', 'error', 'warning', 'success') NOT NULL,
    `alarm` BOOLEAN NOT NULL,
    `isAutoRefresh` BOOLEAN NOT NULL,
    `duration` INTEGER UNSIGNED NOT NULL,
    `isRead` BOOLEAN NOT NULL DEFAULT false,
    `isDeleted` BOOLEAN NOT NULL DEFAULT false,
    `dateCreated` BIGINT NULL,
    `dateUpdated` BIGINT NULL,

    PRIMARY KEY (`notificationId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CPTCode` (
    `cptCodeId` CHAR(40) NOT NULL,
    `cptCode` VARCHAR(64) NOT NULL,
    `amount` DOUBLE NOT NULL,
    `durationValue` INTEGER UNSIGNED NOT NULL,
    `durationUnit` ENUM('DAY', 'WEEK', 'MONTH') NOT NULL,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    UNIQUE INDEX `CPTCode_cptCode_key`(`cptCode`),
    PRIMARY KEY (`cptCodeId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `healthcareFacilityToCPTCode` (
    `healthcareFacilityToCPTCodeId` CHAR(40) NOT NULL,
    `cptCodeId` CHAR(40) NOT NULL,
    `healthcareFacilityId` CHAR(40) NOT NULL,
    `amount` DOUBLE NOT NULL,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    PRIMARY KEY (`healthcareFacilityToCPTCodeId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Invoice` (
    `invoiceId` CHAR(40) NOT NULL,
    `invoiceCode` INTEGER NOT NULL AUTO_INCREMENT,
    `invoiceNo` VARCHAR(191) NOT NULL,
    `billingRefNo` VARCHAR(191) NULL,
    `patientId` CHAR(40) NOT NULL,
    `healthcareFacilityId` CHAR(40) NOT NULL,
    `healthcareFacilityInvoiceId` CHAR(40) NULL,
    `invoicedAmount` DOUBLE NOT NULL DEFAULT 0,
    `totalDiscount` DOUBLE NOT NULL DEFAULT 0,
    `totalPaymentReceived` DOUBLE NOT NULL DEFAULT 0,
    `dueDate` BIGINT NOT NULL,
    `invoiceFileUrl` VARCHAR(1024) NULL,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    UNIQUE INDEX `Invoice_invoiceCode_key`(`invoiceCode`),
    UNIQUE INDEX `Invoice_invoiceNo_key`(`invoiceNo`),
    PRIMARY KEY (`invoiceId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CommunicationLog` (
    `communicationLogId` CHAR(40) NOT NULL,
    `communicationMessage` TEXT NULL,
    `patientId` CHAR(40) NULL,
    `communicationMethod` ENUM('EMAIL', 'FAX', 'SMS') NOT NULL,
    `communicationDate` BIGINT NOT NULL,

    UNIQUE INDEX `CommunicationLog_patientId_key`(`patientId`),
    PRIMARY KEY (`communicationLogId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `InvoiceToCptCode` (
    `invoiceToCPTCodeId` CHAR(40) NOT NULL,
    `invoiceToCptCodeNo` VARCHAR(191) NULL,
    `cPTCodeId` CHAR(40) NOT NULL,
    `invoiceId` CHAR(40) NOT NULL,
    `paymentToReceive` DOUBLE NOT NULL DEFAULT 0,
    `discount` DOUBLE NOT NULL DEFAULT 0,
    `paymentReceived` DOUBLE NOT NULL DEFAULT 0,
    `balanceDue` DOUBLE NOT NULL DEFAULT 0,
    `invoiceToCptCodeUrl` VARCHAR(1024) NULL,
    `invoiceToCptCodeStatus` ENUM('PROFORMA', 'PARTIAL', 'OVERDUE', 'INVOICED', 'PAID_DISCOUNTED', 'PAID_FULL', 'REJECTED_OR_DECLINED') NOT NULL DEFAULT 'PROFORMA',
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,
    `dateApplied` BIGINT NOT NULL DEFAULT 0,
    `faxCommunicationLogId` CHAR(40) NULL,
    `emailCommunicationLogId` CHAR(40) NULL,

    UNIQUE INDEX `InvoiceToCptCode_cPTCodeId_invoiceId_key`(`cPTCodeId`, `invoiceId`),
    PRIMARY KEY (`invoiceToCPTCodeId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `HealthcareFacilityInvoice` (
    `healthcareFacilityInvoiceId` CHAR(40) NOT NULL,
    `invoiceCode` INTEGER NOT NULL AUTO_INCREMENT,
    `invoiceNo` VARCHAR(191) NOT NULL,
    `noOfPatients` INTEGER NOT NULL,
    `healthcareFacilityId` CHAR(40) NOT NULL,
    `dueDate` BIGINT NOT NULL,
    `totalAmount` DOUBLE NOT NULL,
    `healthcareFacilityInvoiceStatus` ENUM('DUE', 'OVERDUE', 'PAID') NOT NULL DEFAULT 'DUE',
    `emailStatus` VARCHAR(191) NULL,
    `faxStatus` VARCHAR(191) NULL,
    `pdfFileUrl` VARCHAR(191) NULL,
    `dateCreated` BIGINT NOT NULL,
    `dateUpdated` BIGINT NOT NULL,

    UNIQUE INDEX `HealthcareFacilityInvoice_invoiceCode_key`(`invoiceCode`),
    UNIQUE INDEX `HealthcareFacilityInvoice_invoiceNo_key`(`invoiceNo`),
    PRIMARY KEY (`healthcareFacilityInvoiceId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TrainingMaterial` (
    `trainingMaterialId` CHAR(40) NOT NULL,
    `trainingMaterialName` VARCHAR(191) NOT NULL,
    `brochurelUrl` VARCHAR(1024) NULL,
    `videoUrl` VARCHAR(1024) NULL,
    `orderableId` CHAR(40) NULL,

    PRIMARY KEY (`trainingMaterialId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `ReminderInstanceToICD10Code` (
    `reminderInstanceToICD10CodeId` CHAR(40) NOT NULL,
    `iCD10CodeId` CHAR(40) NOT NULL,
    `reminderInstanceId` CHAR(40) NOT NULL,

    PRIMARY KEY (`reminderInstanceToICD10CodeId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `PatientProgressReport` (
    `patientProgressReportId` CHAR(40) NOT NULL,
    `patientId` CHAR(40) NOT NULL,
    `reportingMonth` INTEGER NOT NULL,
    `reportingYear` INTEGER NOT NULL,
    `startDate` INTEGER NOT NULL DEFAULT 1,
    `endDate` INTEGER NOT NULL DEFAULT 31,
    `totalReadings` INTEGER NOT NULL DEFAULT 0,
    `lastReadingDate` BIGINT NULL,
    `pAlert` INTEGER NOT NULL DEFAULT 0,
    `readingPlusAlert` INTEGER NOT NULL DEFAULT 0,
    `totalCallDurationSec` INTEGER NOT NULL DEFAULT 0,
    `auxiliaryDurationSec` INTEGER NOT NULL DEFAULT 0,
    `totalPrepTime` INTEGER NOT NULL DEFAULT 0,
    `lastEncounterDate` BIGINT NULL,
    `sortCriteriaReading` DOUBLE NULL DEFAULT 0,
    `sortCriteriaCalls` DOUBLE NULL DEFAULT 0,
    `sortCriteriaCombined` DOUBLE NULL DEFAULT 0,
    `listOfReadingDates` VARCHAR(191) NOT NULL,
    `expectedBill` INTEGER NOT NULL DEFAULT 0,
    `appliedCPTCodes` VARCHAR(191) NULL,
    `trainingCpt453` INTEGER NULL,
    `reading16Cpt454` INTEGER NULL,
    `call20Cpt457` INTEGER NULL,
    `call40Cpt458` INTEGER NULL,
    `call60Cpt458b` INTEGER NULL,
    `dayStatus` VARCHAR(191) NULL,

    UNIQUE INDEX `PatientProgressReport_patientId_reportingMonth_reportingYear_key`(`patientId`, `reportingMonth`, `reportingYear`),
    PRIMARY KEY (`patientProgressReportId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CallTimeRecord` (
    `callTimeRecordId` CHAR(40) NOT NULL,
    `prepTime` INTEGER NOT NULL DEFAULT 0,
    `handoverTime` INTEGER NOT NULL DEFAULT 0,
    `escalationTime` INTEGER NOT NULL DEFAULT 0,
    `commentTime` INTEGER NOT NULL DEFAULT 0,
    `networkMissedCall` INTEGER NOT NULL DEFAULT 0,
    `adhocMissedCall` INTEGER NOT NULL DEFAULT 0,
    `followUpMissedCall` INTEGER NOT NULL DEFAULT 0,
    `adhocPopupCall` INTEGER NOT NULL DEFAULT 0,
    `regularFollowupCall` INTEGER NOT NULL DEFAULT 0,
    `manualFollowUpCall` INTEGER NOT NULL DEFAULT 0,
    `adhocReportNetwork` INTEGER NOT NULL DEFAULT 0,
    `patientProgressReportId` CHAR(40) NOT NULL,

    UNIQUE INDEX `CallTimeRecord_patientProgressReportId_key`(`patientProgressReportId`),
    PRIMARY KEY (`callTimeRecordId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `AutoComplete` (
    `autoCompleteId` VARCHAR(191) NOT NULL,
    `autoCompleteType` ENUM('ADHOC_CALL', 'NURSE_NOTES', 'DOCTOR_NOTES') NOT NULL,
    `key` VARCHAR(191) NOT NULL,
    `value` TEXT NOT NULL,

    UNIQUE INDEX `AutoComplete_key_key`(`key`),
    PRIMARY KEY (`autoCompleteId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TableColumnConfig` (
    `tableColConfigId` CHAR(40) NOT NULL,
    `userId` CHAR(40) NOT NULL,
    `viewName` VARCHAR(191) NOT NULL,
    `colConfig` TEXT NOT NULL,

    UNIQUE INDEX `TableColumnConfig_userId_viewName_key`(`userId`, `viewName`),
    PRIMARY KEY (`tableColConfigId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `UsedPassword` ADD CONSTRAINT `UsedPassword_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserSession` ADD CONSTRAINT `UserSession_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserCode` ADD CONSTRAINT `UserCode_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Annoucements` ADD CONSTRAINT `Annoucements_employeeId_fkey` FOREIGN KEY (`employeeId`) REFERENCES `Employee`(`employeeId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PracticePatientAnnoucements` ADD CONSTRAINT `PracticePatientAnnoucements_healthcareFacilityId_fkey` FOREIGN KEY (`healthcareFacilityId`) REFERENCES `HealthcareFacility`(`healthcareFacilityId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PracticePatientAnnoucements` ADD CONSTRAINT `PracticePatientAnnoucements_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PracticePatientAnnoucements` ADD CONSTRAINT `PracticePatientAnnoucements_annoucementId_fkey` FOREIGN KEY (`annoucementId`) REFERENCES `Annoucements`(`annoucementId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AnnouncementRegistery` ADD CONSTRAINT `AnnouncementRegistery_healthcareFacilityId_fkey` FOREIGN KEY (`healthcareFacilityId`) REFERENCES `HealthcareFacility`(`healthcareFacilityId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AnnouncementRegistery` ADD CONSTRAINT `AnnouncementRegistery_employeeId_fkey` FOREIGN KEY (`employeeId`) REFERENCES `Employee`(`employeeId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AnnouncementRegistery` ADD CONSTRAINT `AnnouncementRegistery_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AnnouncementRegistery` ADD CONSTRAINT `AnnouncementRegistery_announcementId_fkey` FOREIGN KEY (`announcementId`) REFERENCES `Annoucements`(`annoucementId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserDevice` ADD CONSTRAINT `UserDevice_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserSetting` ADD CONSTRAINT `UserSetting_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `InsurancePlan` ADD CONSTRAINT `InsurancePlan_insuranceCompanyId_fkey` FOREIGN KEY (`insuranceCompanyId`) REFERENCES `InsuranceCompany`(`insuranceCompanyId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Guardian` ADD CONSTRAINT `Guardian_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Patient` ADD CONSTRAINT `Patient_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Patient` ADD CONSTRAINT `Patient_insurancePlanId_fkey` FOREIGN KEY (`insurancePlanId`) REFERENCES `InsurancePlan`(`insurancePlanId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Patient` ADD CONSTRAINT `Patient_healthcareFacilityId_fkey` FOREIGN KEY (`healthcareFacilityId`) REFERENCES `HealthcareFacility`(`healthcareFacilityId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ActivationStatusHistory` ADD CONSTRAINT `ActivationStatusHistory_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FlagToPatients` ADD CONSTRAINT `FlagToPatients_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FlagToPatients` ADD CONSTRAINT `FlagToPatients_userCreatedId_fkey` FOREIGN KEY (`userCreatedId`) REFERENCES `User`(`userId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `FlagToPatients` ADD CONSTRAINT `FlagToPatients_userResolveId_fkey` FOREIGN KEY (`userResolveId`) REFERENCES `User`(`userId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CommentToPatients` ADD CONSTRAINT `CommentToPatients_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CommentToPatients` ADD CONSTRAINT `CommentToPatients_employeeId_fkey` FOREIGN KEY (`employeeId`) REFERENCES `Employee`(`employeeId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CommentToPatients` ADD CONSTRAINT `CommentToPatients_employeeActivityTimeId_fkey` FOREIGN KEY (`employeeActivityTimeId`) REFERENCES `EmployeeActivityTime`(`employeeServiceTimeId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EmployeeToDesignation` ADD CONSTRAINT `EmployeeToDesignation_employeeId_fkey` FOREIGN KEY (`employeeId`) REFERENCES `Employee`(`employeeId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EmployeeToDesignation` ADD CONSTRAINT `EmployeeToDesignation_designationId_fkey` FOREIGN KEY (`designationId`) REFERENCES `Designation`(`designationId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `GuardianToPatient` ADD CONSTRAINT `GuardianToPatient_guardianId_fkey` FOREIGN KEY (`guardianId`) REFERENCES `Guardian`(`guardianId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `GuardianToPatient` ADD CONSTRAINT `GuardianToPatient_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Document` ADD CONSTRAINT `Document_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Document` ADD CONSTRAINT `Document_reminderInstanceId_fkey` FOREIGN KEY (`reminderInstanceId`) REFERENCES `ReminderInstance`(`reminderInstanceId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Document` ADD CONSTRAINT `Document_employeeId_fkey` FOREIGN KEY (`employeeId`) REFERENCES `Employee`(`employeeId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Document` ADD CONSTRAINT `Document_invoiceId_fkey` FOREIGN KEY (`invoiceId`) REFERENCES `Invoice`(`invoiceId`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DocumentToOrderable` ADD CONSTRAINT `DocumentToOrderable_orderableId_fkey` FOREIGN KEY (`orderableId`) REFERENCES `Orderable`(`orderableId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DocumentToOrderable` ADD CONSTRAINT `DocumentToOrderable_documentId_fkey` FOREIGN KEY (`documentId`) REFERENCES `Document`(`documentId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserRole` ADD CONSTRAINT `UserRole_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserRole` ADD CONSTRAINT `UserRole_roleId_fkey` FOREIGN KEY (`roleId`) REFERENCES `Role`(`roleId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ResourcePermission` ADD CONSTRAINT `ResourcePermission_roleId_fkey` FOREIGN KEY (`roleId`) REFERENCES `Role`(`roleId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Employee` ADD CONSTRAINT `Employee_specialtyId_fkey` FOREIGN KEY (`specialtyId`) REFERENCES `Specialty`(`specialtyId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Employee` ADD CONSTRAINT `Employee_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `HealthcareFacilityToEmployee` ADD CONSTRAINT `HealthcareFacilityToEmployee_employeeId_fkey` FOREIGN KEY (`employeeId`) REFERENCES `Employee`(`employeeId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `HealthcareFacilityToEmployee` ADD CONSTRAINT `HealthcareFacilityToEmployee_healthcareFacilityId_fkey` FOREIGN KEY (`healthcareFacilityId`) REFERENCES `HealthcareFacility`(`healthcareFacilityId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `HealthcareFacility` ADD CONSTRAINT `HealthcareFacility_pocId_fkey` FOREIGN KEY (`pocId`) REFERENCES `Employee`(`employeeId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `HealthcareFacility` ADD CONSTRAINT `HealthcareFacility_chiPOCId_fkey` FOREIGN KEY (`chiPOCId`) REFERENCES `Employee`(`employeeId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `HealthcareFacilityToFaxesEmails` ADD CONSTRAINT `HealthcareFacilityToFaxesEmails_healthcareFacilityId_fkey` FOREIGN KEY (`healthcareFacilityId`) REFERENCES `HealthcareFacility`(`healthcareFacilityId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderableToResultable` ADD CONSTRAINT `OrderableToResultable_orderableId_fkey` FOREIGN KEY (`orderableId`) REFERENCES `Orderable`(`orderableId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderableToResultable` ADD CONSTRAINT `OrderableToResultable_resultableId_fkey` FOREIGN KEY (`resultableId`) REFERENCES `Resultable`(`resultableId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderableValue` ADD CONSTRAINT `OrderableValue_orderableId_fkey` FOREIGN KEY (`orderableId`) REFERENCES `Orderable`(`orderableId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderableValue` ADD CONSTRAINT `OrderableValue_rmsAdmissionId_fkey` FOREIGN KEY (`rmsAdmissionId`) REFERENCES `RMSAdmission`(`rmsAdmissionId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderableValue` ADD CONSTRAINT `OrderableValue_rmsScheduleInstanceId_fkey` FOREIGN KEY (`rmsScheduleInstanceId`) REFERENCES `RMSScheduleInstance`(`rmsScheduleInstanceId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderableValue` ADD CONSTRAINT `OrderableValue_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderableValue` ADD CONSTRAINT `OrderableValue_deviceInventoryId_fkey` FOREIGN KEY (`deviceInventoryId`) REFERENCES `DeviceInventory`(`deviceInventoryId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderableValue` ADD CONSTRAINT `OrderableValue_rmsOrderId_fkey` FOREIGN KEY (`rmsOrderId`) REFERENCES `RMSOrder`(`rmsOrderId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `OrderableValue` ADD CONSTRAINT `OrderableValue_liveOrderableValueId_fkey` FOREIGN KEY (`liveOrderableValueId`) REFERENCES `OrderableValue`(`orderableValueId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ResultableValue` ADD CONSTRAINT `ResultableValue_orderableValueId_fkey` FOREIGN KEY (`orderableValueId`) REFERENCES `OrderableValue`(`orderableValueId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ResultableValue` ADD CONSTRAINT `ResultableValue_resultableId_fkey` FOREIGN KEY (`resultableId`) REFERENCES `Resultable`(`resultableId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ResultableValue` ADD CONSTRAINT `ResultableValue_medicationId_fkey` FOREIGN KEY (`medicationId`) REFERENCES `Medication`(`medicationId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatientResultableRange` ADD CONSTRAINT `PatientResultableRange_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatientResultableRange` ADD CONSTRAINT `PatientResultableRange_resultableId_fkey` FOREIGN KEY (`resultableId`) REFERENCES `Resultable`(`resultableId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RMSAdmission` ADD CONSTRAINT `RMSAdmission_primaryDoctorId_fkey` FOREIGN KEY (`primaryDoctorId`) REFERENCES `Employee`(`employeeId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RMSAdmission` ADD CONSTRAINT `RMSAdmission_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RMSAdmission` ADD CONSTRAINT `RMSAdmission_healthcareFacilityId_fkey` FOREIGN KEY (`healthcareFacilityId`) REFERENCES `HealthcareFacility`(`healthcareFacilityId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RMSAdmissionCaregiver` ADD CONSTRAINT `RMSAdmissionCaregiver_rmsAdmissionId_fkey` FOREIGN KEY (`rmsAdmissionId`) REFERENCES `RMSAdmission`(`rmsAdmissionId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RMSAdmissionCaregiver` ADD CONSTRAINT `RMSAdmissionCaregiver_caregiverId_fkey` FOREIGN KEY (`caregiverId`) REFERENCES `User`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RMSOrder` ADD CONSTRAINT `RMSOrder_rmsAdmissionId_fkey` FOREIGN KEY (`rmsAdmissionId`) REFERENCES `RMSAdmission`(`rmsAdmissionId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RMSOrder` ADD CONSTRAINT `RMSOrder_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RMSOrder` ADD CONSTRAINT `RMSOrder_orderableId_fkey` FOREIGN KEY (`orderableId`) REFERENCES `Orderable`(`orderableId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RMSOrder` ADD CONSTRAINT `RMSOrder_medicationId_fkey` FOREIGN KEY (`medicationId`) REFERENCES `Medication`(`medicationId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RMSOrder` ADD CONSTRAINT `RMSOrder_iCD10CodeId_fkey` FOREIGN KEY (`iCD10CodeId`) REFERENCES `ICD10Code`(`icd10CodeId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RMSOrder` ADD CONSTRAINT `RMSOrder_orderById_fkey` FOREIGN KEY (`orderById`) REFERENCES `Employee`(`employeeId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RMSOrder` ADD CONSTRAINT `RMSOrder_deviceInventoryId_fkey` FOREIGN KEY (`deviceInventoryId`) REFERENCES `DeviceInventory`(`deviceInventoryId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RMSOrderToResultable` ADD CONSTRAINT `RMSOrderToResultable_rmsOrderId_fkey` FOREIGN KEY (`rmsOrderId`) REFERENCES `RMSOrder`(`rmsOrderId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RMSOrderToResultable` ADD CONSTRAINT `RMSOrderToResultable_resultableId_fkey` FOREIGN KEY (`resultableId`) REFERENCES `Resultable`(`resultableId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RMSSchedule` ADD CONSTRAINT `RMSSchedule_rmsOrderId_fkey` FOREIGN KEY (`rmsOrderId`) REFERENCES `RMSOrder`(`rmsOrderId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RMSScheduleInstance` ADD CONSTRAINT `RMSScheduleInstance_rmsScheduleId_fkey` FOREIGN KEY (`rmsScheduleId`) REFERENCES `RMSSchedule`(`rmsScheduleId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RMSScheduleInstance` ADD CONSTRAINT `RMSScheduleInstance_orderableId_fkey` FOREIGN KEY (`orderableId`) REFERENCES `Orderable`(`orderableId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RMSScheduleInstance` ADD CONSTRAINT `RMSScheduleInstance_medicationId_fkey` FOREIGN KEY (`medicationId`) REFERENCES `Medication`(`medicationId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RPMSubject` ADD CONSTRAINT `RPMSubject_orderableValueId_fkey` FOREIGN KEY (`orderableValueId`) REFERENCES `OrderableValue`(`orderableValueId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RPMSubject` ADD CONSTRAINT `RPMSubject_orderableId_fkey` FOREIGN KEY (`orderableId`) REFERENCES `Orderable`(`orderableId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RPMSubject` ADD CONSTRAINT `RPMSubject_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RPMSubject` ADD CONSTRAINT `RPMSubject_ownerId_fkey` FOREIGN KEY (`ownerId`) REFERENCES `User`(`userId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RPMSubject` ADD CONSTRAINT `RPMSubject_escalatedToId_fkey` FOREIGN KEY (`escalatedToId`) REFERENCES `Employee`(`employeeId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RPMMessage` ADD CONSTRAINT `RPMMessage_rpmSubjectId_fkey` FOREIGN KEY (`rpmSubjectId`) REFERENCES `RPMSubject`(`rpmSubjectId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `RPMMessage` ADD CONSTRAINT `RPMMessage_senderId_fkey` FOREIGN KEY (`senderId`) REFERENCES `User`(`userId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserSubject` ADD CONSTRAINT `UserSubject_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserSubject` ADD CONSTRAINT `UserSubject_subjectId_fkey` FOREIGN KEY (`subjectId`) REFERENCES `RPMSubject`(`rpmSubjectId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserMessage` ADD CONSTRAINT `UserMessage_messageId_fkey` FOREIGN KEY (`messageId`) REFERENCES `RPMMessage`(`rpmMessageId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `UserMessage` ADD CONSTRAINT `UserMessage_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DeviceModel` ADD CONSTRAINT `DeviceModel_manufacturerId_fkey` FOREIGN KEY (`manufacturerId`) REFERENCES `Manufacturer`(`manufacturerId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DeviceModel` ADD CONSTRAINT `DeviceModel_deviceTypeId_fkey` FOREIGN KEY (`deviceTypeId`) REFERENCES `DeviceType`(`deviceTypeId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DeviceModelToResultable` ADD CONSTRAINT `DeviceModelToResultable_resultableId_fkey` FOREIGN KEY (`resultableId`) REFERENCES `Resultable`(`resultableId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DeviceModelToResultable` ADD CONSTRAINT `DeviceModelToResultable_deviceModelId_fkey` FOREIGN KEY (`deviceModelId`) REFERENCES `DeviceModel`(`deviceModelId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DeviceInventory` ADD CONSTRAINT `DeviceInventory_deviceModelId_fkey` FOREIGN KEY (`deviceModelId`) REFERENCES `DeviceModel`(`deviceModelId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DeviceInventory` ADD CONSTRAINT `DeviceInventory_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DeviceReceival` ADD CONSTRAINT `DeviceReceival_addedById_fkey` FOREIGN KEY (`addedById`) REFERENCES `User`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DeviceReceival` ADD CONSTRAINT `DeviceReceival_deviceModelId_fkey` FOREIGN KEY (`deviceModelId`) REFERENCES `DeviceModel`(`deviceModelId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DeviceOrder` ADD CONSTRAINT `DeviceOrder_orderById_fkey` FOREIGN KEY (`orderById`) REFERENCES `User`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DeviceOrder` ADD CONSTRAINT `DeviceOrder_deviceModelId_fkey` FOREIGN KEY (`deviceModelId`) REFERENCES `DeviceModel`(`deviceModelId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DeviceInventoryHistory` ADD CONSTRAINT `DeviceInventoryHistory_deviceInventoryId_fkey` FOREIGN KEY (`deviceInventoryId`) REFERENCES `DeviceInventory`(`deviceInventoryId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DeviceInventoryHistory` ADD CONSTRAINT `DeviceInventoryHistory_employeeId_fkey` FOREIGN KEY (`employeeId`) REFERENCES `Employee`(`employeeId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DeviceInventoryHistory` ADD CONSTRAINT `DeviceInventoryHistory_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `DeviceInventoryHistory` ADD CONSTRAINT `DeviceInventoryHistory_userUserId_fkey` FOREIGN KEY (`userUserId`) REFERENCES `User`(`userId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ExternalCommunicationRecord` ADD CONSTRAINT `ExternalCommunicationRecord_sentById_fkey` FOREIGN KEY (`sentById`) REFERENCES `User`(`userId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ExternalCommunicationRecord` ADD CONSTRAINT `ExternalCommunicationRecord_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ExternalCommunicationRecord` ADD CONSTRAINT `ExternalCommunicationRecord_employeeId_fkey` FOREIGN KEY (`employeeId`) REFERENCES `Employee`(`employeeId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ExternalCommunicationRecord` ADD CONSTRAINT `ExternalCommunicationRecord_healthcareFacilityId_fkey` FOREIGN KEY (`healthcareFacilityId`) REFERENCES `HealthcareFacility`(`healthcareFacilityId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Medication` ADD CONSTRAINT `Medication_medicationRouteId_fkey` FOREIGN KEY (`medicationRouteId`) REFERENCES `MedicationRoute`(`medicationRouteId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Medication` ADD CONSTRAINT `Medication_dosageFormId_fkey` FOREIGN KEY (`dosageFormId`) REFERENCES `DosageForm`(`dosageFormId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Medication` ADD CONSTRAINT `Medication_dosageUnitId_fkey` FOREIGN KEY (`dosageUnitId`) REFERENCES `DosageUnit`(`dosageUnitId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Medication` ADD CONSTRAINT `Medication_manufacturerId_fkey` FOREIGN KEY (`manufacturerId`) REFERENCES `Manufacturer`(`manufacturerId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AllergyToPatient` ADD CONSTRAINT `AllergyToPatient_allergyId_fkey` FOREIGN KEY (`allergyId`) REFERENCES `Allergy`(`allergyId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AllergyToPatient` ADD CONSTRAINT `AllergyToPatient_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EventLogs` ADD CONSTRAINT `EventLogs_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EventLogs` ADD CONSTRAINT `EventLogs_orderableId_fkey` FOREIGN KEY (`orderableId`) REFERENCES `Orderable`(`orderableId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EventLogs` ADD CONSTRAINT `EventLogs_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`userId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AuditLogs` ADD CONSTRAINT `AuditLogs_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`userId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AuditLogs` ADD CONSTRAINT `AuditLogs_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `BillableEventReport` ADD CONSTRAINT `BillableEventReport_generatedById_fkey` FOREIGN KEY (`generatedById`) REFERENCES `User`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ICD10Code` ADD CONSTRAINT `ICD10Code_parentId_fkey` FOREIGN KEY (`parentId`) REFERENCES `ICD10Code`(`icd10CodeId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EmployeeToICD10Code` ADD CONSTRAINT `EmployeeToICD10Code_employeeId_fkey` FOREIGN KEY (`employeeId`) REFERENCES `Employee`(`employeeId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EmployeeToICD10Code` ADD CONSTRAINT `EmployeeToICD10Code_icd10CodeId_fkey` FOREIGN KEY (`icd10CodeId`) REFERENCES `ICD10Code`(`icd10CodeId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatientToICD10Code` ADD CONSTRAINT `PatientToICD10Code_addedById_fkey` FOREIGN KEY (`addedById`) REFERENCES `User`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatientToICD10Code` ADD CONSTRAINT `PatientToICD10Code_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatientToICD10Code` ADD CONSTRAINT `PatientToICD10Code_icd10CodeId_fkey` FOREIGN KEY (`icd10CodeId`) REFERENCES `ICD10Code`(`icd10CodeId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AppSessionState` ADD CONSTRAINT `AppSessionState_userDeviceId_fkey` FOREIGN KEY (`userDeviceId`) REFERENCES `UserDevice`(`userDeviceId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AppSessionState` ADD CONSTRAINT `AppSessionState_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `AppSessionStateLog` ADD CONSTRAINT `AppSessionStateLog_appSessionStateId_fkey` FOREIGN KEY (`appSessionStateId`) REFERENCES `AppSessionState`(`appSessionStateId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatientDeviceState` ADD CONSTRAINT `PatientDeviceState_deviceId_fkey` FOREIGN KEY (`deviceId`) REFERENCES `DeviceInventory`(`deviceInventoryId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatientDeviceState` ADD CONSTRAINT `PatientDeviceState_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatientDeviceStateLog` ADD CONSTRAINT `PatientDeviceStateLog_deviceId_fkey` FOREIGN KEY (`deviceId`) REFERENCES `DeviceInventory`(`deviceInventoryId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatientDeviceStateLog` ADD CONSTRAINT `PatientDeviceStateLog_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Reminder` ADD CONSTRAINT `Reminder_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Reminder` ADD CONSTRAINT `Reminder_ownerId_fkey` FOREIGN KEY (`ownerId`) REFERENCES `User`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Reminder` ADD CONSTRAINT `Reminder_reminderTypeId_fkey` FOREIGN KEY (`reminderTypeId`) REFERENCES `ReminderType`(`reminderTypeId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ReminderUser` ADD CONSTRAINT `ReminderUser_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ReminderUser` ADD CONSTRAINT `ReminderUser_reminderId_fkey` FOREIGN KEY (`reminderId`) REFERENCES `Reminder`(`reminderId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ReminderInstance` ADD CONSTRAINT `ReminderInstance_reminderId_fkey` FOREIGN KEY (`reminderId`) REFERENCES `Reminder`(`reminderId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ReminderInstance` ADD CONSTRAINT `ReminderInstance_calledByEmployeeId_fkey` FOREIGN KEY (`calledByEmployeeId`) REFERENCES `Employee`(`employeeId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EmployeeActivityTime` ADD CONSTRAINT `EmployeeActivityTime_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EmployeeActivityTime` ADD CONSTRAINT `EmployeeActivityTime_employeeId_fkey` FOREIGN KEY (`employeeId`) REFERENCES `Employee`(`employeeId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Call` ADD CONSTRAINT `Call_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Call` ADD CONSTRAINT `Call_callerEmployeeId_fkey` FOREIGN KEY (`callerEmployeeId`) REFERENCES `Employee`(`employeeId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Call` ADD CONSTRAINT `Call_healthcareFacilityId_fkey` FOREIGN KEY (`healthcareFacilityId`) REFERENCES `HealthcareFacility`(`healthcareFacilityId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `QUQuestionnaire` ADD CONSTRAINT `QUQuestionnaire_orderableId_fkey` FOREIGN KEY (`orderableId`) REFERENCES `Orderable`(`orderableId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `QUQuestion` ADD CONSTRAINT `QUQuestion_qUQuestionnaireId_fkey` FOREIGN KEY (`qUQuestionnaireId`) REFERENCES `QUQuestionnaire`(`questionnaireId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `QUQuestionnaireToICD10Code` ADD CONSTRAINT `QUQuestionnaireToICD10Code_questionnaireId_fkey` FOREIGN KEY (`questionnaireId`) REFERENCES `QUQuestionnaire`(`questionnaireId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `QUQuestionnaireToICD10Code` ADD CONSTRAINT `QUQuestionnaireToICD10Code_icd10CodeId_fkey` FOREIGN KEY (`icd10CodeId`) REFERENCES `ICD10Code`(`icd10CodeId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `QUAnswerSheet` ADD CONSTRAINT `QUAnswerSheet_questionnaireId_fkey` FOREIGN KEY (`questionnaireId`) REFERENCES `QUQuestionnaire`(`questionnaireId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `QUAnswerSheet` ADD CONSTRAINT `QUAnswerSheet_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `QUAnswerSheet` ADD CONSTRAINT `QUAnswerSheet_conductedById_fkey` FOREIGN KEY (`conductedById`) REFERENCES `User`(`userId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `QUAnswerSheet` ADD CONSTRAINT `QUAnswerSheet_reminderInstanceId_fkey` FOREIGN KEY (`reminderInstanceId`) REFERENCES `ReminderInstance`(`reminderInstanceId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `QUAnswerSheet` ADD CONSTRAINT `QUAnswerSheet_icd10CodeId_fkey` FOREIGN KEY (`icd10CodeId`) REFERENCES `ICD10Code`(`icd10CodeId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `QUAnswerSheet` ADD CONSTRAINT `QUAnswerSheet_documentId_fkey` FOREIGN KEY (`documentId`) REFERENCES `Document`(`documentId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `QUAnswer` ADD CONSTRAINT `QUAnswer_answerSheetId_fkey` FOREIGN KEY (`answerSheetId`) REFERENCES `QUAnswerSheet`(`answerSheetId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `QUAnswer` ADD CONSTRAINT `QUAnswer_questionId_fkey` FOREIGN KEY (`questionId`) REFERENCES `QUQuestion`(`questionId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `USEscalation` ADD CONSTRAINT `USEscalation_openedById_fkey` FOREIGN KEY (`openedById`) REFERENCES `Employee`(`employeeId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `USEscalation` ADD CONSTRAINT `USEscalation_handledById_fkey` FOREIGN KEY (`handledById`) REFERENCES `Employee`(`employeeId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `USEscalation` ADD CONSTRAINT `USEscalation_orderableValueId_fkey` FOREIGN KEY (`orderableValueId`) REFERENCES `OrderableValue`(`orderableValueId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `USEscalation` ADD CONSTRAINT `USEscalation_level1answerSheetId_fkey` FOREIGN KEY (`level1answerSheetId`) REFERENCES `QUAnswerSheet`(`answerSheetId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `USEscalation` ADD CONSTRAINT `USEscalation_level2answerSheetId_fkey` FOREIGN KEY (`level2answerSheetId`) REFERENCES `QUAnswerSheet`(`answerSheetId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EscalationGraphOrderable` ADD CONSTRAINT `EscalationGraphOrderable_orderableId_fkey` FOREIGN KEY (`orderableId`) REFERENCES `Orderable`(`orderableId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `EscalationGraphOrderable` ADD CONSTRAINT `EscalationGraphOrderable_usEscalationId_fkey` FOREIGN KEY (`usEscalationId`) REFERENCES `USEscalation`(`usEscalationId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatientRecruitment` ADD CONSTRAINT `PatientRecruitment_recruitedById_fkey` FOREIGN KEY (`recruitedById`) REFERENCES `User`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatientRecruitment` ADD CONSTRAINT `PatientRecruitment_healthcareFacilityId_fkey` FOREIGN KEY (`healthcareFacilityId`) REFERENCES `HealthcareFacility`(`healthcareFacilityId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `healthcareFacilityToCPTCode` ADD CONSTRAINT `healthcareFacilityToCPTCode_cptCodeId_fkey` FOREIGN KEY (`cptCodeId`) REFERENCES `CPTCode`(`cptCodeId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `healthcareFacilityToCPTCode` ADD CONSTRAINT `healthcareFacilityToCPTCode_healthcareFacilityId_fkey` FOREIGN KEY (`healthcareFacilityId`) REFERENCES `HealthcareFacility`(`healthcareFacilityId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Invoice` ADD CONSTRAINT `Invoice_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Invoice` ADD CONSTRAINT `Invoice_healthcareFacilityId_fkey` FOREIGN KEY (`healthcareFacilityId`) REFERENCES `HealthcareFacility`(`healthcareFacilityId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Invoice` ADD CONSTRAINT `Invoice_healthcareFacilityInvoiceId_fkey` FOREIGN KEY (`healthcareFacilityInvoiceId`) REFERENCES `HealthcareFacilityInvoice`(`healthcareFacilityInvoiceId`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CommunicationLog` ADD CONSTRAINT `CommunicationLog_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `InvoiceToCptCode` ADD CONSTRAINT `InvoiceToCptCode_cPTCodeId_fkey` FOREIGN KEY (`cPTCodeId`) REFERENCES `CPTCode`(`cptCodeId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `InvoiceToCptCode` ADD CONSTRAINT `InvoiceToCptCode_invoiceId_fkey` FOREIGN KEY (`invoiceId`) REFERENCES `Invoice`(`invoiceId`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `InvoiceToCptCode` ADD CONSTRAINT `InvoiceToCptCode_faxCommunicationLogId_fkey` FOREIGN KEY (`faxCommunicationLogId`) REFERENCES `CommunicationLog`(`communicationLogId`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `InvoiceToCptCode` ADD CONSTRAINT `InvoiceToCptCode_emailCommunicationLogId_fkey` FOREIGN KEY (`emailCommunicationLogId`) REFERENCES `CommunicationLog`(`communicationLogId`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `HealthcareFacilityInvoice` ADD CONSTRAINT `HealthcareFacilityInvoice_healthcareFacilityId_fkey` FOREIGN KEY (`healthcareFacilityId`) REFERENCES `HealthcareFacility`(`healthcareFacilityId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TrainingMaterial` ADD CONSTRAINT `TrainingMaterial_orderableId_fkey` FOREIGN KEY (`orderableId`) REFERENCES `Orderable`(`orderableId`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ReminderInstanceToICD10Code` ADD CONSTRAINT `ReminderInstanceToICD10Code_iCD10CodeId_fkey` FOREIGN KEY (`iCD10CodeId`) REFERENCES `ICD10Code`(`icd10CodeId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `ReminderInstanceToICD10Code` ADD CONSTRAINT `ReminderInstanceToICD10Code_reminderInstanceId_fkey` FOREIGN KEY (`reminderInstanceId`) REFERENCES `ReminderInstance`(`reminderInstanceId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `PatientProgressReport` ADD CONSTRAINT `PatientProgressReport_patientId_fkey` FOREIGN KEY (`patientId`) REFERENCES `Patient`(`patientId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CallTimeRecord` ADD CONSTRAINT `CallTimeRecord_patientProgressReportId_fkey` FOREIGN KEY (`patientProgressReportId`) REFERENCES `PatientProgressReport`(`patientProgressReportId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TableColumnConfig` ADD CONSTRAINT `TableColumnConfig_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`userId`) ON DELETE RESTRICT ON UPDATE CASCADE;
