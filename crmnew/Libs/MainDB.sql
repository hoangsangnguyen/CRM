USE [master]
GO
/****** Object:  Database [CRM]    Script Date: 08/07/2014 10:06:50 ******/
CREATE DATABASE [CRM] ON  PRIMARY 
( NAME = N'CRM', FILENAME = N'D:\Data\MSSQL2008\Data\CRM.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CRM_log', FILENAME = N'D:\Data\MSSQL2008\Logs\CRM_log.ldf' , SIZE = 8384KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CRM] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CRM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CRM] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [CRM] SET ANSI_NULLS OFF
GO
ALTER DATABASE [CRM] SET ANSI_PADDING OFF
GO
ALTER DATABASE [CRM] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [CRM] SET ARITHABORT OFF
GO
ALTER DATABASE [CRM] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [CRM] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [CRM] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [CRM] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [CRM] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [CRM] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [CRM] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [CRM] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [CRM] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [CRM] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [CRM] SET  DISABLE_BROKER
GO
ALTER DATABASE [CRM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [CRM] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [CRM] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [CRM] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [CRM] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [CRM] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [CRM] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [CRM] SET  READ_WRITE
GO
ALTER DATABASE [CRM] SET RECOVERY FULL
GO
ALTER DATABASE [CRM] SET  MULTI_USER
GO
ALTER DATABASE [CRM] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [CRM] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'CRM', N'ON'
GO
USE [CRM]
GO
/****** Object:  Table [dbo].[crm_Tenants]    Script Date: 08/07/2014 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Tenants](
	[TenantId] [int] IDENTITY(10000,1) NOT NULL,
	[AssignedUserId] [int] NULL,
	[TenantName] [nvarchar](200) NULL,
	[TenantNameAlias] [nvarchar](200) NULL,
	[DbName] [nvarchar](50) NULL,
	[DbUsername] [nvarchar](50) NULL,
	[DbPassword] [nvarchar](50) NULL,
	[Phone] [nvarchar](25) NULL,
	[Email] [nvarchar](100) NULL,
	[PaymentDays] [int] NULL,
	[DataSpace] [int] NULL,
	[Subscribers] [int] NULL,
	[PlanType] [int] NULL,
	[Fax] [nvarchar](50) NULL,
	[OrgNumber] [nvarchar](20) NULL,
	[Rating] [nvarchar](50) NULL,
	[Street] [nvarchar](200) NULL,
	[Website] [nvarchar](200) NULL,
	[City] [nvarchar](100) NULL,
	[State] [int] NULL,
	[CountryId] [int] NULL,
	[ZipCode] [nvarchar](15) NULL,
	[Description] [text] NULL,
	[CompanyLogo] [nvarchar](200) NULL,
	[CompanyGroup] [nvarchar](100) NULL,
	[CompanyAdditionalInfo] [ntext] NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[Active] [bit] NULL,
	[LinkedURL] [nvarchar](200) NULL,
	[FacebookURL] [nvarchar](200) NULL,
	[TwitterURL] [nvarchar](200) NULL,
	[GoogleplusURL] [nvarchar](100) NULL,
	[Information] [ntext] NULL,
	[PostedAddress] [nvarchar](200) NULL,
	[PostedDistrict] [nvarchar](15) NULL,
	[PostedNumber] [nvarchar](15) NULL,
	[VisitingAddress] [nvarchar](200) NULL,
	[VisitingDistrict] [nvarchar](15) NULL,
	[VisitingNumber] [nvarchar](15) NULL,
	[PackageId] [int] NULL,
 CONSTRAINT [PK__crm_Tena__2E9B47E10AD2A005] PRIMARY KEY CLUSTERED 
(
	[TenantId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[crm_Tenants] ON
INSERT [dbo].[crm_Tenants] ([TenantId], [AssignedUserId], [TenantName], [TenantNameAlias], [DbName], [DbUsername], [DbPassword], [Phone], [Email], [PaymentDays], [DataSpace], [Subscribers], [PlanType], [Fax], [OrgNumber], [Rating], [Street], [Website], [City], [State], [CountryId], [ZipCode], [Description], [CompanyLogo], [CompanyGroup], [CompanyAdditionalInfo], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Active], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Information], [PostedAddress], [PostedDistrict], [PostedNumber], [VisitingAddress], [VisitingDistrict], [VisitingNumber], [PackageId]) VALUES (10097, 1, N'DEMO0953', N'DEMO0953', N'MultiOrg_DEMO0953', N'DEMO0953', N'DEMO0953', NULL, N'DEMO0953@gmail.com', NULL, NULL, NULL, NULL, NULL, N'0953', NULL, NULL, N'http://multiorg.cateno.vn/DEMO0953', NULL, NULL, 4, NULL, NULL, N'/tenants/DEMO0953/default.png', NULL, NULL, 59, CAST(0x0000A37F00A32612 AS DateTime), 59, CAST(0x0000A37F00A32612 AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[crm_Tenants] ([TenantId], [AssignedUserId], [TenantName], [TenantNameAlias], [DbName], [DbUsername], [DbPassword], [Phone], [Email], [PaymentDays], [DataSpace], [Subscribers], [PlanType], [Fax], [OrgNumber], [Rating], [Street], [Website], [City], [State], [CountryId], [ZipCode], [Description], [CompanyLogo], [CompanyGroup], [CompanyAdditionalInfo], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Active], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Information], [PostedAddress], [PostedDistrict], [PostedNumber], [VisitingAddress], [VisitingDistrict], [VisitingNumber], [PackageId]) VALUES (10098, 1, N'Demo0959', N'Demo0959', N'MultiOrg_Demo0959', N'Demo0959', N'Demo0959', NULL, N'Demo0959@gmail.com', NULL, NULL, NULL, NULL, NULL, N'0959', NULL, NULL, N'http://multiorg.cateno.vn/Demo0959', NULL, NULL, 4, NULL, NULL, N'/tenants/Demo0959/default.png', NULL, NULL, 59, CAST(0x0000A37F00A4C21B AS DateTime), 59, CAST(0x0000A37F00A4C21B AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[crm_Tenants] ([TenantId], [AssignedUserId], [TenantName], [TenantNameAlias], [DbName], [DbUsername], [DbPassword], [Phone], [Email], [PaymentDays], [DataSpace], [Subscribers], [PlanType], [Fax], [OrgNumber], [Rating], [Street], [Website], [City], [State], [CountryId], [ZipCode], [Description], [CompanyLogo], [CompanyGroup], [CompanyAdditionalInfo], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Active], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Information], [PostedAddress], [PostedDistrict], [PostedNumber], [VisitingAddress], [VisitingDistrict], [VisitingNumber], [PackageId]) VALUES (10099, 1, N'Demo1058', N'Demo1058', N'MultiOrg_Demo1058', N'Demo1058', N'Demo1058', N'0987636779', N'Demo1058@gmail.com', NULL, NULL, NULL, NULL, N'01235', N'1058201412', NULL, NULL, N'http://multiorg.cateno.vn/Demo1058', NULL, NULL, 4, NULL, NULL, N'/tenants/Demo1058/default.png', NULL, NULL, 59, CAST(0x0000A37F00B52E19 AS DateTime), 59, CAST(0x0000A37F00B9C0F1 AS DateTime), 1, NULL, NULL, NULL, NULL, N'Demo1058', N'123', N'SNARØYA', N'1335', N'123', N'SANDVIKA', N'1337', 1)
INSERT [dbo].[crm_Tenants] ([TenantId], [AssignedUserId], [TenantName], [TenantNameAlias], [DbName], [DbUsername], [DbPassword], [Phone], [Email], [PaymentDays], [DataSpace], [Subscribers], [PlanType], [Fax], [OrgNumber], [Rating], [Street], [Website], [City], [State], [CountryId], [ZipCode], [Description], [CompanyLogo], [CompanyGroup], [CompanyAdditionalInfo], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Active], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Information], [PostedAddress], [PostedDistrict], [PostedNumber], [VisitingAddress], [VisitingDistrict], [VisitingNumber], [PackageId]) VALUES (10100, 2, N'demo 1333', N'demo1333', N'MultiOrg_demo1333', N'demo1333', N'demo1333', N'0987636779', N'demo1333@gmail.com', NULL, NULL, NULL, NULL, N'0983', N'1333', NULL, NULL, N'http://multiorg.cateno.vn/demo1333', NULL, NULL, 4, NULL, NULL, N'/tenants/demo1333/default.png', NULL, NULL, 59, CAST(0x0000A37F00DF8DBA AS DateTime), 1, CAST(0x0000A37F00FAC97B AS DateTime), 1, NULL, NULL, NULL, NULL, N'info', N'1337', N'SANDVIKA', N'1337', N'1335', N'SNARØYA', N'1335', 1)
INSERT [dbo].[crm_Tenants] ([TenantId], [AssignedUserId], [TenantName], [TenantNameAlias], [DbName], [DbUsername], [DbPassword], [Phone], [Email], [PaymentDays], [DataSpace], [Subscribers], [PlanType], [Fax], [OrgNumber], [Rating], [Street], [Website], [City], [State], [CountryId], [ZipCode], [Description], [CompanyLogo], [CompanyGroup], [CompanyAdditionalInfo], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Active], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Information], [PostedAddress], [PostedDistrict], [PostedNumber], [VisitingAddress], [VisitingDistrict], [VisitingNumber], [PackageId]) VALUES (10101, 1, N'demo1623', N'demo1623', N'MultiOrg_demo1623', N'demo1623', N'demo1623', NULL, N'demo1623@gmail.com', NULL, NULL, NULL, NULL, NULL, N'16232014', NULL, NULL, N'http://multiorg.cateno.vn/demo1623', NULL, NULL, 4, NULL, NULL, N'/tenants/demo1623/default.png', NULL, NULL, 59, CAST(0x0000A37F010E6971 AS DateTime), 59, CAST(0x0000A37F010E6971 AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[crm_Tenants] ([TenantId], [AssignedUserId], [TenantName], [TenantNameAlias], [DbName], [DbUsername], [DbPassword], [Phone], [Email], [PaymentDays], [DataSpace], [Subscribers], [PlanType], [Fax], [OrgNumber], [Rating], [Street], [Website], [City], [State], [CountryId], [ZipCode], [Description], [CompanyLogo], [CompanyGroup], [CompanyAdditionalInfo], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Active], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Information], [PostedAddress], [PostedDistrict], [PostedNumber], [VisitingAddress], [VisitingDistrict], [VisitingNumber], [PackageId]) VALUES (10102, 1, N'testABCD', N'testABCD', N'MultiOrg_testABCD', N'testABCD', N'testABCD', NULL, N'testABCD@yahoo.com', NULL, NULL, NULL, NULL, NULL, N'1334455', NULL, NULL, N'http://multiorg.cateno.vn/testABCD', NULL, NULL, 4, NULL, NULL, N'/tenants/testABCD/default.png', NULL, NULL, 59, CAST(0x0000A380009E9FB2 AS DateTime), 59, CAST(0x0000A380009E9FB2 AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 3)
SET IDENTITY_INSERT [dbo].[crm_Tenants] OFF
/****** Object:  Table [dbo].[crm_Setting]    Script Date: 08/07/2014 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Setting](
	[SettingId] [int] NOT NULL,
	[Url] [nvarchar](50) NULL,
	[Protocol] [nvarchar](50) NULL,
	[TimeZone] [float] NULL,
	[DateFormat] [nvarchar](50) NULL,
	[TimeFormat] [nvarchar](50) NULL,
	[LanguageCode] [nvarchar](10) NULL,
	[GoogleId] [nvarchar](200) NULL,
	[GoogleSecret] [nvarchar](200) NULL,
	[FacebookId] [nvarchar](200) NULL,
	[FacebookSecret] [nvarchar](200) NULL,
	[TwitterId] [nvarchar](200) NULL,
	[TwitterSecret] [nvarchar](200) NULL,
	[LinkedInId] [nvarchar](200) NULL,
	[LinkedInSecret] [nvarchar](200) NULL,
	[Email] [nvarchar](50) NULL,
	[Currency] [nvarchar](50) NULL,
 CONSTRAINT [PK_crm_Setting] PRIMARY KEY CLUSTERED 
(
	[SettingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[crm_Setting] ([SettingId], [Url], [Protocol], [TimeZone], [DateFormat], [TimeFormat], [LanguageCode], [GoogleId], [GoogleSecret], [FacebookId], [FacebookSecret], [TwitterId], [TwitterSecret], [LinkedInId], [LinkedInSecret], [Email], [Currency]) VALUES (1, N'http', N'Protocol', 0, N'dd/mm/yyy', N'00:00:00', N'en-US', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
/****** Object:  Table [dbo].[crm_Roles]    Script Date: 08/07/2014 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NULL,
	[MaskPermission] [bigint] NULL,
	[TenantId] [int] NOT NULL,
	[PermissionType] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[crm_Roles] ON
INSERT [dbo].[crm_Roles] ([ID], [RoleName], [Description], [Active], [MaskPermission], [TenantId], [PermissionType]) VALUES (2, N'Super Administrators', NULL, 1, 2063, 0, 2048)
INSERT [dbo].[crm_Roles] ([ID], [RoleName], [Description], [Active], [MaskPermission], [TenantId], [PermissionType]) VALUES (7, N'Operators', N'', 1, 1039, 0, 1024)
INSERT [dbo].[crm_Roles] ([ID], [RoleName], [Description], [Active], [MaskPermission], [TenantId], [PermissionType]) VALUES (31, N'Administrators', NULL, 1, 527, 0, 512)
SET IDENTITY_INSERT [dbo].[crm_Roles] OFF
/****** Object:  Table [dbo].[crm_Phrases]    Script Date: 08/07/2014 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Phrases](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PhraseName] [nvarchar](100) NULL,
	[PhraseType] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[crm_Phrases] ON
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (1, N'Global.Login.lblUserName', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (2, N'Global.Login.lblPassword', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (3, N'Global.Login.btnLogin', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (4, N'Global.Login.lblRemember', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (5, N'Global.Login.lblLogin', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (6, N'Global.Login.lblLoginPanel', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (7, N'Global.Login.lblForgetPassword', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (8, N'Global.Login.lblContact', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (9, N'Global.Login.lblMail', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (10, N'Global.Login.btnSendMail', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (11, N'Global.Login.lblTitle', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (12, N'Global.Login.lblContent', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (13, N'Global.Login.btnSendContact', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (14, N'Global.Login.lblNotice', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (15, N'Global.Login.lblRefresh', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (16, N'Global.Login.txtUserName_required', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (17, N'Global.Login.lblUserNameOrPasswordError', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (18, N'Global.Login.lblSecurityCodeError', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (19, N'Global.Contact.lblForget_UserNameAndPassword_required', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (20, N'Global.Login.lblSecurityCode_required', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (21, N'Global.Login.lblEmailError', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (22, N'Global.Login.lblSendEmailError', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (23, N'Global.Login.lblSendEmailSuccessfull', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (24, N'Global.Login.lblSendContactError', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (25, N'Global.Login.lblSendContactSuccessfull', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (26, N'Global.Login.lblContent_UserNameAndTitle_required', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (27, N'Global.Login.lblContent_required', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (28, N'Log.TitleManage', N'Log')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (29, N'Log.CountLog', N'Log')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (30, N'Global.Home', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (31, N'Global.DateTime', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (32, N'Log.Component', N'Log')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (33, N'Global.Action', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (34, N'Global.Result', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (35, N'Global.IP', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (36, N'Global.Browser', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (37, N'Global.Account', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (38, N'Log.LogDetail', N'Log')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (39, N'Log.Computer', N'Log')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (40, N'Log.Platform', N'Log')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (41, N'Global.Back', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (42, N'Global.Search', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (43, N'Tenant.TitleManage', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (44, N'Tenant.Add', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (45, N'Tenant.TenantName', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (46, N'Tenant.TenantNameAlias', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (47, N'Global.Logo', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (48, N'Tenant.OrgNumber', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (49, N'Tenant.CreatedDate', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (50, N'Global.Active', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (51, N'Tenant.TenantName_required', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (52, N'Tenant.AssignedUserId', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (53, N'Tenant.AssignedUserId_required', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (54, N'Tenant.TenantNameAlias_required', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (55, N'Tenant.DbName', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (56, N'Tenant.DbUsername', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (57, N'Tenant.DbUsername_required', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (58, N'Tenant.DbPassword', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (59, N'Tenant.DbPassword_required', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (60, N'Tenant.Email', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (61, N'Tenant.Email_required', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (62, N'Tenant.PaymentDays', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (63, N'Tenant.DataSpace', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (64, N'Tenant.Subscribers', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (65, N'Tenant.PlanType', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (66, N'Tenant.PostedAddress', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (67, N'Tenant.VisitingAddress', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (68, N'Tenant.Fax', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (69, N'Tenant.Rating', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (70, N'Tenant.Street', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (71, N'Tenant.Website', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (72, N'Tenant.City', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (73, N'Tenant.State', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (74, N'Tenant.CountryId', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (75, N'CountryId_required', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (76, N'Tenant.CompanyLogo', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (77, N'Tenant.CompanyGroup', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (78, N'Tenant.CompanyAdditionalInfo', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (79, N'Tenant.Information', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (80, N'Tenant.CreatedBy', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (81, N'Tenant.ModifiedBy', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (82, N'Tenant.LinkedURL', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (83, N'Tenant.FacebookURL', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (84, N'Tenant.GoogleplusURL', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (85, N'Tenant.ModifiedDate', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (86, N'Tenant.Active', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (87, N'Tenant.ContactName', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (88, N'Tenant.ContactName_required', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (89, N'Tenant.ContactPhone', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (90, N'Tenant.MobilePhone', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (91, N'Tenant.ContactEmail', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (92, N'Tenant.ContactEmail_required', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (93, N'Username_required', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (94, N'Tenant.Username', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (95, N'Tenant.Password', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (96, N'Password_required', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (97, N'Tenant.CountryName', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (98, N'Global.Avatar', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (99, N'Global.Url', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (101, N'Customer.PostalAddress', N'Customer')
GO
print 'Processed 100 total records'
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (102, N'Customer.VisitingAddress', N'Customer')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (103, N'Customer.Information', N'Customer')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (104, N'Customer.Firstname', N'Customer')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (105, N'Customer.Lastname', N'Customer')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (106, N'Customer.ContactPhone', N'Customer')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (107, N'Customer.Address', N'Customer')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (108, N'Log.Content', N'Log')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (109, N'Global.Save', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (110, N'Global.Cancel', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (111, N'Customer.RequireRightExtension', N'Customer')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (112, N'Customer.ManageCustomer', N'Customer')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (113, N'Customer.Customer', N'Customer')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (114, N'Tenant.AliasAvailable', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (115, N'Tenant.AliasNotAvailable', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (116, N'Tenant.AliasAlreadyTaken', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (117, N'Global.ValidateUploadImage', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (118, N'Customer.Contacts', N'Customer')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (119, N'Customer.Projects', N'Customer')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (120, N'Customer.Tickets', N'Customer')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (121, N'Customer.Calendar', N'Customer')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (122, N'Customer.Billing', N'Customer')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (123, N'Contact.FirstName', N'Contact')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (124, N'Contact.LastName', N'Contact')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (125, N'Contact.Customer', N'Contact')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (126, N'Contact.SelectCustomer', N'Contact')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (127, N'Contact.Gender', N'Contact')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (128, N'Contact.Address', N'Contact')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (129, N'Contact.CreatedDate', N'Contact')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (130, N'Contact.Add', N'Contact')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (131, N'Contact.Contact', N'Contact')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (132, N'Contact.Edit', N'Contact')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (133, N'Global.Edit', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (134, N'Contact.AddNew', N'Contact')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (135, N'Global.View', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (136, N'Global.String_length', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (138, N'Tenant.TenantDetail', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (139, N'Tenant.TenantEdit', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (141, N'Contact.DeleteSuccessfull', N'Contact')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (142, N'Contact.DeleteError', N'Contact')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (143, N'Contact.ConfirmDelete', N'Contact')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (144, N'Global.Login.WrongAliasSubDomain', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (145, N'Tenant.Phone', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (146, N'Tenant.PostedDistrict', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (147, N'Tenant.PostedNumber', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (148, N'Tenant.VisitingDistrict', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (149, N'Tenant.VisitingNumber', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (150, N'Global.AccessDeny', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (151, N'Global.Warning', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (152, N'Role.NotHavePermission', N'Role')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (153, N'Global.Login.lbNewlPassword', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (154, N'Role.AccessRight', N'Role')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (155, N'Global.Login.ConfirmlbNewlPassword', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (156, N'Role.Customer', N'Role')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (157, N'ContactLogin.NotmathPassword', N'ContactLogin')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (158, N'Role.ChooseCustomer', N'Role')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (159, N'ContactLogin.InActiveURL', N'ContactLogin')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (160, N'UserGroups.ManageUsergroups', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (161, N'UserGroups.AddNewGroup', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (162, N'Customer.CustomerDetail', N'Customer')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (163, N'User.CurrentPassword', N'User')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (164, N'Global.Welcome', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (165, N'User.ChangePassword', N'User')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (166, N'User.EditProfile', N'User')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (167, N'User.Logout', N'User')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (168, N'Global.OK', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (169, N'Tenant.OrgNumber_required', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (170, N'Global.Email_regex', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (172, N'Tenant.Position', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (173, N'Tenant.ContactEmail_remote', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (175, N'ChangePassword_Successfull', N'ContactLogin')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (176, N'Global.Change', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (178, N'Global.Login.txtPassword_required', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (179, N'Username_remote', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (180, N'PasswordForget_required', N'ContactLogin')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (181, N'Email_remote', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (182, N'OrgNumber_remote', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (183, N'Global.Login.lblUserDeActive', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (184, N'UserGroups.Header', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (185, N'UserGroups.ID', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (186, N'UserGroups.PermissionType', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (187, N'UserGroups.Description', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (188, N'UserGroups.Delete', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (189, N'UserGroups.InputRequireFields', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (190, N'UserGroups.PermissionTypeNotExist', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (191, N'UserGroups.UsergroupNotExist', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (192, N'UserGroups.UsergroupNameNotExist', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (193, N'UserGroups.ChooseTenant', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (194, N'Global.SaveSuccessfully', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (195, N'Global.SaveUnSuccessfully', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (196, N'Tenant.Deactive_msg', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (197, N'Tenant.Active_msg', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (198, N'Tenant.AskDeActive_msg', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (199, N'Tenant.AskActive_msg', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (200, N'Tenant.ModalTitle', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (201, N'Tenant.CompanyProfiles', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (202, N'Global.Username', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (203, N'Global.Password', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (204, N'Users.ConfirmPassword', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (205, N'Global.Email', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (206, N'Users.FullName', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (207, N'Users.GroupName', N'Users')
GO
print 'Processed 200 total records'
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (208, N'Users.Sudo', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (209, N'Users.ManageUsers', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (210, N'Users.PleaseConfirmAdminPassword', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (211, N'Users.SudoThisUser', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (212, N'Global.Required', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (213, N'Global.WhiteSpace_regex', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (214, N'Tenant.EmailAlreadyExist', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (215, N'Tenant.OrgNumberAlreadyExist', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (216, N'Tenant.Username_required', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (217, N'UserGroups.TotalUser', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (218, N'Package.Name', N'Package')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (219, N'Package.UserNumber', N'Package')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (220, N'Package.ProjectNumber', N'Package')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (221, N'Package.CustomerNumber', N'Package')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (222, N'Tenant.PackageId', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (223, N'Tenant.PackageId_required', N'Tenant')
SET IDENTITY_INSERT [dbo].[crm_Phrases] OFF
/****** Object:  Table [dbo].[crm_PhraseLanguages]    Script Date: 08/07/2014 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_PhraseLanguages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PhraseValue] [nvarchar](max) NULL,
	[LanguageCode] [nvarchar](10) NULL,
	[PhraseID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[crm_PhraseLanguages] ON
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (1, N'User Name', N'en-US', 1)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (2, N'User NB', N'nb-NO', 1)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (5, N'Login', N'en-US', 3)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (6, N'Login', N'nb-NO', 3)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (7, N'Password', N'en-US', 2)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (8, N'Password', N'en-US', 2)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (9, N'RememberMe', N'en-US', 4)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (10, N'RememberMe', N'nb-NO', 4)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (11, N'Login here', N'en-US', 5)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (12, N'Login Panel', N'en-US', 6)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (13, N' Forgot Password', N'en-US', 7)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (14, N'Contact Us', N'en-US', 8)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (15, N'Email', N'en-US', 9)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (16, N'Send New Password', N'en-US', 10)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (17, N'Title', N'en-US', 11)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (18, N'Content', N'en-US', 12)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (19, N'Send Contact', N'en-US', 13)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (20, N'Notice', N'en-US', 14)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (21, N'Please input UserName', N'en-US', 16)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (22, N'The user name or password provided is incorrect.', N'en-US', 17)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (23, N'Security code is invalid', N'en-US', 18)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (24, N'Please enter a your  Email.', N'en-US', 19)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (25, N'Security code is required', N'en-US', 20)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (26, N'Email incorrect.', N'en-US', 21)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (27, N'Send contact error. Email address not exists.', N'en-US', 24)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (28, N'Send contact successfull.', N'en-US', 25)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (29, N'Send email error. Email address not exists.', N'en-US', 22)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (30, N'Send email successfull.', N'en-US', 23)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (31, N'Please enter a your username and Title.', N'en-US', 26)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (32, N'Please enter a your contact.', N'en-US', 27)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (33, N'Manage logs', N'en-US', 28)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (34, N'Administrer logger', N'nb-NO', 28)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (35, N'Logs', N'en-US', 29)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (36, N'Logger', N'nb-NO', 29)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (37, N'Home', N'en-US', 30)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (38, N'Hjem', N'nb-NO', 30)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (39, N'Date time', N'en-US', 31)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (40, N'Dato gang', N'nb-NO', 31)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (41, N'Component', N'en-US', 32)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (42, N'Komponent', N'nb-NO', 32)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (43, N'Action', N'en-US', 33)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (44, N'Handling', N'nb-NO', 33)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (45, N'Result', N'en-US', 34)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (46, N'Resultat', N'nb-NO', 34)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (47, N'IP', N'en-US', 35)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (48, N'IP', N'nb-NO', 35)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (49, N'Browser', N'en-US', 36)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (50, N'Nettleser', N'nb-NO', 36)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (51, N'Account', N'en-US', 37)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (52, N'Konto', N'nb-NO', 37)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (53, N'Log detail', N'en-US', 38)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (54, N'Logge detalj', N'nb-NO', 38)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (55, N'Computer name', N'en-US', 39)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (56, N'Datamaskin', N'nb-NO', 39)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (57, N'Platform', N'en-US', 40)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (58, N'Platform', N'nb-NO', 40)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (59, N'Back', N'en-US', 41)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (60, N'Tilbake', N'nb-NO', 41)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (61, N'Search ...', N'en-US', 42)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (62, N'Søk ...', N'nb-NO', 42)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (63, N'Manage customers', N'en-US', 43)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (64, N'Administrer leietakere', N'nb-NO', 43)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (65, N'Add new customer', N'en-US', 44)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (66, N'Legg leietakere', N'nb-NO', 44)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (67, N'Company name', N'en-US', 45)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (68, N'Navn', N'nb-NO', 45)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (69, N'Alias', N'en-US', 46)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (70, N'Alias', N'nb-NO', 46)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (71, N'Logo', N'en-US', 47)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (72, N'Logo', N'nb-NO', 47)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (73, N'Org number', N'en-US', 48)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (74, N'Alias', N'nb-NO', 48)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (75, N'Created date', N'en-US', 49)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (76, N'Opprettet dato', N'nb-NO', 49)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (77, N'Active', N'en-US', 50)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (78, N'Aktiv', N'nb-NO', 50)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (79, N'Company name is required', N'en-US', 51)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (80, N'Leietaker navn er påkrevd', N'nb-NO', 51)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (81, N'Person contact', N'en-US', 52)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (82, N'Tildelte bruker', N'nb-NO', 52)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (83, N'Please choose user contact', N'en-US', 53)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (84, N'Tildelte bruker', N'nb-NO', 53)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (85, N'Tenant alias is required', N'en-US', 54)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (86, N'Leietaker alias er nødvendig', N'nb-NO', 54)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (87, N'DB name', N'en-US', 55)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (88, N'DB navn', N'nb-NO', 55)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (89, N'DB User name', N'en-US', 56)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (90, N'DB Brukernavn', N'nb-NO', 56)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (91, N'DB username is required', N'en-US', 57)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (92, N'Database brukernavn er påkrevd', N'nb-NO', 57)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (93, N'DB password', N'en-US', 58)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (94, N'DB passord', N'nb-NO', 58)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (95, N'DB password is required', N'en-US', 59)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (96, N'DB passord kreves', N'nb-NO', 59)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (97, N'Company email', N'en-US', 60)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (98, N'E-post ', N'nb-NO', 60)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (99, N'Email is required', N'en-US', 61)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (100, N'E-post er påkrevd', N'nb-NO', 61)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (101, N'PaymentDays', N'en-US', 62)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (102, N'PaymentDays', N'nb-NO', 62)
GO
print 'Processed 100 total records'
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (103, N'DataSpace', N'en-US', 63)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (104, N'DataSpace', N'nb-NO', 63)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (105, N'Subscribers', N'en-US', 64)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (106, N'Subscribers', N'nb-NO', 64)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (107, N'PlanType', N'en-US', 65)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (108, N'Org number', N'nb-NO', 65)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (109, N'Posted address', N'en-US', 66)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (110, N'Posted address', N'nb-NO', 66)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (111, N'Visiting address', N'en-US', 67)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (112, N'Visiting address', N'nb-NO', 67)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (113, N'Fax', N'en-US', 68)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (114, N'Fax', N'nb-NO', 68)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (115, N'Rating', N'en-US', 69)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (116, N'Rangering', N'nb-NO', 69)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (117, N'Street', N'en-US', 70)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (118, N'Gate', N'nb-NO', 70)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (119, N'Website', N'en-US', 71)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (120, N'Website', N'nb-NO', 71)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (121, N'City', N'en-US', 72)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (122, N'By', N'nb-NO', 72)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (123, N'State', N'en-US', 73)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (124, N'Stat', N'nb-NO', 73)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (125, N'Country', N'en-US', 74)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (126, N'Land', N'nb-NO', 74)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (127, N'Country is required', N'en-US', 75)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (128, N'Landet er nødvendig', N'nb-NO', 75)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (129, N'Logo', N'en-US', 76)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (130, N'Logo', N'nb-NO', 76)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (131, N'CompanyGroup', N'en-US', 77)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (132, N'CompanyGroup', N'nb-NO', 77)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (133, N'Company additional info', N'en-US', 78)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (134, N'Company additional info', N'nb-NO', 78)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (135, N'Information', N'en-US', 79)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (136, N'Informasjon', N'nb-NO', 79)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (137, N'Created by', N'en-US', 80)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (138, N'Created by', N'nb-NO', 80)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (139, N'Modified by', N'en-US', 81)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (140, N'Endret av', N'nb-NO', 81)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (141, N'Linked', N'en-US', 82)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (142, N'Linked', N'nb-NO', 82)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (143, N'Facebook', N'en-US', 83)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (144, N'Facebook', N'nb-NO', 83)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (145, N'Google plus', N'en-US', 84)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (146, N'Google plus', N'nb-NO', 84)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (147, N'Modified date', N'en-US', 85)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (148, N'Endret dato', N'nb-NO', 85)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (149, N'Active', N'en-US', 86)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (150, N'Aktiv', N'nb-NO', 86)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (151, N'Name', N'en-US', 87)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (152, N'Navn', N'nb-NO', 87)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (153, N'Contact name is required', N'en-US', 88)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (154, N'Kontakt navn er påkrevd', N'nb-NO', 88)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (155, N'Phone', N'en-US', 89)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (156, N'Telefon', N'nb-NO', 89)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (157, N'Mobile', N'en-US', 90)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (158, N'Mobil', N'nb-NO', 90)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (159, N'Email', N'en-US', 91)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (160, N'Email', N'nb-NO', 91)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (161, N'Email contact is required', N'en-US', 92)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (162, N'E-post kontakt er nødvendig', N'nb-NO', 92)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (163, N'Username is required', N'en-US', 93)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (164, N'Brukernavn er nødvendig', N'nb-NO', 93)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (165, N'Username', N'en-US', 94)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (166, N'Brukernavn', N'nb-NO', 94)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (167, N'Password', N'en-US', 95)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (168, N'Passord', N'nb-NO', 95)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (169, N'Password is required', N'en-US', 96)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (170, N'Passord er nødvendig', N'nb-NO', 96)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (171, N'Country', N'en-US', 97)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (172, N'Land', N'nb-NO', 97)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (173, N'Avatar (200x130)', N'en-US', 98)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (174, N'Avatar (200x130)', N'nb-NO', 98)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (175, N'Url', N'en-US', 99)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (176, N'Url', N'nb-NO', 99)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (177, N'Postal Address', N'en-US', 101)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (178, N'Postadresse', N'nb-NO', 101)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (179, N'Visiting Address', N'en-US', 102)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (180, N'Besøksadresse', N'nb-NO', 102)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (181, N'Information', N'en-US', 103)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (182, N'Informasjon', N'nb-NO', 103)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (183, N'Firstname', N'en-US', 104)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (184, N'Fornavn', N'nb-NO', 104)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (185, N'Lastname', N'en-US', 105)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (186, N'Etternavn', N'nb-NO', 105)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (187, N'Phone', N'en-US', 106)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (188, N'Telefon', N'nb-NO', 106)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (189, N'Address', N'en-US', 107)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (190, N'Adresse', N'nb-NO', 107)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (191, N'Content', N'en-US', 108)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (192, N'Innhold', N'nb-NO', 108)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (193, N'Save', N'en-US', 109)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (194, N'Spare', N'nb-NO', 109)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (195, N'Cancel', N'en-US', 110)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (196, N'Avbryte', N'nb-NO', 110)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (197, N'Only accept jpg or png extension!', N'en-US', 111)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (198, N'Bare aksepter jpg eller png forlengelse!', N'nb-NO', 111)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (199, N'Manage customers', N'en-US', 112)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (200, N'Administrere kunder', N'nb-NO', 112)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (201, N'Customers', N'en-US', 113)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (202, N'Kunder', N'nb-NO', 113)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (203, N'Alias available', N'en-US', 114)
GO
print 'Processed 200 total records'
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (204, N'Alias tilgjengelige', N'nb-NO', 114)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (205, N'Alias not available', N'en-US', 115)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (206, N'Alias ??ikke tilgjengelig', N'nb-NO', 115)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (207, N'Alias already taken', N'en-US', 116)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (208, N'Alias ??allerede tatt', N'nb-NO', 116)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (209, N'Sorry, {0} is invalid, allowed extensions are: {1}', N'en-US', 117)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (210, N'Beklager, {0} er ugyldig, tillatt utvidelser er: {1}', N'nb-NO', 117)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (211, N'Contacts', N'en-US', 118)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (212, N'Kunder', N'nb-NO', 118)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (213, N'Projects', N'en-US', 119)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (214, N'Prosjekter', N'nb-NO', 119)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (215, N'Tickets', N'en-US', 120)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (216, N'Billetter', N'nb-NO', 120)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (217, N'Calendar', N'en-US', 121)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (218, N'Kalender', N'nb-NO', 121)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (219, N'Billing', N'en-US', 122)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (220, N'Billing', N'nb-NO', 122)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (221, N'First Name', N'en-US', 123)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (222, N'Fornavn', N'nb-NO', 123)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (223, N'Last Name', N'en-US', 124)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (224, N'Etternavn', N'nb-NO', 124)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (225, N'Belong to customer ', N'en-US', 125)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (228, N'Tilhører kunde', N'nb-NO', 125)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (229, N'Gender', N'en-US', 127)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (230, N'Kjønn', N'nb-NO', 127)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (231, N'Address', N'en-US', 128)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (232, N'Adresse', N'nb-NO', 128)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (233, N'Created Date', N'en-US', 129)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (234, N'Opprettet Dato', N'nb-NO', 129)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (235, N'Add Contact', N'en-US', 130)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (236, N'Legg til kontakt', N'nb-NO', 130)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (237, N'Contact', N'en-US', 131)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (238, N'Kontakt', N'nb-NO', 131)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (239, N'Edit Contact', N'en-US', 132)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (240, N'Rediger Kontakt', N'nb-NO', 132)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (241, N'Edit', N'en-US', 133)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (242, N'Rediger', N'nb-NO', 133)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (243, N'Add new contact', N'en-US', 134)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (244, N'Legg til ny kontakt', N'nb-NO', 134)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (245, N'View', N'en-US', 135)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (246, N'Vis', N'nb-NO', 135)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (247, N'The {0} must be at least {2} characters long.', N'en-US', 136)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (248, N'Passordet må være minst 6 tegn', N'nb-NO', 136)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (251, N'Tenant detail', N'en-US', 138)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (252, N'Leietaker detalj', N'nb-NO', 138)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (253, N'Tenant edit', N'en-US', 139)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (254, N'Leietaker edit', N'nb-NO', 139)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (257, N'Delete contact success', N'en-US', 141)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (258, N'Slett kontakt suksess', N'nb-NO', 141)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (259, N'Delete contact error', N'en-US', 142)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (260, N'Slett kontakt feil', N'nb-NO', 142)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (261, N'Do you want to delete this contact?', N'en-US', 143)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (262, N'Ønsker du å slette denne kontakten?', N'nb-NO', 143)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (263, N'You can only login with your account alias!', N'en-US', 144)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (264, N'Du kan bare logge inn med dine kontoalias!', N'nb-NO', 144)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (265, N'Phone', N'en-US', 145)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (266, N'Selskapet telefon', N'nb-NO', 145)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (267, N'Posted District', N'en-US', 146)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (268, N'Posted', N'nb-NO', 146)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (269, N'Posted code', N'en-US', 147)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (270, N'PostedNr', N'nb-NO', 147)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (271, N'Visiting district', N'en-US', 148)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (272, N'Visiting', N'nb-NO', 148)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (273, N'Visiting code', N'en-US', 149)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (274, N'VisitingNr', N'nb-NO', 149)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (275, N'Access deny', N'en-US', 150)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (276, N'Tilgang nekte', N'nb-NO', 150)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (277, N'Warning', N'en-US', 151)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (278, N'Advarsel', N'nb-NO', 151)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (279, N'You do not have enough permissions!', N'en-US', 152)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (280, N'Du har ikke nok rettigheter!', N'nb-NO', 152)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (281, N'New password', N'en-US', 153)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (282, N'Nytt passord', N'nb-NO', 153)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (283, N'Access rights', N'en-US', 154)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (284, N'Tilgangsrettigheter', N'nb-NO', 154)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (285, N'Confirm New password', N'en-US', 155)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (286, N'Bekreft nytt passord', N'nb-NO', 155)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (287, N'Customer', N'en-US', 156)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (288, N'Kunde', N'nb-NO', 156)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (289, N'Choose customer...', N'en-US', 158)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (290, N'Kunde', N'nb-NO', 158)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (291, N'Password not match', N'en-US', 157)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (292, N'Passord stemmer ikke overens', N'nb-NO', 157)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (293, N'Manage user groups', N'en-US', 160)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (294, N'Administrere brukergrupper', N'nb-NO', 160)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (295, N'URL is already active', N'en-US', 159)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (296, N'URL er allerede aktiv', N'nb-NO', 159)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (297, N'Add new group', N'en-US', 161)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (298, N'Legg til ny gruppe', N'nb-NO', 161)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (299, N'Customer detail', N'en-US', 162)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (300, N'Customer detail', N'nb-NO', 162)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (301, N'Current password', N'en-US', 163)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (302, N'Gjeldende passord', N'nb-NO', 163)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (303, N'Welcome,', N'en-US', 164)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (304, N'Velkommen,', N'nb-NO', 164)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (305, N'Change password', N'en-US', 165)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (306, N'Bytt passord', N'nb-NO', 165)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (307, N'Edit profile', N'en-US', 166)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (308, N'Rediger profil', N'nb-NO', 166)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (309, N'Log out', N'en-US', 167)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (310, N'Logge ut', N'nb-NO', 167)
GO
print 'Processed 300 total records'
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (311, N'OK', N'en-US', 168)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (312, N'OK', N'nb-NO', 168)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (313, N'Org number is required', N'en-US', 169)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (314, N'Org number is required', N'nb-NO', 169)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (315, N'Email Invalid!', N'en-US', 170)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (316, N'Email Invalid!', N'nb-NO', 170)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (319, N'Position', N'en-US', 172)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (320, N'Position', N'nb-NO', 172)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (321, N'Email already exists. Please enter a different Email.', N'en-US', 173)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (322, N'Email already exists. Please enter a different Email.', N'nb-NO', 173)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (325, N'Change password successfull.', N'en-US', 175)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (326, N'Bytt passord vellykket.', N'nb-NO', 175)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (327, N'Change', N'en-US', 176)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (328, N'Endring', N'nb-NO', 176)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (331, N'Please input Password', N'en-US', 178)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (332, N'Vennligst legg inn Passord', N'nb-NO', 178)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (333, N'User name already exists. Please enter a different user name.', N'en-US', 179)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (334, N'User name already exists. Please enter a different user name.', N'nb-NO', 179)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (335, N'Please input Password', N'en-US', 180)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (336, N'Vennligst legg inn Passord', N'nb-NO', 180)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (337, N'Email already exists. Please enter a different email.', N'en-US', 181)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (338, N'Email already exists. Please enter a different email.', N'nb-NO', 181)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (339, N'Org number already exists. Please enter a different Org number.', N'en-US', 182)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (340, N'Org number already exists. Please enter a different Org number.', N'nb-NO', 182)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (341, N'User is not active', N'en-US', 183)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (342, N'Brukeren er ikke aktiv', N'nb-NO', 183)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (343, N'User groups''s information', N'en-US', 184)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (344, N'Brukergrupper informasjon', N'nb-NO', 184)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (345, N'ID', N'en-US', 185)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (346, N'ID', N'nb-NO', 185)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (347, N'Permission type', N'en-US', 186)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (348, N'Tillatelse typen', N'nb-NO', 186)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (349, N'Description', N'en-US', 187)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (350, N'Beskrivelse', N'nb-NO', 187)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (351, N'Do you want to delete this data?', N'en-US', 188)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (352, N'Ønsker du å slette disse dataene?', N'nb-NO', 188)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (353, N'Please input required fields!', N'en-US', 189)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (354, N'Vennligst legg inn nødvendige felt!', N'nb-NO', 189)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (355, N'Permission type is not exist in system!', N'en-US', 190)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (356, N'Tillatelse typen ikke finnes i systemet!', N'nb-NO', 190)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (357, N'User group is not exist in system!', N'en-US', 191)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (358, N'Brukergruppen er ikke eksistere i system!', N'nb-NO', 191)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (359, N'User group''s name is not exist in system!', N'en-US', 192)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (360, N'Brukergruppe navn er ikke eksistere i system!', N'nb-NO', 192)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (361, N'Please select tetant!', N'en-US', 193)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (362, N'Vennligst velg leietaker!', N'nb-NO', 193)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (363, N'Data were saved successfully!', N'en-US', 194)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (364, N'Data ble lagret!', N'nb-NO', 194)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (365, N'Data were saved unsuccessfully!', N'en-US', 195)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (366, N'Data ble lagret uten hell!', N'nb-NO', 195)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (367, N'Deactive tenant success!', N'en-US', 196)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (368, N'Deactive tenant success!', N'nb-NO', 196)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (369, N'Active tenant success!', N'en-US', 197)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (370, N'Active tenant success!', N'nb-NO', 197)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (371, N'Do you want to deactive this tenant?', N'en-US', 198)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (372, N'Do you want to deactive this tenant?', N'nb-NO', 198)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (373, N'Do you want to active this tenant?', N'en-US', 199)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (374, N'Do you want to active this tenant?', N'nb-NO', 199)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (375, N'Information', N'en-US', 200)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (376, N'Information', N'nb-NO', 200)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (377, N'Company Profiles', N'en-US', 201)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (378, N'Company Profiles', N'nb-NO', 201)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (379, N'User name', N'en-US', 202)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (380, N'User name', N'nb-NO', 202)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (381, N'Password', N'en-US', 203)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (382, N'Password', N'nb-NO', 203)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (383, N'Confirm password', N'en-US', 204)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (384, N'Confirm password', N'nb-NO', 204)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (385, N'Email', N'en-US', 205)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (386, N'Email', N'nb-NO', 205)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (387, N'Full name', N'en-US', 206)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (388, N'Full name', N'nb-NO', 206)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (389, N'Group name', N'en-US', 207)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (390, N'Group name', N'nb-NO', 207)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (391, N'Sudo', N'en-US', 208)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (392, N'Sudo', N'nb-NO', 208)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (393, N'Manage Users', N'en-US', 209)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (394, N'Manage Users', N'nb-NO', 209)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (395, N'Please confirm admin password!', N'en-US', 210)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (396, N'Please confirm admin password!', N'nb-NO', 210)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (397, N'Sudo this user?', N'en-US', 211)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (398, N'Sudo this user?', N'nb-NO', 211)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (399, N'* Required', N'en-US', 212)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (400, N'* Required', N'nb-NO', 212)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (401, N'White space is not allowed.', N'en-US', 213)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (402, N'White space is not allowed.', N'nb-NO', 213)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (403, N'Email already exists. Please enter a different Email.', N'en-US', 214)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (404, N'Email already exists. Please enter a different Email.', N'nb-NO', 214)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (405, N'Org number already exists. Please enter a different Org number.', N'en-US', 215)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (406, N'Org number already exists. Please enter a different Org number.', N'nb-NO', 215)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (407, N'Username is required', N'en-US', 216)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (408, N'Username is required', N'nb-NO', 216)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (409, N'users.', N'en-US', 217)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (410, N'brukere.', N'nb-NO', 217)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (411, N'Package name', N'en-US', 218)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (412, N'Package name', N'nb-NO', 218)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (413, N'Total users', N'en-US', 219)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (414, N'Total users', N'nb-NO', 219)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (415, N'Total projects', N'en-US', 220)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (416, N'Total projects', N'nb-NO', 220)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (417, N'Total customers', N'en-US', 221)
GO
print 'Processed 400 total records'
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (418, N'Total customers', N'nb-NO', 221)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (419, N'Plans', N'en-US', 222)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (420, N'Plans', N'nb-NO', 222)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (421, N'Choose package', N'en-US', 223)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (422, N'Choose package', N'nb-NO', 223)
SET IDENTITY_INSERT [dbo].[crm_PhraseLanguages] OFF
/****** Object:  Table [dbo].[crm_Packages]    Script Date: 08/07/2014 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Packages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[UserNumber] [int] NULL,
	[ProjectNumber] [int] NULL,
	[CustomerNumber] [int] NULL,
 CONSTRAINT [PK_crm_Package] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[crm_Packages] ON
INSERT [dbo].[crm_Packages] ([Id], [Name], [UserNumber], [ProjectNumber], [CustomerNumber]) VALUES (1, N'Mini', 5, 10, 100)
INSERT [dbo].[crm_Packages] ([Id], [Name], [UserNumber], [ProjectNumber], [CustomerNumber]) VALUES (2, N'Midi', 50, 100, 1000)
INSERT [dbo].[crm_Packages] ([Id], [Name], [UserNumber], [ProjectNumber], [CustomerNumber]) VALUES (3, N'Max', 500, 1000, 10000)
SET IDENTITY_INSERT [dbo].[crm_Packages] OFF
/****** Object:  Table [dbo].[crm_Logs]    Script Date: 08/07/2014 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[crm_Logs](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[LogTypeActionId] [int] NULL,
	[UserId] [int] NULL,
	[Content] [nvarchar](255) NULL,
	[LoginDate] [datetime] NULL,
	[LogoutDate] [datetime] NULL,
	[AccessBrowser] [nvarchar](50) NULL,
	[DetectedIp] [varchar](20) NULL,
	[ComputerName] [varchar](50) NULL,
	[Platform] [varchar](20) NULL,
	[Component] [nvarchar](100) NULL,
	[IsSuccess] [bit] NULL,
 CONSTRAINT [PK_crm_Logs] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[crm_Logs] ON
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1, 10000, 2, 1, N'ffsdf', CAST(0x0000A36400E00332 AS DateTime), NULL, N'IE', N'1:', N'THUYHK', N'DESKTOP', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (2, 10000, 1, 1, N'Content', CAST(0x0000A29200000000 AS DateTime), CAST(0x0000A12500000000 AS DateTime), N'IE', N'1::', N'HGT', N'M', N'ABC', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (3, 10000, 1, 1, N'Content', CAST(0x0000A29200000000 AS DateTime), CAST(0x0000A12500000000 AS DateTime), N'IE', N'1::', N'HGT', N'M', N'ABC', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (4, 10000, 1, 1, N'Content', CAST(0x0000A36500000000 AS DateTime), CAST(0x0000A36500000000 AS DateTime), N'Chrome', N'1::', N'HGT', N'M', N'ABC', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (5, 10000, 1, 1, N'content', CAST(0x0000A36500AA6BEC AS DateTime), CAST(0x0000A36500AA6BEC AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (6, 10000, 1, 1, N'Insert new tenant', CAST(0x0000A3650112948E AS DateTime), CAST(0x0000A3650112948E AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (7, 10000, 2, 1, N'Update tenant', CAST(0x0000A3650118271F AS DateTime), CAST(0x0000A3650118271F AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (35, 10000, 2, 4, N'update user success:', CAST(0x0000A3690110CBC1 AS DateTime), CAST(0x0000A3690110CBC1 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (36, 10000, 2, 4, N'update user success:', CAST(0x0000A3690113E42D AS DateTime), CAST(0x0000A3690113E42D AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (37, 10000, 2, 4, N'update user success:', CAST(0x0000A3690115A29B AS DateTime), CAST(0x0000A3690115A29B AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (38, 10000, 2, 4, N'update user success:', CAST(0x0000A3690115AFC0 AS DateTime), CAST(0x0000A3690115AFC0 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (39, 10000, 2, 4, N'update user success:', CAST(0x0000A3690115B871 AS DateTime), CAST(0x0000A3690115B871 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (40, 10000, 2, 4, N'change password succes.', CAST(0x0000A3690115D5FB AS DateTime), CAST(0x0000A3690115D5FB AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (41, 10000, 2, 4, N'change password succes.', CAST(0x0000A36901160FE6 AS DateTime), CAST(0x0000A36901160FE6 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (46, 10000, 2, 5, N'update user success:', CAST(0x0000A36A00A2A97F AS DateTime), CAST(0x0000A36A00A2A97F AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (51, 0, 2, 1, N'update user success:', CAST(0x0000A36A00EE515D AS DateTime), CAST(0x0000A36A00EE515D AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (53, 0, 1, 1, N'Insert new user', CAST(0x0000A36A010BA67E AS DateTime), CAST(0x0000A36A010BA67E AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (54, 0, 3, 1, N'Delete user success.', CAST(0x0000A36A0114A7FB AS DateTime), CAST(0x0000A36A0114A7FB AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (55, 0, 2, 1, N'update user success:', CAST(0x0000A36A01279473 AS DateTime), CAST(0x0000A36A01279473 AS DateTime), N'Firefox', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (56, 0, 3, 1, N'Delete user success.', CAST(0x0000A36B00AD6DFC AS DateTime), CAST(0x0000A36B00AD6DFC AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (57, 0, 3, 1, N'Delete user success.', CAST(0x0000A36B00AD7434 AS DateTime), CAST(0x0000A36B00AD7434 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (58, 0, 3, 1, N'Delete user success.', CAST(0x0000A36B00AD7A6B AS DateTime), CAST(0x0000A36B00AD7A6B AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (59, 0, 1, 1, N'Insert new user', CAST(0x0000A36B00AEE146 AS DateTime), CAST(0x0000A36B00AEE146 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (60, 10000, 2, 4, N'Sudo Login support.', CAST(0x0000A36B00B0880E AS DateTime), CAST(0x0000A36B00B0880E AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (61, 10000, 2, 4, N'Sudo Login support.', CAST(0x0000A36B00B156FF AS DateTime), CAST(0x0000A36B00B156FF AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (62, 0, 1, 1, N'Insert new user', CAST(0x0000A36B00B2A44A AS DateTime), CAST(0x0000A36B00B2A44A AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (63, 10000, 2, 4, N'Sudo Login support.', CAST(0x0000A36B00B21972 AS DateTime), CAST(0x0000A36B00B21972 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (64, 0, 3, 1, N'Delete user success.', CAST(0x0000A36B00B2BF59 AS DateTime), CAST(0x0000A36B00B2BF59 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (65, 0, 1, 3, N'Insert usergroup', CAST(0x0000A36B00B4CD66 AS DateTime), CAST(0x0000A36B00B4CD66 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (66, 10000, 2, 4, N'Sudo Login support.', CAST(0x0000A36B00B492FB AS DateTime), CAST(0x0000A36B00B492FB AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (67, 0, 2, 3, N'Update new usergroup', CAST(0x0000A36B00B606E5 AS DateTime), CAST(0x0000A36B00B606E5 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (69, 10000, 2, 5, N'Update access right', CAST(0x0000A36B00D94D97 AS DateTime), CAST(0x0000A36B00D94D97 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (70, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36B00DA6766 AS DateTime), CAST(0x0000A36B00DA6766 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (71, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36B00DABF82 AS DateTime), CAST(0x0000A36B00DABF82 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (72, 10000, 2, 5, N'update user success:', CAST(0x0000A36B00DC0D46 AS DateTime), CAST(0x0000A36B00DC0D46 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (73, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36B00DB3FEC AS DateTime), CAST(0x0000A36B00DB3FEC AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (74, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36B00DB95D7 AS DateTime), CAST(0x0000A36B00DB95D7 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (75, 0, 2, 3, N'Update access right', CAST(0x0000A36B00ECF5F9 AS DateTime), CAST(0x0000A36B00ECF5F9 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (76, 0, 2, 3, N'Update access right', CAST(0x0000A36B00ED0527 AS DateTime), CAST(0x0000A36B00ED0527 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (77, 10000, 1, 5, N'Insert new user', CAST(0x0000A36B00EED8D4 AS DateTime), CAST(0x0000A36B00EED8D4 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (78, 10000, 3, 5, N'Delete user success.', CAST(0x0000A36B00EEE9A5 AS DateTime), CAST(0x0000A36B00EEE9A5 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (79, 0, 2, 1, N'Update tenant', CAST(0x0000A36B00EFDD17 AS DateTime), CAST(0x0000A36B00EFDD17 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (80, 0, 3, 1, N'Delete tenant', CAST(0x0000A36B00F06D8D AS DateTime), CAST(0x0000A36B00F06D8D AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (81, 10000, 2, 5, N'update user success:', CAST(0x0000A36B00F2CBAC AS DateTime), CAST(0x0000A36B00F2CBAC AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (82, 10000, 2, 5, N'Update access right', CAST(0x0000A36B00F26C26 AS DateTime), CAST(0x0000A36B00F26C26 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (83, 10055, 1, 34, N'Insert new user', CAST(0x0000A36B00FB87D1 AS DateTime), CAST(0x0000A36B00FB87D1 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (84, 0, 2, 1, N'Update access right', CAST(0x0000A36B00FBC36D AS DateTime), CAST(0x0000A36B00FBC36D AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (85, 0, 2, 1, N'Update access right', CAST(0x0000A36B00FC9FA8 AS DateTime), CAST(0x0000A36B00FC9FA8 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (86, 0, 2, 1, N'Update access right', CAST(0x0000A36B00FD1ECF AS DateTime), CAST(0x0000A36B00FD1ECF AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (87, 0, 2, 1, N'Update access right', CAST(0x0000A36B00FD729E AS DateTime), CAST(0x0000A36B00FD729E AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (88, 0, 2, 1, N'Update access right', CAST(0x0000A36B00FDB828 AS DateTime), CAST(0x0000A36B00FDB828 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (89, 0, 2, 1, N'Update access right', CAST(0x0000A36B00FE0E4E AS DateTime), CAST(0x0000A36B00FE0E4E AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (90, 0, 2, 1, N'Update access right', CAST(0x0000A36B00FEDDFC AS DateTime), CAST(0x0000A36B00FEDDFD AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (91, 0, 2, 1, N'Update access right', CAST(0x0000A36B00FF0E07 AS DateTime), CAST(0x0000A36B00FF0E07 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (92, 0, 2, 1, N'Update tenant', CAST(0x0000A36B00FFFCDB AS DateTime), CAST(0x0000A36B00FFFCDB AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (93, 0, 2, 1, N'Update access right', CAST(0x0000A36B00FF3582 AS DateTime), CAST(0x0000A36B00FF3582 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (94, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36B0116AA73 AS DateTime), CAST(0x0000A36B0116AA73 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (95, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36B011720BD AS DateTime), CAST(0x0000A36B011720BD AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (96, 0, 1, 1, N'Insert usergroup', CAST(0x0000A36B011738CB AS DateTime), CAST(0x0000A36B011738CB AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (97, 0, 2, 1, N'Update access right', CAST(0x0000A36B01189019 AS DateTime), CAST(0x0000A36B01189019 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (98, 0, 2, 1, N'Update tenant', CAST(0x0000A36C00918658 AS DateTime), CAST(0x0000A36C00918658 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (99, 0, 2, 1, N'Update tenant', CAST(0x0000A36C0091FC31 AS DateTime), CAST(0x0000A36C0091FC31 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (100, 0, 2, 1, N'Update access right', CAST(0x0000A36C009F49EA AS DateTime), CAST(0x0000A36C009F49EA AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (101, 0, 2, 1, N'Update tenant', CAST(0x0000A36C00A3F9F1 AS DateTime), CAST(0x0000A36C00A3F9F1 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (102, 0, 1, 1, N'Insert new tenant', CAST(0x0000A36C00AD9741 AS DateTime), CAST(0x0000A36C00AD9741 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (103, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A36C00AD9911 AS DateTime), CAST(0x0000A36C00AD9911 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (104, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A36C00AD993A AS DateTime), CAST(0x0000A36C00AD993A AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (105, 0, 1, 1, N'Insert role tenant admin for user', CAST(0x0000A36C00AD993F AS DateTime), CAST(0x0000A36C00AD993F AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (106, 0, 2, 1, N'Update tenant', CAST(0x0000A36C00AF05F3 AS DateTime), CAST(0x0000A36C00AF05F3 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (107, 0, 2, 1, N'update user success:', CAST(0x0000A36C00B53163 AS DateTime), CAST(0x0000A36C00B53163 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (108, 0, 2, 1, N'update user success:', CAST(0x0000A36C00B54F71 AS DateTime), CAST(0x0000A36C00B54F71 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (109, 0, 2, 1, N'Update tenant', CAST(0x0000A36C00B717E6 AS DateTime), CAST(0x0000A36C00B717E6 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (110, 0, 2, 1, N'update user success:', CAST(0x0000A36C00B6B731 AS DateTime), CAST(0x0000A36C00B6B731 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (111, 0, 2, 1, N'Update tenant', CAST(0x0000A36C00B84F08 AS DateTime), CAST(0x0000A36C00B84F08 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (112, 0, 2, 1, N'update user success:', CAST(0x0000A36C00B994AA AS DateTime), CAST(0x0000A36C00B994AA AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (113, 0, 2, 1, N'update user success:', CAST(0x0000A36C00B99FDD AS DateTime), CAST(0x0000A36C00B99FDD AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (114, 0, 2, 1, N'update user success:', CAST(0x0000A36C00B93613 AS DateTime), CAST(0x0000A36C00B93613 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (115, 0, 2, 1, N'Update tenant', CAST(0x0000A36C00BB32CB AS DateTime), CAST(0x0000A36C00BB32CB AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (116, 0, 2, 1, N'Update tenant', CAST(0x0000A36C00BB40AE AS DateTime), CAST(0x0000A36C00BB40AE AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (117, 0, 1, 3, N'Insert new tenant', CAST(0x0000A36C00DF4B4C AS DateTime), CAST(0x0000A36C00DF4B4C AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (118, 0, 1, 3, N'Insert user tenant admin', CAST(0x0000A36C00DF4F91 AS DateTime), CAST(0x0000A36C00DF4F91 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (119, 0, 2, 3, N'Assigned user for tenant', CAST(0x0000A36C00DF4FB7 AS DateTime), CAST(0x0000A36C00DF4FB7 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (120, 0, 1, 3, N'Insert role tenant admin for user', CAST(0x0000A36C00DF4FCD AS DateTime), CAST(0x0000A36C00DF4FCD AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (121, 0, 2, 1, N'update user success:', CAST(0x0000A36C00EA4BB6 AS DateTime), CAST(0x0000A36C00EA4BB6 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (122, 0, 2, 1, N'update user success:', CAST(0x0000A36C00EC312C AS DateTime), CAST(0x0000A36C00EC312C AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (123, 0, 2, 1, N'update user success:', CAST(0x0000A36C00EC5B70 AS DateTime), CAST(0x0000A36C00EC5B70 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (124, 0, 2, 1, N'update user success:', CAST(0x0000A36C00EC7B3F AS DateTime), CAST(0x0000A36C00EC7B3F AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (125, 0, 1, 1, N'Insert new tenant', CAST(0x0000A36C00F73F32 AS DateTime), CAST(0x0000A36C00F73F32 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (126, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A36C00F7403C AS DateTime), CAST(0x0000A36C00F7403C AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (127, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A36C00F74043 AS DateTime), CAST(0x0000A36C00F74043 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (128, 0, 1, 1, N'Insert role tenant admin for user', CAST(0x0000A36C00F74052 AS DateTime), CAST(0x0000A36C00F74052 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 0)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (129, 0, 1, 1, N'Insert new tenant', CAST(0x0000A36C00FA2C4C AS DateTime), CAST(0x0000A36C00FA2C4C AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (130, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A36C00FA3D0B AS DateTime), CAST(0x0000A36C00FA3D0B AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (131, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A36C00FA43D6 AS DateTime), CAST(0x0000A36C00FA43D6 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (132, 0, 1, 1, N'Insert role tenant admin for user', CAST(0x0000A36C00FA6F9C AS DateTime), CAST(0x0000A36C00FA6F9C AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (133, 0, 2, 1, N'Update tenant', CAST(0x0000A36C00FFE911 AS DateTime), CAST(0x0000A36C00FFE911 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (134, 0, 1, 1, N'Insert new tenant', CAST(0x0000A36C0107E822 AS DateTime), CAST(0x0000A36C0107E822 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (135, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A36C0107E8FE AS DateTime), CAST(0x0000A36C0107E8FE AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (136, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A36C0107E90D AS DateTime), CAST(0x0000A36C0107E90D AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (137, 0, 1, 1, N'Insert role tenant admin for user', CAST(0x0000A36C0107E93F AS DateTime), CAST(0x0000A36C0107E93F AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User Role', 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (138, 0, 2, 1, N'update user success:', CAST(0x0000A36C011A6A54 AS DateTime), CAST(0x0000A36C011A6A54 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (139, 10061, 2, 49, N'update user success:', CAST(0x0000A36F009C1E76 AS DateTime), CAST(0x0000A36F009C1E76 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (140, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36F00AB2DE0 AS DateTime), CAST(0x0000A36F00AB2DE0 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (141, 0, 1, 1, N'Insert usergroup', CAST(0x0000A36F00AC76D8 AS DateTime), CAST(0x0000A36F00AC76D8 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (142, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36F00ACE968 AS DateTime), CAST(0x0000A36F00ACE968 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (143, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36F00AD37B3 AS DateTime), CAST(0x0000A36F00AD37B3 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (144, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36F00B0F567 AS DateTime), CAST(0x0000A36F00B0F567 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (145, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36F00B23DF2 AS DateTime), CAST(0x0000A36F00B23DF2 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (146, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36F00B5DA52 AS DateTime), CAST(0x0000A36F00B5DA52 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (147, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36F00B5E6AB AS DateTime), CAST(0x0000A36F00B5E6AB AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (148, 0, 1, 1, N'Insert new tenant', CAST(0x0000A36F00B84DC5 AS DateTime), CAST(0x0000A36F00B84DC5 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (149, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A36F00B84F34 AS DateTime), CAST(0x0000A36F00B84F34 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (150, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A36F00B84F5A AS DateTime), CAST(0x0000A36F00B84F5A AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (151, 0, 1, 1, N'Insert role tenant admin for user', CAST(0x0000A36F00B84F81 AS DateTime), CAST(0x0000A36F00B84F81 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (152, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36F00BE10D2 AS DateTime), CAST(0x0000A36F00BE10D2 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (153, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36F00C7B53C AS DateTime), CAST(0x0000A36F00C7B53C AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (154, 0, 1, 1, N'Insert usergroup', CAST(0x0000A36F00D8E5AF AS DateTime), CAST(0x0000A36F00D8E5AF AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (155, 0, 2, 1, N'Update access right', CAST(0x0000A36F012F04C1 AS DateTime), CAST(0x0000A36F012F04C1 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (156, 0, 1, 1, N'Insert new tenant', CAST(0x0000A37001053CB0 AS DateTime), CAST(0x0000A37001053CB0 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (157, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A370010542E3 AS DateTime), CAST(0x0000A370010542E3 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (158, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A37001054406 AS DateTime), CAST(0x0000A37001054406 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (159, 0, 1, 1, N'Insert role tenant admin for user', CAST(0x0000A3700105441A AS DateTime), CAST(0x0000A3700105441A AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (160, 0, 1, 1, N'Insert new tenant', CAST(0x0000A370010A96C1 AS DateTime), CAST(0x0000A370010A96C1 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (161, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A370010A992E AS DateTime), CAST(0x0000A370010A992E AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (162, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A370010A9953 AS DateTime), CAST(0x0000A370010A9953 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (163, 0, 1, 1, N'Insert role tenant admin for user', CAST(0x0000A370010A99A1 AS DateTime), CAST(0x0000A370010A99A1 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (164, 10061, 2, 49, N'Update tenant', CAST(0x0000A37001284A64 AS DateTime), CAST(0x0000A37001284A64 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (165, 10061, 2, 49, N'Update tenant', CAST(0x0000A3700128B7F9 AS DateTime), CAST(0x0000A3700128B7F9 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (166, 10061, 2, 49, N'Update tenant', CAST(0x0000A371009E19BE AS DateTime), CAST(0x0000A371009E19BE AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (167, 10061, 2, 49, N'Update tenant', CAST(0x0000A37100A473F8 AS DateTime), CAST(0x0000A37100A473F8 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (168, 10061, 2, 49, N'Update tenant', CAST(0x0000A37100AEC227 AS DateTime), CAST(0x0000A37100AEC227 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (169, 10061, 2, 49, N'Update company profiles', CAST(0x0000A37100F6CBF0 AS DateTime), CAST(0x0000A37100F6CBF0 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (170, 10061, 2, 49, N'Update company profiles', CAST(0x0000A37100F72927 AS DateTime), CAST(0x0000A37100F72927 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (171, 10061, 2, 49, N'Update company profiles', CAST(0x0000A37100F7D421 AS DateTime), CAST(0x0000A37100F7D421 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (172, 10061, 2, 49, N'Update company profiles', CAST(0x0000A37100F8F52E AS DateTime), CAST(0x0000A37100F8F52E AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (173, 10061, 2, 49, N'Update company profiles', CAST(0x0000A37100F91668 AS DateTime), CAST(0x0000A37100F91668 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (174, 0, 2, 1, N'update user success:', CAST(0x0000A3710104C2C1 AS DateTime), CAST(0x0000A3710104C2C1 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (175, 0, 1, 1, N'Create contact', CAST(0x0000A37700906859 AS DateTime), CAST(0x0000A37700906859 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (176, 0, 2, 1, N'Update access right', CAST(0x0000A37701276C1A AS DateTime), CAST(0x0000A37701276C1A AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (177, 0, 2, 1, N'Update access right', CAST(0x0000A3770127B125 AS DateTime), CAST(0x0000A3770127B125 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (178, 0, 2, 1, N'Update access right', CAST(0x0000A3770127C559 AS DateTime), CAST(0x0000A3770127C559 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (179, 0, 2, 1, N'Update access right', CAST(0x0000A3770127E5EA AS DateTime), CAST(0x0000A3770127E5EA AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (180, 0, 2, 1, N'Update tenant', CAST(0x0000A37800B2B65F AS DateTime), CAST(0x0000A37800B2B65F AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (181, 0, 1, 1, N'Insert usergroup', CAST(0x0000A37800B666D1 AS DateTime), CAST(0x0000A37800B666D2 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (182, 0, 1, 1, N'Insert usergroup', CAST(0x0000A37800B737AC AS DateTime), CAST(0x0000A37800B737AC AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (183, 0, 2, 1, N'Update tenant', CAST(0x0000A37800B8709D AS DateTime), CAST(0x0000A37800B8709D AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (184, 0, 1, 1, N'Insert usergroup', CAST(0x0000A37800B849A1 AS DateTime), CAST(0x0000A37800B849A1 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (185, 0, 1, 1, N'Insert usergroup', CAST(0x0000A37800B8C69B AS DateTime), CAST(0x0000A37800B8C69B AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (186, 0, 1, 1, N'Insert usergroup', CAST(0x0000A37800BB1EDB AS DateTime), CAST(0x0000A37800BB1EDB AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (187, 0, 2, 1, N'Update new usergroup', CAST(0x0000A37800BBBB42 AS DateTime), CAST(0x0000A37800BBBB42 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (188, 0, 2, 1, N'Update new usergroup', CAST(0x0000A37800BBDA21 AS DateTime), CAST(0x0000A37800BBDA21 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (189, 0, 2, 1, N'Update new usergroup', CAST(0x0000A37800BC2C42 AS DateTime), CAST(0x0000A37800BC2C42 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (190, 0, 1, 1, N'Insert usergroup', CAST(0x0000A37800BC5160 AS DateTime), CAST(0x0000A37800BC5160 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (191, 0, 2, 1, N'Update new usergroup', CAST(0x0000A37800BCFAB0 AS DateTime), CAST(0x0000A37800BCFAB0 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (192, 0, 2, 1, N'update user success:', CAST(0x0000A37800EAB673 AS DateTime), CAST(0x0000A37800EAB673 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (193, 0, 2, 1, N'update user success:', CAST(0x0000A37800EB0121 AS DateTime), CAST(0x0000A37800EB0121 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (194, 0, 2, 1, N'update user success:', CAST(0x0000A37800EB0F9A AS DateTime), CAST(0x0000A37800EB0F9A AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (195, 0, 2, 1, N'update user success:', CAST(0x0000A37800ED2DD4 AS DateTime), CAST(0x0000A37800ED2DD4 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (196, 0, 1, 1, N'Insert new tenant', CAST(0x0000A37800EEC2F2 AS DateTime), CAST(0x0000A37800EEC2F2 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (197, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A37800EEC4B3 AS DateTime), CAST(0x0000A37800EEC4B3 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (198, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A37800EEC4E0 AS DateTime), CAST(0x0000A37800EEC4E0 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (199, 0, 1, 1, N'Insert role tenant admin for user', CAST(0x0000A37800EEC503 AS DateTime), CAST(0x0000A37800EEC503 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (200, 0, 2, 1, N'update user success:', CAST(0x0000A37800F2D0DF AS DateTime), CAST(0x0000A37800F2D0DF AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (201, 0, 2, 1, N'update user success:', CAST(0x0000A37800F2DA84 AS DateTime), CAST(0x0000A37800F2DA84 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (202, 0, 2, 1, N'Update tenant', CAST(0x0000A37800F34281 AS DateTime), CAST(0x0000A37800F34281 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (203, 0, 2, 1, N'update user success:', CAST(0x0000A37800F469AE AS DateTime), CAST(0x0000A37800F469AE AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (204, 0, 2, 1, N'update user success:', CAST(0x0000A37800F49074 AS DateTime), CAST(0x0000A37800F49074 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (205, 0, 2, 1, N'update avatar of user success', CAST(0x0000A37800F540D7 AS DateTime), CAST(0x0000A37800F540D7 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (206, 0, 2, 1, N'update user success:', CAST(0x0000A37800F55578 AS DateTime), CAST(0x0000A37800F55578 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (207, 0, 2, 1, N'Update tenant', CAST(0x0000A37800F9D2AC AS DateTime), CAST(0x0000A37800F9D2AC AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (208, 0, 2, 1, N'update user success:', CAST(0x0000A37800FF49F5 AS DateTime), CAST(0x0000A37800FF49F5 AS DateTime), N'Firefox', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (209, 0, 2, 1, N'update user success:', CAST(0x0000A37801073A4F AS DateTime), CAST(0x0000A37801073A4F AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (210, 0, 2, 1, N'update user success:', CAST(0x0000A37801084B30 AS DateTime), CAST(0x0000A37801084B30 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (211, 0, 2, 1, N'update avatar of user success', CAST(0x0000A3780108C035 AS DateTime), CAST(0x0000A3780108C035 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (212, 0, 2, 1, N'Update new usergroup', CAST(0x0000A378010FE057 AS DateTime), CAST(0x0000A378010FE057 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (213, 0, 2, 1, N'update user success:', CAST(0x0000A3780118CA6C AS DateTime), CAST(0x0000A3780118CA6C AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (214, 0, 2, 1, N'update user success:', CAST(0x0000A3780118D7D7 AS DateTime), CAST(0x0000A3780118D7D7 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (215, 0, 2, 1, N'update user success:', CAST(0x0000A3780118E99A AS DateTime), CAST(0x0000A3780118E99A AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (216, 0, 2, 1, N'update user success:', CAST(0x0000A37801191C05 AS DateTime), CAST(0x0000A37801191C05 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (217, 0, 2, 1, N'update user success:', CAST(0x0000A378011BB9B1 AS DateTime), CAST(0x0000A378011BB9B1 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (218, 0, 1, 1, N'Insert usergroup', CAST(0x0000A3780125C555 AS DateTime), CAST(0x0000A3780125C555 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (219, 10061, 2, 49, N'Update access right', CAST(0x0000A378012F3800 AS DateTime), CAST(0x0000A378012F3800 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (220, 0, 1, 1, N'Insert new tenant', CAST(0x0000A37900937347 AS DateTime), CAST(0x0000A37900937347 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (221, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A379009374C8 AS DateTime), CAST(0x0000A379009374C8 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (222, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A379009374D7 AS DateTime), CAST(0x0000A379009374D7 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (223, 0, 1, 1, N'Insert role tenant admin for user', CAST(0x0000A379009374F9 AS DateTime), CAST(0x0000A379009374F9 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (224, 0, 1, 1, N'Insert new tenant', CAST(0x0000A379009521CA AS DateTime), CAST(0x0000A379009521CA AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (225, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A37900952295 AS DateTime), CAST(0x0000A37900952295 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (226, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A379009522A1 AS DateTime), CAST(0x0000A379009522A1 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (227, 0, 1, 1, N'Insert role tenant admin for user', CAST(0x0000A379009522AD AS DateTime), CAST(0x0000A379009522AD AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (228, 0, 2, 1, N'update user success:', CAST(0x0000A37900982AE7 AS DateTime), CAST(0x0000A37900982AE7 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (229, 0, 1, 1, N'Insert new tenant', CAST(0x0000A379009927CB AS DateTime), CAST(0x0000A379009927CB AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (230, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A37900993D34 AS DateTime), CAST(0x0000A37900993D34 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (231, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A37900994919 AS DateTime), CAST(0x0000A37900994919 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (232, 0, 1, 1, N'Insert new tenant', CAST(0x0000A379009CA20E AS DateTime), CAST(0x0000A379009CA20E AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (233, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A379009CA849 AS DateTime), CAST(0x0000A379009CA849 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (234, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A379009CB308 AS DateTime), CAST(0x0000A379009CB308 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (235, 0, 1, 1, N'Insert role tenant admin for user', CAST(0x0000A379009CB318 AS DateTime), CAST(0x0000A379009CB318 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (236, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37900A28182 AS DateTime), CAST(0x0000A37900A28182 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (237, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A37900A2824A AS DateTime), CAST(0x0000A37900A2824A AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (238, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37900A28255 AS DateTime), CAST(0x0000A37900A28255 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
GO
print 'Processed 200 total records'
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (239, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37900A28270 AS DateTime), CAST(0x0000A37900A28270 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (240, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37900A3603F AS DateTime), CAST(0x0000A37900A3603F AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (241, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37900A40BF2 AS DateTime), CAST(0x0000A37900A40BF2 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (242, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37900A42C60 AS DateTime), CAST(0x0000A37900A42C60 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (243, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37900A4B48B AS DateTime), CAST(0x0000A37900A4B48C AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (244, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37900A624C4 AS DateTime), CAST(0x0000A37900A624C4 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (245, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A37900A62ECC AS DateTime), CAST(0x0000A37900A62ECC AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (246, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37900A634D5 AS DateTime), CAST(0x0000A37900A634D5 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (247, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37900A63A84 AS DateTime), CAST(0x0000A37900A63A84 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (248, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37900A730AC AS DateTime), CAST(0x0000A37900A730AC AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (249, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A37900A731A2 AS DateTime), CAST(0x0000A37900A731A2 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (250, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37900A731A9 AS DateTime), CAST(0x0000A37900A731A9 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (251, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37900A731B6 AS DateTime), CAST(0x0000A37900A731B6 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (252, 10072, 2, 62, N'update avatar of user success', CAST(0x0000A37900A762C8 AS DateTime), CAST(0x0000A37900A762C8 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (253, 10072, 2, 62, N'update user success:', CAST(0x0000A37900A77878 AS DateTime), CAST(0x0000A37900A77878 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (254, 10071, 2, 61, N'Update company profiles', CAST(0x0000A37900ADDE08 AS DateTime), CAST(0x0000A37900ADDE08 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (255, 0, 2, 59, N'Update tenant', CAST(0x0000A37900AE14F1 AS DateTime), CAST(0x0000A37900AE14F1 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (256, 0, 2, 3, N'Update access right', CAST(0x0000A37900AE4F4C AS DateTime), CAST(0x0000A37900AE4F4C AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (258, 0, 2, 59, N'update avatar of user success', CAST(0x0000A37900BA5AEC AS DateTime), CAST(0x0000A37900BA5AEC AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (259, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37900BCDBCE AS DateTime), CAST(0x0000A37900BCDBCE AS DateTime), N'Firefox', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (260, 10071, 2, 61, N'Update company profiles', CAST(0x0000A37900E37311 AS DateTime), CAST(0x0000A37900E37311 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (261, 10071, 2, 61, N'update avatar of user success', CAST(0x0000A37900E38F52 AS DateTime), CAST(0x0000A37900E38F52 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (262, 0, 1, 59, N'Insert new user', CAST(0x0000A37900E5E74A AS DateTime), CAST(0x0000A37900E5E74A AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (263, 0, 1, 59, N'Insert new user', CAST(0x0000A37900E62CCB AS DateTime), CAST(0x0000A37900E62CCB AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (264, 0, 2, 59, N'update avatar of user success', CAST(0x0000A37900E9FF66 AS DateTime), CAST(0x0000A37900E9FF67 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (265, 0, 1, 59, N'Insert new user', CAST(0x0000A37900EFAE93 AS DateTime), CAST(0x0000A37900EFAE93 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (266, 0, 2, 59, N'update avatar of user success', CAST(0x0000A37900F7BC20 AS DateTime), CAST(0x0000A37900F7BC20 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (267, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37900F9878F AS DateTime), CAST(0x0000A37900F9878F AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (268, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A37900F98CB4 AS DateTime), CAST(0x0000A37900F98CB4 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (269, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37900F990A6 AS DateTime), CAST(0x0000A37900F990A6 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (270, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37900F99264 AS DateTime), CAST(0x0000A37900F99264 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (271, 10072, 1, 62, N'Create contact', CAST(0x0000A3790112AFB8 AS DateTime), CAST(0x0000A3790112AFB8 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (272, 10072, 2, 62, N'Edit contact', CAST(0x0000A3790112C40E AS DateTime), CAST(0x0000A3790112C40E AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (273, 10072, 1, 62, N'Save avatar image.', CAST(0x0000A379011D0EEE AS DateTime), CAST(0x0000A379011D0EEE AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Customers', 0)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (274, 10072, 1, 62, N'Save avatar image.', CAST(0x0000A379011DBF6A AS DateTime), CAST(0x0000A379011DBF6A AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Customers', 0)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (275, 10072, 1, 62, N'Insert new customer', CAST(0x0000A379011E6249 AS DateTime), CAST(0x0000A379011E6249 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (276, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37A00E6D424 AS DateTime), CAST(0x0000A37A00E6D424 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (277, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A37A00E6D549 AS DateTime), CAST(0x0000A37A00E6D549 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (278, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37A00E6D555 AS DateTime), CAST(0x0000A37A00E6D555 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (279, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37A00E6D573 AS DateTime), CAST(0x0000A37A00E6D573 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (280, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A37D00B0846C AS DateTime), CAST(0x0000A37D00B0846C AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (281, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A37D00BD4BB7 AS DateTime), CAST(0x0000A37D00BD4BB7 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (282, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A37D00CB1799 AS DateTime), CAST(0x0000A37D00CB1799 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (283, 0, 2, 59, N'update avatar of user success', CAST(0x0000A37D00F40912 AS DateTime), CAST(0x0000A37D00F40912 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (284, 0, 1, 59, N'Created new user', CAST(0x0000A37D00F4ED60 AS DateTime), CAST(0x0000A37D00F4ED60 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (285, 0, 1, 59, N'Created new user', CAST(0x0000A37D00F58DF7 AS DateTime), CAST(0x0000A37D00F58DF7 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (286, 0, 1, 59, N'Created new user', CAST(0x0000A37D00F61D20 AS DateTime), CAST(0x0000A37D00F61D20 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (287, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A37D00FB7C0A AS DateTime), CAST(0x0000A37D00FB7C0A AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (288, 0, 1, 59, N'Insert new user', CAST(0x0000A37D0105C91A AS DateTime), CAST(0x0000A37D0105C91A AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (289, 0, 2, 59, N'update user success:', CAST(0x0000A37D010C4EE1 AS DateTime), CAST(0x0000A37D010C4EE1 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (290, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A37D01145CA4 AS DateTime), CAST(0x0000A37D01145CA4 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (291, 0, 2, 59, N'update user success:', CAST(0x0000A37D011B45CD AS DateTime), CAST(0x0000A37D011B45CD AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (292, 0, 1, 59, N'Insert new user', CAST(0x0000A37D011B755F AS DateTime), CAST(0x0000A37D011B755F AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (293, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37D011E4389 AS DateTime), CAST(0x0000A37D011E4389 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (294, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37D011EE3B0 AS DateTime), CAST(0x0000A37D011EE3B0 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (295, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37D01262B54 AS DateTime), CAST(0x0000A37D01262B54 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (296, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37D01266D03 AS DateTime), CAST(0x0000A37D01266D03 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (297, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37D0127ED25 AS DateTime), CAST(0x0000A37D0127ED25 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (298, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37D0127ED46 AS DateTime), CAST(0x0000A37D0127ED46 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (299, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37D01293578 AS DateTime), CAST(0x0000A37D01293578 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (300, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37D012943AB AS DateTime), CAST(0x0000A37D012943AB AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (301, 0, 2, 59, N'Update setting', CAST(0x0000A37E00B34790 AS DateTime), CAST(0x0000A37E00B34790 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (302, 0, 2, 59, N'Update access right', CAST(0x0000A37E00B4EB39 AS DateTime), CAST(0x0000A37E00B4EB39 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (303, 0, 2, 59, N'Update access right', CAST(0x0000A37E00B66130 AS DateTime), CAST(0x0000A37E00B66130 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (304, 0, 2, 59, N'Update access right', CAST(0x0000A37E00B69C1A AS DateTime), CAST(0x0000A37E00B69C1A AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (305, 0, 2, 59, N'Update access right', CAST(0x0000A37E00B76688 AS DateTime), CAST(0x0000A37E00B76688 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 0)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (306, 0, 2, 59, N'Update setting', CAST(0x0000A37E00B7AF93 AS DateTime), CAST(0x0000A37E00B7AF93 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (307, 0, 2, 59, N'Update setting', CAST(0x0000A37E00B7CDE0 AS DateTime), CAST(0x0000A37E00B7CDE0 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (308, 0, 2, 59, N'Update setting', CAST(0x0000A37E00BA9BF7 AS DateTime), CAST(0x0000A37E00BA9BF7 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (309, 0, 2, 59, N'Update setting', CAST(0x0000A37E00BAB9F7 AS DateTime), CAST(0x0000A37E00BAB9F7 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (310, 0, 2, 59, N'Update setting', CAST(0x0000A37E00BAE9FF AS DateTime), CAST(0x0000A37E00BAE9FF AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (311, 0, 2, 59, N'Update access right', CAST(0x0000A37E00BC8B21 AS DateTime), CAST(0x0000A37E00BC8B21 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (312, 0, 2, 59, N'Update access right', CAST(0x0000A37E00BCAAE6 AS DateTime), CAST(0x0000A37E00BCAAE6 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (313, 0, 2, 59, N'Update access right', CAST(0x0000A37E00BCC486 AS DateTime), CAST(0x0000A37E00BCC486 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (314, 0, 2, 59, N'Update info tenant', CAST(0x0000A37E00CC6614 AS DateTime), CAST(0x0000A37E00CC6614 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (315, 0, 2, 59, N'Update person contact', CAST(0x0000A37E00CCA0AC AS DateTime), CAST(0x0000A37E00CCA0AC AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (316, 0, 2, 59, N'Update info tenant', CAST(0x0000A37E00CD1040 AS DateTime), CAST(0x0000A37E00CD1040 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (317, 0, 2, 59, N'Update person contact', CAST(0x0000A37E00CDB6B6 AS DateTime), CAST(0x0000A37E00CDB6B6 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (318, 0, 2, 59, N'Update info tenant', CAST(0x0000A37E00DA3957 AS DateTime), CAST(0x0000A37E00DA3957 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (319, 0, 2, 59, N'Update info tenant', CAST(0x0000A37E00DA669B AS DateTime), CAST(0x0000A37E00DA669B AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (320, 0, 2, 59, N'Update person contact', CAST(0x0000A37E00DA66AB AS DateTime), CAST(0x0000A37E00DA66AB AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (321, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37E00E2BAE2 AS DateTime), CAST(0x0000A37E00E2BAE2 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (322, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37E00E2BBE1 AS DateTime), CAST(0x0000A37E00E2BBE1 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (323, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37E00E2BC08 AS DateTime), CAST(0x0000A37E00E2BC08 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (324, 0, 2, 59, N'Update info tenant', CAST(0x0000A37E00E2ECB3 AS DateTime), CAST(0x0000A37E00E2ECB3 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (325, 0, 2, 59, N'Update person contact', CAST(0x0000A37E00E2ECB8 AS DateTime), CAST(0x0000A37E00E2ECB8 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (326, 0, 2, 59, N'Update setting', CAST(0x0000A37E00F65C92 AS DateTime), CAST(0x0000A37E00F65C92 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (327, 0, 2, 59, N'Update setting', CAST(0x0000A37E00F6F824 AS DateTime), CAST(0x0000A37E00F6F824 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (328, 0, 2, 59, N'Update setting', CAST(0x0000A37E00FC4891 AS DateTime), CAST(0x0000A37E00FC4891 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (329, 0, 2, 59, N'Update setting', CAST(0x0000A37E00FE19AE AS DateTime), CAST(0x0000A37E00FE19AE AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (330, 0, 2, 59, N'Update setting', CAST(0x0000A37E00FE2476 AS DateTime), CAST(0x0000A37E00FE2476 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (331, 0, 2, 59, N'Update setting', CAST(0x0000A37E00FFFC78 AS DateTime), CAST(0x0000A37E00FFFC78 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (332, 10094, 2, 1, N'Update setting', CAST(0x0000A37E0124C456 AS DateTime), CAST(0x0000A37E0124C456 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (333, 0, 2, 59, N'Update setting', CAST(0x0000A37E01289858 AS DateTime), CAST(0x0000A37E01289858 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (334, 10094, 2, 1, N'Update setting', CAST(0x0000A37E0129C87A AS DateTime), CAST(0x0000A37E0129C87A AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (335, 10094, 2, 1, N'Update setting', CAST(0x0000A37E0129CCF7 AS DateTime), CAST(0x0000A37E0129CCF7 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (336, 10094, 2, 1, N'Update setting', CAST(0x0000A37E0129D906 AS DateTime), CAST(0x0000A37E0129D906 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (337, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37E012C6DF3 AS DateTime), CAST(0x0000A37E012C6DF3 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (338, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37E012C6F6D AS DateTime), CAST(0x0000A37E012C6F6D AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (339, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37E012C6F89 AS DateTime), CAST(0x0000A37E012C6F89 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (340, 10094, 2, 1, N'update user success:', CAST(0x0000A37E012CBF81 AS DateTime), CAST(0x0000A37E012CBF81 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
GO
print 'Processed 300 total records'
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (341, 10094, 2, 1, N'update user success:', CAST(0x0000A37E012CCDAD AS DateTime), CAST(0x0000A37E012CCDAD AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (342, 0, 2, 59, N'Update access right', CAST(0x0000A37E012CF6F2 AS DateTime), CAST(0x0000A37E012CF6F2 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (343, 0, 2, 59, N'Update access right', CAST(0x0000A37E012D0967 AS DateTime), CAST(0x0000A37E012D0967 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (344, 0, 2, 59, N'Update access right', CAST(0x0000A37E012D13DE AS DateTime), CAST(0x0000A37E012D13DE AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (345, 0, 2, 59, N'update user success:', CAST(0x0000A37E012D8A64 AS DateTime), CAST(0x0000A37E012D8A64 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (346, 0, 2, 59, N'update user success:', CAST(0x0000A37E012E1D60 AS DateTime), CAST(0x0000A37E012E1D60 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (347, 0, 2, 59, N'update user success:', CAST(0x0000A37E012E4AF5 AS DateTime), CAST(0x0000A37E012E4AF5 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (348, 0, 2, 59, N'Update info tenant', CAST(0x0000A37F009DF5B1 AS DateTime), CAST(0x0000A37F009DF5B1 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (349, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37F00A326C4 AS DateTime), CAST(0x0000A37F00A326C4 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (350, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37F00A32800 AS DateTime), CAST(0x0000A37F00A32800 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (351, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37F00A32824 AS DateTime), CAST(0x0000A37F00A32824 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (352, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37F00A4C228 AS DateTime), CAST(0x0000A37F00A4C228 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (353, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37F00A4C300 AS DateTime), CAST(0x0000A37F00A4C300 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (354, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37F00A4C311 AS DateTime), CAST(0x0000A37F00A4C311 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (355, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37F00B538C5 AS DateTime), CAST(0x0000A37F00B538C5 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (356, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37F00B5ACC8 AS DateTime), CAST(0x0000A37F00B5ACC8 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (357, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37F00B5CC36 AS DateTime), CAST(0x0000A37F00B5CC36 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (358, 0, 2, 59, N'Update info tenant', CAST(0x0000A37F00B74EDF AS DateTime), CAST(0x0000A37F00B74EDF AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (359, 0, 2, 59, N'Update info tenant', CAST(0x0000A37F00B784AE AS DateTime), CAST(0x0000A37F00B784AE AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (360, 0, 2, 59, N'Update info tenant', CAST(0x0000A37F00B9C0F4 AS DateTime), CAST(0x0000A37F00B9C0F4 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (361, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37F00DF8E34 AS DateTime), CAST(0x0000A37F00DF8E34 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (362, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37F00DF9954 AS DateTime), CAST(0x0000A37F00DF9954 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (363, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37F00DF9D10 AS DateTime), CAST(0x0000A37F00DF9D10 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (364, 0, 2, 59, N'Update access right', CAST(0x0000A37F00F70D85 AS DateTime), CAST(0x0000A37F00F70D85 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (365, 10100, 1, 1, N'Insert new user', CAST(0x0000A37F00F8C595 AS DateTime), CAST(0x0000A37F00F8C595 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (366, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37F010E6A14 AS DateTime), CAST(0x0000A37F010E6A14 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (367, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37F010E6C1E AS DateTime), CAST(0x0000A37F010E6C1E AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (368, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37F010E6C3C AS DateTime), CAST(0x0000A37F010E6C3C AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (372, 0, 2, 59, N'update user success:', CAST(0x0000A37F011762F3 AS DateTime), CAST(0x0000A37F011762F3 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (373, 0, 2, 59, N'update user success:', CAST(0x0000A37F01177107 AS DateTime), CAST(0x0000A37F01177107 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (374, 0, 2, 59, N'Update setting success', CAST(0x0000A380009517BE AS DateTime), CAST(0x0000A380009517BE AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (375, 0, 2, 59, N'Update setting success', CAST(0x0000A380009526F7 AS DateTime), CAST(0x0000A380009526F7 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (376, 0, 2, 59, N'Update setting success', CAST(0x0000A3800095459F AS DateTime), CAST(0x0000A3800095459F AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (377, 0, 1, 59, N'Insert new tenant', CAST(0x0000A380009E9FF6 AS DateTime), CAST(0x0000A380009E9FF6 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (378, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A380009EA1A1 AS DateTime), CAST(0x0000A380009EA1A1 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (379, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A380009EA1B3 AS DateTime), CAST(0x0000A380009EA1B3 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (380, 0, 2, 59, N'update user success:', CAST(0x0000A38000A5B831 AS DateTime), CAST(0x0000A38000A5B831 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (381, 0, 2, 59, N'update user success:', CAST(0x0000A38000A626B6 AS DateTime), CAST(0x0000A38000A626B6 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (382, 0, 2, 59, N'update user success:', CAST(0x0000A38000A633D7 AS DateTime), CAST(0x0000A38000A633D7 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (383, 0, 2, 59, N'update user success:', CAST(0x0000A38000A747B5 AS DateTime), CAST(0x0000A38000A747B5 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
SET IDENTITY_INSERT [dbo].[crm_Logs] OFF
/****** Object:  Table [dbo].[crm_LogAction]    Script Date: 08/07/2014 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_LogAction](
	[LogActionId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LogActionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[crm_LogAction] ON
INSERT [dbo].[crm_LogAction] ([LogActionId], [Name]) VALUES (1, N'Insert')
INSERT [dbo].[crm_LogAction] ([LogActionId], [Name]) VALUES (2, N'Update')
INSERT [dbo].[crm_LogAction] ([LogActionId], [Name]) VALUES (3, N'Delete')
SET IDENTITY_INSERT [dbo].[crm_LogAction] OFF
/****** Object:  Table [dbo].[crm_EmailQueues]    Script Date: 08/07/2014 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_EmailQueues](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Active] [bit] NULL,
	[EmailSubject] [nvarchar](200) NULL,
	[DisplayNameFrom] [nvarchar](100) NULL,
	[EmailFrom] [nvarchar](100) NULL,
	[DisplayNameTo] [nvarchar](100) NULL,
	[EmailTo] [nvarchar](200) NULL,
	[EmailCc] [nvarchar](200) NULL,
	[EmailBcc] [nvarchar](200) NULL,
	[EmailBody] [nvarchar](max) NULL,
	[IsHtmlContent] [bit] NULL,
	[Description] [nvarchar](max) NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[SenderIP] [nvarchar](50) NULL,
	[SendBy] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[crm_EmailQueues] ON
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (1, 0, NULL, N'asasas', N'hung@cateno.no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A35E00D31E59 AS DateTime), CAST(0x0000A35E00D31F00 AS DateTime), N'', 1)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (2, 0, NULL, N'asasas', N'hung@cateno.no', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A35E00D41B96 AS DateTime), CAST(0x0000A35E00D41B96 AS DateTime), N'', 1)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (3, 0, N'For Get Passwork', N'asasas', N'hung@cateno.no', NULL, N'thinhnt@cateno.no', N'thinhnt@cateno.no', N'thinhnt@cateno.no', NULL, NULL, NULL, CAST(0x0000A35E00D48232 AS DateTime), CAST(0x0000A35E00D48232 AS DateTime), N'', 1)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (4, 0, N'For Get Passwork', N'Hung', N'hung@cateno.no', NULL, N'thinhnt@cateno.no', N'thinhnt@cateno.no', N'thinhnt@cateno.no', NULL, NULL, NULL, CAST(0x0000A35E00D8A8F4 AS DateTime), CAST(0x0000A35E00D8A8F4 AS DateTime), N'', 1)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (5, 1, N'For Get Passwork', N'Hung', N'hung@cateno.no', NULL, N'thinhnt@cateno.no', N'thinhnt@cateno.no', N'thinhnt@cateno.no', NULL, NULL, NULL, CAST(0x0000A35E00D90568 AS DateTime), CAST(0x0000A35E00D90568 AS DateTime), N'127.0.0.1', 1)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (6, 0, N'ForGet Password', N'Hung', N'thinhnt@cateno.no', NULL, N'hung@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', NULL, 1, NULL, CAST(0x0000A35E00F32552 AS DateTime), CAST(0x0000A35E00F32553 AS DateTime), N'127.0.0.1', 1)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (7, 0, N'ForGet Password', N'Hung', N'thinhnt@cateno.no', NULL, N'hung@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', NULL, 1, NULL, CAST(0x0000A35E00F54AB5 AS DateTime), CAST(0x0000A35E00F54AB5 AS DateTime), N'127.0.0.1', 1)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (8, 0, N'ForGet Password', N'Hung', N'yourEmailid@gmail.com', NULL, N'hung@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', NULL, 1, NULL, CAST(0x0000A35E00F769C4 AS DateTime), CAST(0x0000A35E00F769C4 AS DateTime), N'127.0.0.1', 1)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (12, 1, N'ForGet Password', N'Thinh', N'thinhnt@cateno.no', NULL, N'thinhnt@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', NULL, 1, NULL, CAST(0x0000A35E011BEF24 AS DateTime), CAST(0x0000A35E011BEF89 AS DateTime), N'127.0.0.1', 0)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (13, 1, N'Contact Us', N'sds asdf sf', N'thinhnt@cateno.no', NULL, N'thinhnt@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', NULL, 1, NULL, CAST(0x0000A35E011D88ED AS DateTime), CAST(0x0000A35E011D88ED AS DateTime), N'127.0.0.1', 0)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (14, 1, N'Contact Us', N'324', N'thinhnt@cateno.no', NULL, N'thinhnt@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', NULL, 1, NULL, CAST(0x0000A35E011E17E8 AS DateTime), CAST(0x0000A35E011E1805 AS DateTime), N'127.0.0.1', 0)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (15, 1, N'ForGet Password', NULL, N'thinhnt@cateno.no', NULL, N'thinhnt@cateno.no', N'thinhnt@cateno.no', N'thinhnt@cateno.no', NULL, 1, NULL, CAST(0x0000A377010DE840 AS DateTime), CAST(0x0000A377010DE840 AS DateTime), N'127.0.0.1', 52)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (16, 0, N'ForGet Password', NULL, N'thinhnt@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A377010F93D2 AS DateTime), CAST(0x0000A377010F93D2 AS DateTime), N'127.0.0.1', 52)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (17, 0, N'ForGet Password', NULL, N'thinhnt@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A377011360A4 AS DateTime), CAST(0x0000A377011360A5 AS DateTime), N'127.0.0.1', 52)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (19, 1, N'ForGet Password', NULL, N'thinhnt@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A3770114A6A3 AS DateTime), CAST(0x0000A3770114A6A3 AS DateTime), N'127.0.0.1', 52)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (20, 1, N'ForGet Password', NULL, N'thinhnt@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A377011F0B0C AS DateTime), CAST(0x0000A377011F0B0C AS DateTime), N'127.0.0.1', 52)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (22, 1, N'ForGet Password', NULL, N'thinhnt@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A37800BA63CC AS DateTime), CAST(0x0000A37800BA63CC AS DateTime), N'127.0.0.1', 52)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (24, 1, N'ForGet Password', NULL, N'thinhnt@cateno.no', NULL, N'hungpv@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A37800DA91D7 AS DateTime), CAST(0x0000A37800DA91D7 AS DateTime), N'::1', 1)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (25, 1, N'ForGet Password', NULL, N'thinhnt@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A37800EE4053 AS DateTime), CAST(0x0000A37800EE4053 AS DateTime), N'::1', 52)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (26, 1, N'ForGet Password', NULL, N'thinhnt@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A37800F00F77 AS DateTime), CAST(0x0000A37800F00F77 AS DateTime), N'127.0.0.1', 52)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (27, 1, N'ForGet Password', NULL, N'thinhnt@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A37800F0FA03 AS DateTime), CAST(0x0000A37800F0FA03 AS DateTime), N'127.0.0.1', 52)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (30, 1, N'ForGet Password', NULL, N'admin@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A379008C4176 AS DateTime), CAST(0x0000A379008C4176 AS DateTime), N'127.0.0.1', 52)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (31, 1, N'ForGet Password', NULL, N'admin@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A379009B7A89 AS DateTime), CAST(0x0000A379009B7A89 AS DateTime), N'127.0.0.1', 52)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (9, 0, N'ForGet Password', N'Hung', N'yourEmailid@gmail.com', NULL, N'hung@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', NULL, 1, NULL, CAST(0x0000A35E00FE0101 AS DateTime), CAST(0x0000A35E00FE0101 AS DateTime), N'127.0.0.1', 1)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (10, 0, N'ForGet Password', N'Hung', N'yourEmailid@gmail.com', NULL, N'hung@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', NULL, 1, NULL, CAST(0x0000A35E00FE021F AS DateTime), CAST(0x0000A35E00FE021F AS DateTime), N'127.0.0.1', 1)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (11, 1, N'ForGet Password', N'Hung', N'thinhnt@cateno.no', NULL, N'hungpv@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', NULL, 1, NULL, CAST(0x0000A35E0101C987 AS DateTime), CAST(0x0000A35E0101C987 AS DateTime), N'127.0.0.1', 1)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (18, 0, N'ForGet Password', NULL, N'thinhnt@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A3770113C1C9 AS DateTime), CAST(0x0000A3770113C1C9 AS DateTime), N'127.0.0.1', 52)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (21, 1, N'ForGet Password', NULL, N'thinhnt@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A37800B097B6 AS DateTime), CAST(0x0000A37800B097B6 AS DateTime), N'127.0.0.1', 52)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (28, 1, N'ForGet Password', NULL, N'thinhnt@cateno.no', NULL, N'hungpv@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A37801143132 AS DateTime), CAST(0x0000A37801143132 AS DateTime), N'::1', 1)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (23, 1, N'ForGet Password', NULL, N'thinhnt@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A37800CE2BB7 AS DateTime), CAST(0x0000A37800CE2BB7 AS DateTime), N'127.0.0.1', 52)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (29, 1, N'ForGet Password', NULL, N'admin@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A3780158B0BC AS DateTime), CAST(0x0000A3780158B0BC AS DateTime), N'127.0.0.1', 52)
SET IDENTITY_INSERT [dbo].[crm_EmailQueues] OFF
/****** Object:  Table [dbo].[crm_Countries]    Script Date: 08/07/2014 10:06:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Countries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [nvarchar](100) NULL,
 CONSTRAINT [PK_crm_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[crm_Countries] ON
INSERT [dbo].[crm_Countries] ([Id], [CountryName]) VALUES (1, N'Vietnam')
INSERT [dbo].[crm_Countries] ([Id], [CountryName]) VALUES (2, N'English')
INSERT [dbo].[crm_Countries] ([Id], [CountryName]) VALUES (3, N'Spain')
INSERT [dbo].[crm_Countries] ([Id], [CountryName]) VALUES (4, N'Norway')
SET IDENTITY_INSERT [dbo].[crm_Countries] OFF
/****** Object:  StoredProcedure [dbo].[CreateNewDB]    Script Date: 08/07/2014 10:06:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CreateNewDB] 
@DBName nvarchar(20),
@DBUsername nvarchar(50),
@DBPassword nvarchar(50)
AS  
BEGIN 
	declare @query nvarchar(4000)  
	--SET @query ='SET IMPLICIT_TRANSACTIONS OFF '
	set @query ='CREATE Database ' + @DBName
	print @query
	exec (@query)
	
	
	
	set @query ='use [' + @DBName + ']' + 
' CREATE LOGIN ' + @DBUsername + ' WITH PASSWORD = ''' + @DBPassword + '''' + 

--GRANT INSERT, UPDATE, SELECT ON cateno TO [cateno_user]

' alter authorization on database::' + @DBName + ' to ' + @DBUsername +




' 

CREATE TABLE [dbo].[crm_Tenant_Logs](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[LogTypeActionId] [int] NULL,
	[UserId] [int] NULL,
	[Content] [nvarchar](255) NULL,
	[LoginDate] [datetime] NULL,
	[LogoutDate] [datetime] NULL,
	[AccessBrowser] [nvarchar](50) NULL,
	[DetectedIp] [varchar](20) NULL,
	[ComputerName] [varchar](50) NULL,
	[Platform] [varchar](20) NULL,
	[Component] [nvarchar](100) NULL,
	[IsSuccess] [bit] NULL,
 CONSTRAINT [PK_crm_Tenant_Logs] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[crm_Tenant_LogAction](
	[LogActionId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LogActionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] 

CREATE TABLE [dbo].[crm_Tenant_Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[PasswordSalt] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[DisplayName] [nvarchar](100) NULL,
	[FullName] [nvarchar](100) NULL,
	[Active] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[TenantId] [int] NOT NULL,
	[Image] [varchar](200) NULL,
	[LinkedURL] [varchar](200) NULL,
	[FacebookURL] [varchar](200) NULL,
	[TwitterURL] [varchar](200) NULL,
	[GoogleplusURL] [varchar](200) NULL,
	[Phone] [nvarchar](25) NULL,
	[Mobile] [nvarchar](25) NULL,
	[ForgotPassWord] [nchar](200) NULL,
	[Position] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]


CREATE TABLE [dbo].[crm_Tenant_Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[Active] [bit] NULL,
	[MaskPermission] [bigint] NULL,
	[TenantId] [int] NOT NULL,
	[PermissionType] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


CREATE TABLE [dbo].[crm_Tenant_UserRoles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[RoleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[crm_Tenant_Setting](
	[SettingId] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Url] [nvarchar](50) NULL,
	[Protocol] [nvarchar](50) NULL,
	[TimeZone] [float] NULL,
	[DateFormat] [nvarchar](50) NULL,
	[TimeFormat] [nvarchar](50) NULL,
	[LanguageCode] [nvarchar](10) NULL,
	[GoogleId] [nvarchar](200) NULL,
	[GoogleSecret] [nvarchar](200) NULL,
	[FacebookId] [nvarchar](200) NULL,
	[FacebookSecret] [nvarchar](200) NULL,
	[TwitterId] [nvarchar](200) NULL,
	[TwitterSecret] [nvarchar](200) NULL,
	[LinkedInId] [nvarchar](200) NULL,
	[LinkedInSecret] [nvarchar](200) NULL,
	[Email] [nvarchar](50) NULL,
	[Currency] [nvarchar](50) NULL) 
 



'
--Because @query=4000 we need to seperate to many pieces
print @query
exec (@query)
set @query=''
set @query ='use [' + @DBName + ']' + 
' 
CREATE TABLE [dbo].[crm_Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[OrgNumber] [nvarchar](20) NOT NULL,
	[PostedAddress] [varchar](200) NULL,
	[VisitingAddress] [varchar](200) NULL,
	[Email] [nvarchar](100) NULL,
	[Fax] [varchar](20) NULL,
	[Street] [nvarchar](200) NULL,
	[Website] [nvarchar](200) NULL,
	[City] [nvarchar](200) NULL,
	[State] [int] NULL,
	[ZipCode] [nvarchar](50) NULL,
	[CountryId] [int] NULL,
	[Description] [text] NULL,
	[CustomerLogo] [varchar](200) NULL,
	[CustomerGroup] [varchar](100) NULL,
	[CustomerAdditionalInfo] [text] NULL,
	[LinkedURL] [varchar](200) NULL,
	[FacebookURL] [varchar](200) NULL,
	[TwitterURL] [varchar](200) NULL,
	[GoogleplusURL] [varchar](200) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

CREATE TABLE [dbo].[crm_Contacts](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[ContactPhone] [varchar](20) NULL,
	[MobilePhone] [varchar](20) NULL,
	[Address] [nvarchar](200) NULL,
	[Active] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[Email] [nvarchar](100) NULL,
	[IsDefault] [bit] NULL,
	[CustomerId] [int] NULL,
	[Gender] [varchar](20) NULL
PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[crm_Projects](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ProjectName] [nvarchar](200) NOT NULL,
    [ProjectCode] [nvarchar](200) NOT NULL,
	[Description] [text] NULL,
	[CategoryId] [int] NOT NULL,
	[ProjectLeadId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[StartedDate] [datetime] NULL,
	[CompletedDate] [datetime] NULL,
	[ContactId] [int] NOT NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL)

CREATE TABLE [dbo].[crm_Documents](
	[DocumentId] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ProjectId] [int] NOT NULL,
	[DocumentName] [nvarchar](200) NULL,
	[TypeId] [int] NOT NULL,
	[Datetime] [datetime] NULL,
	[Comment] [text] NULL)

CREATE TABLE [dbo].[crm_Tasks](
	[TaskId] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ProjectId] [int] NOT NULL,
	[Name] [nvarchar](200) NULL,
	[StartDate] [datetime] NULL,
	[CompleteDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[StatusId] [int] NOT NULL,
	[ResolutionId] [int] NOT NULL,
	[AssignTo] [int] NOT NULL,
	[Description] [text] NULL)

CREATE TABLE [dbo].[crm_Bugs](
	[BugId] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ProjectId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[ResolutionId] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[CompleteDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[Name] [nvarchar] (200) NULL,	
	[AssignTo] [int] NOT NULL,
	[Description] [text] NULL)
	
CREATE TABLE [dbo].[crm_Tickets](
	[TicketId] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ProjectId] [int] NOT NULL,
	[TicketNumber] [nvarchar](20) NULL,
	[StatusId] [int] NOT NULL,
	[ResolutionId] [int] NOT NULL,
	[Title] [nvarchar] (50) NULL,
	[Summary] [nvarchar] (200) NULL,
	[PriorityId] [int] NOT NULL,	
	[Comment] [text] NULL, 
	[StartDate] [datetime] NULL,
	[CompleteDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL)

'
print @query
exec (@query)

END
GO
/****** Object:  Table [dbo].[crm_Users]    Script Date: 08/07/2014 10:06:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[crm_Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[PasswordSalt] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[DisplayName] [nvarchar](100) NULL,
	[FullName] [nvarchar](100) NULL,
	[Active] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[UpdatedDate] [datetime] NULL,
	[TenantId] [int] NOT NULL,
	[Image] [varchar](200) NULL,
	[LinkedURL] [varchar](200) NULL,
	[FacebookURL] [varchar](200) NULL,
	[TwitterURL] [varchar](200) NULL,
	[GoogleplusURL] [varchar](200) NULL,
	[Phone] [nvarchar](25) NULL,
	[Mobile] [nvarchar](25) NULL,
	[ForgotPassWord] [nchar](200) NULL,
	[Position] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[crm_Users] ON
INSERT [dbo].[crm_Users] ([ID], [Username], [Password], [PasswordSalt], [Email], [DisplayName], [FullName], [Active], [CreatedDate], [UpdatedDate], [TenantId], [Image], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Phone], [Mobile], [ForgotPassWord], [Position]) VALUES (2, N'admin', N'Q0ecyvOA4eOt5nAhb6zzq9wFdgo=', N'62TjTLfXlycJHXzM1g+Exw==', N'rilk@cateno.no', N'Ri Khanh admin', N'Ri LK', 1, NULL, CAST(0x0000A37900F7BC0A AS DateTime), 10071, N'/Tenants/demo3107/Capture.PNG', N'', N'', N'aa', N'', NULL, NULL, NULL, NULL)
INSERT [dbo].[crm_Users] ([ID], [Username], [Password], [PasswordSalt], [Email], [DisplayName], [FullName], [Active], [CreatedDate], [UpdatedDate], [TenantId], [Image], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Phone], [Mobile], [ForgotPassWord], [Position]) VALUES (3, N'operator', N'KY6YBWZ0NPcCAstFVbJKd92WnIs=', N'yDL2oPwHaDcpRQi7qA51ow==', N'daonv@cateno.no', NULL, N'Nguyễn Văn Đạo', NULL, NULL, CAST(0x0000A38000A7472D AS DateTime), 0, N'/images/avatar/default.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[crm_Users] ([ID], [Username], [Password], [PasswordSalt], [Email], [DisplayName], [FullName], [Active], [CreatedDate], [UpdatedDate], [TenantId], [Image], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Phone], [Mobile], [ForgotPassWord], [Position]) VALUES (59, N'sa', N'Bd/FSbCeefiIZN5rM0q5bJdbqF4=', N'eWlKTyRQ/bd74DC+GjyAVQ==', N'hungpv@cateno.no', NULL, N'Phạm V Hùng', 1, NULL, CAST(0x0000A38000A5B76E AS DateTime), 0, N'/images/avatar/default.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'aa')
SET IDENTITY_INSERT [dbo].[crm_Users] OFF
/****** Object:  Table [dbo].[crm_UserRoles]    Script Date: 08/07/2014 10:06:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_UserRoles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[RoleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[crm_UserRoles] ON
INSERT [dbo].[crm_UserRoles] ([ID], [UserID], [RoleID]) VALUES (4, 2, 31)
INSERT [dbo].[crm_UserRoles] ([ID], [UserID], [RoleID]) VALUES (7, 3, 7)
INSERT [dbo].[crm_UserRoles] ([ID], [UserID], [RoleID]) VALUES (55, 59, 2)
SET IDENTITY_INSERT [dbo].[crm_UserRoles] OFF
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 08/07/2014 10:06:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUsers] 
    @PageNum AS INT,
	@PageSize AS INT,
	@UserName nvarchar(200),
	@TenantID AS INT,
	@maxPermiss int,
	@TotalRows INT OUTPUT

AS 
  DECLARE @MaskSet INT
  set @MaskSet = 1000
 ;WITH UserInfo AS
	(
		SELECT ROW_NUMBER() OVER(ORDER BY u.CreatedDate, u.ID) AS RowNum, *, (SELECT STUFF((SELECT ', ' + [RoleName] 
		FROM crm_UserRoles ur INNER JOIN crm_Roles r ON  ur.RoleID= r.ID 
		where ur.UserID = u.ID FOR XML PATH('')),1,1,''))  as RoleName
		FROM crm_Users u
		WHERE u.Username in (
			SELECT u.Username
			FROM crm_Users u
				 LEFT JOIN (
					 crm_UserRoles ur INNER JOIN crm_Roles r ON  ur.RoleID= r.ID
				 ) ON u.ID = ur.UserID 
			WHERE u.Username like '%'+ @UserName +'%' and u.TenantId = @TenantID and r.PermissionType <=@maxPermiss
			Group by u.Username
		)
	)
	SELECT * INTO #TempTable from UserInfo
	SELECT @TotalRows = Count(*) From #TempTable;
	
	SELECT *
	FROM #TempTable
	WHERE RowNum BETWEEN (@PageNum - 1) * @PageSize + 1 
					  AND @PageNum * @PageSize
	ORDER BY CreatedDate,ID;
	DROP TABLE  #TempTable
GO
/****** Object:  Default [DF_crm_Tenants_Active]    Script Date: 08/07/2014 10:06:52 ******/
ALTER TABLE [dbo].[crm_Tenants] ADD  CONSTRAINT [DF_crm_Tenants_Active]  DEFAULT ((1)) FOR [Active]
GO
/****** Object:  Default [DF_crm_Tenants_PackageId]    Script Date: 08/07/2014 10:06:52 ******/
ALTER TABLE [dbo].[crm_Tenants] ADD  CONSTRAINT [DF_crm_Tenants_PackageId]  DEFAULT ((0)) FOR [PackageId]
GO
/****** Object:  Default [DF_crm_Package_UserNumber]    Script Date: 08/07/2014 10:06:52 ******/
ALTER TABLE [dbo].[crm_Packages] ADD  CONSTRAINT [DF_crm_Package_UserNumber]  DEFAULT ((0)) FOR [UserNumber]
GO
/****** Object:  Default [DF_crm_Package_ProjectNumber]    Script Date: 08/07/2014 10:06:52 ******/
ALTER TABLE [dbo].[crm_Packages] ADD  CONSTRAINT [DF_crm_Package_ProjectNumber]  DEFAULT ((0)) FOR [ProjectNumber]
GO
/****** Object:  Default [DF_crm_Package_CustomerNumber]    Script Date: 08/07/2014 10:06:52 ******/
ALTER TABLE [dbo].[crm_Packages] ADD  CONSTRAINT [DF_crm_Package_CustomerNumber]  DEFAULT ((0)) FOR [CustomerNumber]
GO
/****** Object:  Default [DF_crm_Logs_LoginDate]    Script Date: 08/07/2014 10:06:52 ******/
ALTER TABLE [dbo].[crm_Logs] ADD  CONSTRAINT [DF_crm_Logs_LoginDate]  DEFAULT (getdate()) FOR [LoginDate]
GO
/****** Object:  Default [DF_crm_Logs_Success]    Script Date: 08/07/2014 10:06:52 ******/
ALTER TABLE [dbo].[crm_Logs] ADD  CONSTRAINT [DF_crm_Logs_Success]  DEFAULT ((1)) FOR [IsSuccess]
GO
/****** Object:  ForeignKey [FK_crm_UserRoles_crm_Users]    Script Date: 08/07/2014 10:06:55 ******/
ALTER TABLE [dbo].[crm_UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_crm_UserRoles_crm_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[crm_Users] ([ID])
GO
ALTER TABLE [dbo].[crm_UserRoles] CHECK CONSTRAINT [FK_crm_UserRoles_crm_Users]
GO
