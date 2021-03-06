USE [master]
GO
/****** Object:  Database [CRM]    Script Date: 09/30/2014 16:33:09 ******/
CREATE DATABASE [CRM] ON  PRIMARY 
( NAME = N'CRM', FILENAME = N'D:\Data\MSSQL2008\Data\CRM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CRM_log', FILENAME = N'D:\Data\MSSQL2008\Logs\CRM_log.ldf' , SIZE = 16576KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[crm_Status]    Script Date: 09/30/2014 16:33:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](200) NULL,
	[StatusType] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[StatusId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[crm_Status] ON
INSERT [dbo].[crm_Status] ([StatusId], [StatusName], [StatusType]) VALUES (1, N'New', N'1')
INSERT [dbo].[crm_Status] ([StatusId], [StatusName], [StatusType]) VALUES (2, N'Pending', N'1')
INSERT [dbo].[crm_Status] ([StatusId], [StatusName], [StatusType]) VALUES (3, N'In-progress', N'1')
INSERT [dbo].[crm_Status] ([StatusId], [StatusName], [StatusType]) VALUES (4, N'Completed', N'1')
INSERT [dbo].[crm_Status] ([StatusId], [StatusName], [StatusType]) VALUES (5, N'Cancelled', N'1')
SET IDENTITY_INSERT [dbo].[crm_Status] OFF
/****** Object:  Table [dbo].[crm_Setting]    Script Date: 09/30/2014 16:33:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Setting](
	[SettingId] [int] NOT NULL,
	[Value] [ntext] NULL,
 CONSTRAINT [PK_crm_Setting] PRIMARY KEY CLUSTERED 
(
	[SettingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[crm_Setting] ([SettingId], [Value]) VALUES (1, N'<?xml version="1.0"?><AppSettings xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><TimeZone>Samoa Standard Time</TimeZone><DateFormat>dd/MM/yyyy</DateFormat><TimeFormat>h:mm tt</TimeFormat><Country>NO</Country><LanguageCode>en-US</LanguageCode><Currency>NOk</Currency><Decimal>.</Decimal><NumberDecimal>2</NumberDecimal><general><Port>0</Port><SMTPAuthentication>false</SMTPAuthentication><EnableSSL>false</EnableSSL><RemindDays>0</RemindDays><PackageId>0</PackageId></general></AppSettings>')
/****** Object:  Table [dbo].[crm_Roles]    Script Date: 09/30/2014 16:33:11 ******/
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
INSERT [dbo].[crm_Roles] ([ID], [RoleName], [Description], [Active], [MaskPermission], [TenantId], [PermissionType]) VALUES (2, N'SA', NULL, 1, 2063, 0, 2048)
INSERT [dbo].[crm_Roles] ([ID], [RoleName], [Description], [Active], [MaskPermission], [TenantId], [PermissionType]) VALUES (7, N'Operator', N'', 1, 1025, 0, 1024)
SET IDENTITY_INSERT [dbo].[crm_Roles] OFF
/****** Object:  Table [dbo].[crm_Resolutions]    Script Date: 09/30/2014 16:33:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Resolutions](
	[ResolutionId] [int] IDENTITY(1,1) NOT NULL,
	[ResolutionName] [nvarchar](200) NULL,
	[ResolutionType] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ResolutionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crm_Priorities]    Script Date: 09/30/2014 16:33:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Priorities](
	[PriorityId] [int] IDENTITY(1,1) NOT NULL,
	[PriorityName] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[PriorityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crm_Phrases]    Script Date: 09/30/2014 16:33:11 ******/
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
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (45, N'Tenant.TenantName', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (46, N'Tenant.TenantNameAlias', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (47, N'Global.Logo', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (48, N'Tenant.OrgNumber', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (49, N'Tenant.CreatedDate', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (50, N'Global.Active', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (52, N'Tenant.AssignedUserId', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (53, N'Tenant.AssignedUserId_required', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (55, N'Tenant.DbName', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (56, N'Tenant.DbUsername', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (58, N'Tenant.DbPassword', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (60, N'Tenant.Email', N'Tenant')
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
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (75, N'Tenant.CountryId_required', N'Tenant')
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
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (89, N'Tenant.ContactPhone', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (90, N'Tenant.MobilePhone', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (91, N'Tenant.ContactEmail', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (93, N'Username_required', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (94, N'Tenant.Username', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (95, N'Tenant.Password', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (96, N'Password_required', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (97, N'Tenant.CountryName', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (98, N'Global.Avatar', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (99, N'Global.Url', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (101, N'Customer.PostalAddress', N'Customer')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (102, N'Customer.VisitingAddress', N'Customer')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (103, N'Customer.Information', N'Customer')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (104, N'Customer.Firstname', N'Customer')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (105, N'Customer.Lastname', N'Customer')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (106, N'Customer.ContactPhone', N'Customer')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (107, N'Customer.Address', N'Customer')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (108, N'Log.Content', N'Log')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (109, N'Global.Save', N'Global')
GO
print 'Processed 100 total records'
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
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (163, N'Users.CurrentPassword', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (164, N'Global.Welcome', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (165, N'Users.ChangePassword', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (166, N'Users.EditProfile', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (167, N'Users.Logout', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (168, N'Global.OK', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (170, N'Global.Email_regex', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (172, N'Tenant.Position', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (173, N'Tenant.ContactEmail_remote', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (175, N'ChangePassword_Successfull', N'ContactLogin')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (176, N'Global.Change', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (178, N'Global.Login.txtPassword_required', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (179, N'Username_remote', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (180, N'PasswordForget_required', N'ContactLogin')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (181, N'Email_remote', N'Tenant')
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
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (208, N'Users.Sudo', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (209, N'Users.ManageUsers', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (210, N'Users.PleaseConfirmAdminPassword', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (211, N'Users.SudoThisUser', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (212, N'Global.Required', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (213, N'Global.WhiteSpace_regex', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (214, N'Tenant.EmailAlreadyExist', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (215, N'Tenant.OrgNumberAlreadyExist', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (217, N'UserGroups.TotalUser', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (218, N'Package.Name', N'Package')
GO
print 'Processed 200 total records'
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (219, N'Package.NumberOfUsers', N'Package')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (220, N'Package.NumberOfProjects', N'Package')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (221, N'Package.NumberOfCustomers', N'Package')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (222, N'Tenant.PackageId', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (223, N'Tenant.PackageId_required', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (224, N'Tenant.Add', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (225, N'UserGroups.UpdateSuccess', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (226, N'UserGroups.ErrorUpdate', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (227, N'UserGroups.LogUpdate', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (228, N'UserGroups.AccessRight', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (229, N'UserGroups.Usergroups', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (230, N'UserGroups.LogInsert', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (231, N'UserGroups.UserGroupHasUser', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (232, N'UserGroups.DeleteSuccessfull', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (233, N'UserGroups.DeleteUnSuccessfull', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (234, N'UserGroups.Choose', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (235, N'Tenant.ExpiryDate', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (236, N'Global.UserNotExists ', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (237, N'Global.Login.lblServermailError', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (238, N'Tenant.NotActive', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (239, N'Setting.Setting', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (240, N'Setting.SettingPage', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (241, N'Setting.EmailSettings', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (242, N'Setting.SocialNetworksSettings', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (243, N'Setting.PackagePlans', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (244, N'Setting.DateFormat', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (245, N'Setting.TimeFormat', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (246, N'Setting.TimeZone', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (247, N'Setting.Language', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (248, N'Setting.Currency', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (249, N'Setting.DecimalSymbol', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (250, N'Setting.NumberOfDigitsAfterDecimal', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (251, N'Setting.HostServer', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (252, N'Setting.Port', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (253, N'Setting.SMTPAuthentication', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (254, N'Setting.SMTPAccount', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (255, N'Setting.SMTPPassword', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (256, N'Setting.EnableSSL', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (257, N'Setting.TwitterId', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (258, N'Setting.TwitterSecret', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (259, N'Setting.FacebookId', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (260, N'Setting.FacebookSecret', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (261, N'Setting.LinkedInId', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (262, N'Setting.LinkedInSecret', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (263, N'Setting.GoogleId', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (264, N'Setting.GoogleSecret', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (265, N'Global.UpdateSuccess', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (266, N'Global.UpdateFail', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (267, N'Setting.FormatProtocal', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (268, N'Users.UserAccounts', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (269, N'Users.UserOnly', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (270, N'Users.AddNewUser', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (271, N'Users.ManageUserPage', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (272, N'Users.EditUserPage', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (273, N'Setting.RemindDays', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (274, N'Setting.Notification', N'Setting')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (275, N'Login.Social', N'Login')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (276, N'Date', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (277, N'FirstName_required', N'Contact')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (278, N'LastName_required', N'Contact')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (279, N'Email_required', N'Contact')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (280, N'Global.No', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (281, N'Global.Yes', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (285, N'Global.Mobile', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (286, N'Global.Phone', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (288, N'Update.Message', N'Contact')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (289, N'Update.Error', N'Contact')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (290, N'Users.UserNameExists', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (291, N'Users.PasswordOldNotCorrect', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (292, N'Users.DeleteUserError', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (293, N'UserGroups.EditUserGroup', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (294, N'UserGroups.EditUserGroupPage', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (295, N'UserGroups.CreateUserGroupPage', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (296, N'UserGroups.CreateUserGroup', N'UserGroups')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (297, N'Users.CreateUserPage', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (298, N'Users.CreateUser', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (299, N'Users.EditUser', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (300, N'Global.InsertImageFile', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (301, N'Tenant.OrgNumber_regex', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (302, N'Tenant.ExpiryDate_greater', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (303, N'Tenant.ExpiryDate_format', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (304, N'Global.Add', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (305, N'Global.Delete', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (306, N'Language.LanguagePage', N'Language')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (307, N'Global.DeactivePage', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (308, N'Global.Following', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (309, N'Global.BackFontpage', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (310, N'Global.FileNotFoundPage', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (311, N'Global.InternalErrorPage', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (312, N'Global.InternalErrorTitle', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (313, N'Global.AccessDeniedPage', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (314, N'Users.AccountToImpersonate', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (315, N'Users.TitleSudo', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (316, N'Users.TheSudoSessionHasBeenStarted', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (317, N'Users.EndSessionNow', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (318, N'Users.Impersonating', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (319, N'Global.DoYouWantToDelete', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (320, N'Language.Modules', N'Language')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (321, N'Users.ImpersonateThisUser', N'Users')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (322, N'Language.English', N'Language')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (323, N'Users.PleaseComfirmAndInput', N'Users')
GO
print 'Processed 300 total records'
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (324, N'Language.Norweigan', N'Language')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (325, N'System.ManagerLanguages', N'System')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (326, N'Language.ApplyToSystem', N'Language')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (327, N'Global.ItemsPage', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (328, N'Global.ShowingItem', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (329, N'Language.ExportXML', N'Language')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (330, N'Language.ApplySucessfull', N'Language')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (331, N'Language.ApplyError', N'Language')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (334, N'Language.Confirm', N'Language')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (335, N'Language.Export', N'Language')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (336, N'Global.GoToTheFirstPage', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (337, N'Global.GoToThePreviousPage', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (338, N'Global.GoToTheNextPage', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (339, N'Global.GoToTheLastPage', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (340, N'Global.NoItemToDisplay', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (341, N'Global.SelectFiles', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (342, N'Global.MenuLeft.Invoices', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (343, N'Global.MenuLeft.Company', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (344, N'Global.MenuLeft.Customers', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (345, N'Global.MenuLeft.Contacts', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (346, N'Global.MenuLeft.Projects', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (347, N'Global.MenuLeft.Tickets', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (348, N'Global.MenuLeft.OrtherPage', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (349, N'Global.Error', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (350, N'Global.MenuLeft.Calendar', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (351, N'Global.MenuLeft.Calendar', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (352, N'Global.MenuLeft.Calendar', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (353, N'Customers.ContactInfor', N'Customers')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (354, N'Customers.CustomerNotExist', N'Customers')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (355, N'Customers.CountryNotExist', N'Customers')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (356, N'Customers.OrgNumeric', N'Customers')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (357, N'Customers.OrgNumberExist', N'Customers')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (358, N'Customers.EmailExist', N'Customers')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (359, N'NormalUser', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (360, N'Sale', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (361, N'Marketing', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (362, N'Support', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (363, N'Manager', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (364, N'Administrator', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (365, N'Operator', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (366, N'SA', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (367, N'Project.ProjectCodeAlreadyTaken', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (368, N'Project.CompletedDate_greater', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (369, N'Customers.SaveImageUnsuccess', N'Customers')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (370, N'Project.AddPermissionSuccess', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (371, N'Project.AddPermissionFail', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (372, N'Project.ProjectName', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (373, N'Global.Users', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (374, N'Project.CategoryId', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (375, N'M', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (376, N'FM', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (377, N'Customers.ChooseGender', N'Customers')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (378, N'Project.Add', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (379, N'Project.ProjectsList', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (380, N'Project.StatusId', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (381, N'Project.Description', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (382, N'Project.ProjectLeadId', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (383, N'Project.CompletedDate', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (384, N'Project.ProjectCode', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (385, N'Project.StartedDate', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (386, N'Package.PackageName.Basic', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (387, N'Package.PackageName.Standard', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (388, N'Package.PackageName.Total', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (389, N'Global.Update', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (390, N'Global.Edit', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (391, N'Global.Cancel', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (393, N'Project.Permission', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (394, N'Project.ProjectDetail', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (395, N'Customers.CustomerOnly', N'Customers')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (396, N'Tenant.TenantNameAlias_length', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (397, N'Tenant.TenantNameAlias_regex', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (398, N'Tenant.DbUsername_length', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (399, N'Tenant.DbPassword_length', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (400, N'Project.ChooseUserPermission', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (401, N'Ticket.TicketNumber', N'Ticket')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (402, N'Project.ChangePermission', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (403, N'Project.Groups', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (404, N'Project.ListOfUsers', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (405, N'Project.EditProject', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (406, N'Global.DueDate', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (407, N'Ticket.TicketName', N'Ticket')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (408, N'Global.AssignTo', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (409, N'Ticket.TicketsList', N'Ticket')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (410, N'Ticket.AddTicke', N'Ticket')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (411, N'Ticket.EditTicketPage', N'Ticket')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (412, N'Ticket.EditTicket', N'Ticket')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (413, N'Global.SelectStatus', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (414, N'Global.SelectResolution', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (415, N'Global.SelectAssignTo', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (416, N'Ticket.TicketNumberExists', N'Ticket')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (417, N'Global.CompleteafterStartDate', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (418, N'Global.DueafterCompleteDate', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (419, N'Ticket.TicketAdd', N'Ticket')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (420, N'Ticket.TickAddPage', N'Ticket')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (421, N'Ticket.DeleteTicketSuccess', N'Ticket')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (422, N'Ticket.DeleteTicketError', N'Ticket')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (423, N'Ticket.DeleteFilesuccess', N'Ticket')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (424, N'Ticket.PleaseSelectFileDelete', N'Ticket')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (425, N'Ticket.DeleteFileUnsuccess', N'Ticket')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (426, N'Tenant.DbUsernameAlreadyExist', N'Tenant')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (427, N'Project.ProjectOnly', N'Project')
GO
print 'Processed 400 total records'
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (428, N'Document.Name', N'Document')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (429, N'Document.Attach', N'Document')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (430, N'Document.CreateDate', N'Document')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (431, N' Document.Comment', N'Document')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (432, N'Document.Owner', N'Document')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (433, N'Documnet.List ', N'Document')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (434, N'Documnet.Addnew', N'Document')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (435, N'Global.Resolution', N'Global')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (436, N'Bug.BugName', N'Bug')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (437, N'Bug.Bugs', N'Bug')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (438, N'Bug.BugsList', N'Bug')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (439, N'Bug.AddBug', N'Bug')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (440, N'Bug.EditBugPage', N'Bug')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (441, N'Bug.EditBug', N'Bug')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (442, N'Project.InputCategoryName', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (443, N'Project.AddCategorySuccess', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (444, N'Project.CategoryAlreadyExists', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (445, N'Bug.BugAddPage', N'Bug')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (446, N'Bug.BugAdd', N'Bug')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (447, N'Bug.DeleteBugSuccess', N'Bug')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (448, N'Bug.DeleteBugError', N'Bug')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (449, N'Document.Message.CreateOK', N'Document')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (450, N'Document.Message.UpdateOK', N'Document')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (451, N'Task.Tasks', N'Task')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (452, N'Task.AddTask', N'Task')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (453, N'Task.TasksList', N'Task')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (454, N'Task.TaskName', N'Task')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (455, N'Task.EditTaskPage', N'Task')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (456, N'Task.EditTask', N'Task')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (457, N'Task.TaskAddPage', N'Task')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (458, N'Task.TaskAdd', N'Task')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (459, N'Task.DeleteTaskSuccess', N'Task')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (460, N'Task.DeleteTaskError', N'Task')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (461, N'Task.TaskNameExists', N'Task')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (462, N'Bug.BugNameExists', N'Bug')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (463, N'Project.Categories', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (464, N'Project.ChooseCategory', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (465, N'Project.ChooseCustomer', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (466, N'Project.CategoryName', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (467, N'Project.CustomerName', N'Project')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (468, N'Document.Edit', N'Document')
INSERT [dbo].[crm_Phrases] ([ID], [PhraseName], [PhraseType]) VALUES (469, N'Document.Add', N'Document')
SET IDENTITY_INSERT [dbo].[crm_Phrases] OFF
/****** Object:  Table [dbo].[crm_PhraseLanguages]    Script Date: 09/30/2014 16:33:11 ******/
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
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (2, N'Brukernavn', N'nb-NO', 1)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (5, N'Login', N'en-US', 3)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (6, N'Logg inn', N'nb-NO', 3)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (7, N'Password', N'en-US', 2)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (8, N'Passord', N'nb-NO', 2)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (9, N'Remember Me', N'en-US', 4)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (10, N'Husk meg', N'nb-NO', 4)
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
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (33, N'Manage logs page', N'en-US', 28)
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
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (63, N'Manage customers page', N'en-US', 43)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (64, N'Administrer leietakere', N'nb-NO', 43)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (67, N'Company name', N'en-US', 45)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (68, N'Navn', N'nb-NO', 45)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (69, N'Alias', N'en-US', 46)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (70, N'Alias', N'nb-NO', 46)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (71, N'Logo', N'en-US', 47)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (72, N'Logo', N'nb-NO', 47)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (73, N'Org number', N'en-US', 48)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (74, N'Org nummer', N'nb-NO', 48)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (75, N'Created date', N'en-US', 49)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (76, N'Opprettet dato', N'nb-NO', 49)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (77, N'Active', N'en-US', 50)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (78, N'Aktiv', N'nb-NO', 50)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (81, N'Contact person', N'en-US', 52)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (82, N'Tildelte bruker', N'nb-NO', 52)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (83, N'Please choose user contact', N'en-US', 53)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (84, N'Tildelte bruker', N'nb-NO', 53)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (87, N'DB name', N'en-US', 55)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (88, N'DB navn', N'nb-NO', 55)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (89, N'DB User name', N'en-US', 56)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (90, N'DB Brukernavn', N'nb-NO', 56)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (93, N'DB password', N'en-US', 58)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (94, N'DB passord', N'nb-NO', 58)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (97, N'Company email', N'en-US', 60)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (98, N'E-post ', N'nb-NO', 60)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (101, N'PaymentDays', N'en-US', 62)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (102, N'PaymentDays', N'nb-NO', 62)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (103, N'DataSpace', N'en-US', 63)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (104, N'DataSpace', N'nb-NO', 63)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (105, N'Subscribers', N'en-US', 64)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (106, N'Subscribers', N'nb-NO', 64)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (107, N'PlanType', N'en-US', 65)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (108, N'Org number', N'nb-NO', 65)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (109, N'Posted Address', N'en-US', 66)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (110, N'Skrevet adresse', N'nb-NO', 66)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (111, N'Visiting address', N'en-US', 67)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (112, N'Besøks adresse', N'nb-NO', 67)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (113, N'Fax', N'en-US', 68)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (114, N'Fax', N'nb-NO', 68)
GO
print 'Processed 100 total records'
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
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (155, N'Phone', N'en-US', 89)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (156, N'Telefon', N'nb-NO', 89)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (157, N'Mobile', N'en-US', 90)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (158, N'Mobil', N'nb-NO', 90)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (159, N'Email', N'en-US', 91)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (160, N'E-post', N'nb-NO', 91)
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
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (204, N'Alias tilgjengelige', N'nb-NO', 114)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (205, N'Alias not available', N'en-US', 115)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (206, N'Alias ??ikke tilgjengelig', N'nb-NO', 115)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (207, N'Alias already exists', N'en-US', 116)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (208, N'Alias ​​allerede eksisterer', N'nb-NO', 116)
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
GO
print 'Processed 200 total records'
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
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (247, N'The {0} must be at least {1}{2} characters long.', N'en-US', 136)
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
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (265, N'Company phone', N'en-US', 145)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (266, N'Selskapet telefon', N'nb-NO', 145)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (267, N'Posted', N'en-US', 146)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (268, N'Skrevet', N'nb-NO', 146)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (269, N'Posted Number', N'en-US', 147)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (270, N'Skrevet kode', N'nb-NO', 147)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (271, N'Visiting', N'en-US', 148)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (272, N'Besøks', N'nb-NO', 148)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (273, N'Visiting code', N'en-US', 149)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (274, N'Besøks kode', N'nb-NO', 149)
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
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (311, N'OK', N'en-US', 168)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (312, N'OK', N'nb-NO', 168)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (315, N'Email Invalid!', N'en-US', 170)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (316, N'E-post Ugyldig!', N'nb-NO', 170)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (319, N'Position', N'en-US', 172)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (320, N'Stilling', N'nb-NO', 172)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (321, N'Email already exists. Please enter a different Email.', N'en-US', 173)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (322, N'E-post finnes allerede. Skriv inn en annen e-post.', N'nb-NO', 173)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (325, N'Change password successfull.', N'en-US', 175)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (326, N'Bytt passord vellykket.', N'nb-NO', 175)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (327, N'Change', N'en-US', 176)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (328, N'Endring', N'nb-NO', 176)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (331, N'Please input Password', N'en-US', 178)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (332, N'Vennligst legg inn Passord', N'nb-NO', 178)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (333, N'User name already exists. Please enter a different user name.', N'en-US', 179)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (334, N'Brukernavnet finnes allerede. Skriv inn et annet brukernavn.', N'nb-NO', 179)
GO
print 'Processed 300 total records'
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (335, N'Please input Password', N'en-US', 180)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (336, N'Vennligst legg inn Passord', N'nb-NO', 180)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (337, N'Email already exists. Please enter a different email.', N'en-US', 181)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (338, N'E-post finnes allerede. Skriv inn en annen e-post.', N'nb-NO', 181)
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
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (368, N'Deaktiver kunde suksess!', N'nb-NO', 196)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (369, N'Active tenant success!', N'en-US', 197)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (370, N'Aktiv kunde suksess!', N'nb-NO', 197)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (371, N'Do you want to deactive this tenant?', N'en-US', 198)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (372, N'Vil du ha for å deaktivere denne kunden?', N'nb-NO', 198)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (373, N'Do you want to active this tenant?', N'en-US', 199)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (374, N'Ønsker du å aktiv denne kunden?', N'nb-NO', 199)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (375, N'Information', N'en-US', 200)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (376, N'Information', N'nb-NO', 200)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (377, N'Company Profiles', N'en-US', 201)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (378, N'Selskapsprofiler', N'nb-NO', 201)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (379, N'User name', N'en-US', 202)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (380, N'Brukernavn', N'nb-NO', 202)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (381, N'Password', N'en-US', 203)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (382, N'Passord', N'nb-NO', 203)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (383, N'Confirm password', N'en-US', 204)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (384, N'Bekreft passord', N'nb-NO', 204)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (385, N'Email', N'en-US', 205)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (386, N'E-post', N'nb-NO', 205)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (387, N'Full name', N'en-US', 206)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (388, N'Fullt navn', N'nb-NO', 206)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (389, N'Group name', N'en-US', 207)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (390, N'Gruppe navn', N'nb-NO', 207)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (391, N'Sudo', N'en-US', 208)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (392, N'Sudo', N'nb-NO', 208)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (393, N'Manage Users', N'en-US', 209)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (394, N'Administrere brukere', N'nb-NO', 209)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (395, N'Please confirm admin password!', N'en-US', 210)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (396, N'Vennligst bekreft admin passord!', N'nb-NO', 210)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (397, N'Sudo this user?', N'en-US', 211)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (398, N'Sudo denne brukeren?', N'nb-NO', 211)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (399, N'* Required', N'en-US', 212)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (400, N'* Påkrevd', N'nb-NO', 212)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (401, N'White space is not allowed.', N'en-US', 213)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (402, N'White space is not allowed.', N'nb-NO', 213)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (403, N'Email already exists. Please enter a different Email.', N'en-US', 214)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (404, N'E-post finnes allerede. Skriv inn en annen e-post.', N'nb-NO', 214)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (405, N'Org number already exists. ', N'en-US', 215)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (406, N'Org nummer finnes allerede.', N'nb-NO', 215)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (409, N'users.', N'en-US', 217)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (410, N'brukere.', N'nb-NO', 217)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (411, N'Package name', N'en-US', 218)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (412, N'Pakke navn', N'nb-NO', 218)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (413, N'Users', N'en-US', 219)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (414, N'Brukere', N'nb-NO', 219)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (415, N'Projects', N'en-US', 220)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (416, N'Prosjekter', N'nb-NO', 220)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (417, N'Customers', N'en-US', 221)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (418, N'Kunder', N'nb-NO', 221)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (419, N'Plans', N'en-US', 222)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (420, N'Planer', N'nb-NO', 222)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (421, N'Choose package', N'en-US', 223)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (422, N'Choose package', N'nb-NO', 223)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (423, N'Add new customer', N'en-US', 224)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (424, N'Legg ny kunde', N'nb-NO', 224)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (425, N'Update was successful!', N'en-US', 225)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (426, N'Oppdater var vellykket!', N'nb-NO', 225)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (427, N'Error when updating!', N'en-US', 226)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (428, N'Feil ved oppdatering!', N'nb-NO', 226)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (429, N'Update {0}', N'en-US', 227)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (430, N'Oppdater {0}', N'nb-NO', 227)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (431, N'Access right', N'en-US', 228)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (432, N'Tilgang rett', N'nb-NO', 228)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (433, N'User groups', N'en-US', 229)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (434, N'Bruker gruppene', N'nb-NO', 229)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (435, N'Insert {0}', N'en-US', 230)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (436, N'Sett inn {0}', N'nb-NO', 230)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (437, N'This user group has users!', N'en-US', 231)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (438, N'Denne brukergruppen har brukere!', N'nb-NO', 231)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (439, N'Delete {0} successfully!', N'en-US', 232)
GO
print 'Processed 400 total records'
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (440, N'Slett {0} vellykket!', N'nb-NO', 232)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (441, N'Delete {0} unsuccessfully!', N'en-US', 233)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (442, N'Slett {0} uten hell!', N'nb-NO', 233)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (443, N'Choose {0} ...', N'en-US', 234)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (444, N'Velg {0} ...', N'nb-NO', 234)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (445, N'Expiry date', N'en-US', 235)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (446, N'Utløpsdato', N'nb-NO', 235)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (447, N'User not exists in the system', N'en-US', 236)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (448, N'Bruker ikke finnes i systemet', N'nb-NO', 236)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (449, N'Mail server error', N'en-US', 237)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (450, N'Mail server error', N'nb-NO', 237)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (451, N'Tenant is not active', N'en-US', 238)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (452, N'Leietaker er ikke aktiv', N'nb-NO', 238)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (453, N'Setting', N'en-US', 239)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (454, N'Innstillinger', N'nb-NO', 239)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (455, N'Setting page', N'en-US', 240)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (456, N'Innstillinger side', N'nb-NO', 240)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (457, N'Email settings', N'en-US', 241)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (458, N'E-post innstillinger 22', N'nb-NO', 241)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (459, N'Social networks settings', N'en-US', 242)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (460, N'Sosiale nettverk innstillinger', N'nb-NO', 242)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (461, N'Package Plans', N'en-US', 243)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (462, N'Pakke Planer', N'nb-NO', 243)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (463, N'Date format', N'en-US', 244)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (464, N'dato format', N'nb-NO', 244)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (465, N'Time format', N'en-US', 245)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (466, N'Tids format', N'nb-NO', 245)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (467, N'Time Zone', N'en-US', 246)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (468, N'Time Zone', N'nb-NO', 246)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (469, N'Language', N'en-US', 247)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (470, N'Language', N'nb-NO', 247)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (471, N'Currency', N'en-US', 248)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (472, N'valuta', N'nb-NO', 248)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (473, N'Decimal symbol', N'en-US', 249)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (474, N'desimal symbol', N'nb-NO', 249)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (475, N'Number of digits after decimal', N'en-US', 250)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (476, N'Antall siffer etter komma', N'nb-NO', 250)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (477, N'Host & Server', N'en-US', 251)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (478, N'Host & Server', N'nb-NO', 251)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (479, N'Port', N'en-US', 252)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (480, N'Port', N'nb-NO', 252)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (481, N'SMTP authentication', N'en-US', 253)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (482, N'SMTP autentisering', N'nb-NO', 253)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (483, N'SMTP account', N'en-US', 254)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (484, N'SMTP konto', N'nb-NO', 254)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (485, N'SMTP password', N'en-US', 255)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (486, N'SMTP passord', N'nb-NO', 255)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (487, N'Enable SSL', N'en-US', 256)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (488, N'Aktiver SSL', N'nb-NO', 256)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (489, N'TwitterId', N'en-US', 257)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (490, N'TwitterId', N'nb-NO', 257)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (491, N'TwitterSecret', N'en-US', 258)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (492, N'TwitterSecret', N'nb-NO', 258)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (493, N'FacebookId', N'en-US', 259)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (494, N'FacebookId', N'nb-NO', 259)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (495, N'FacebookSecret', N'en-US', 260)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (496, N'FacebookSecret', N'nb-NO', 260)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (497, N'LinkedInId', N'en-US', 261)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (498, N'LinkedInId', N'nb-NO', 261)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (499, N'LinkedInSecret', N'en-US', 262)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (500, N'LinkedInSecret', N'nb-NO', 262)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (501, N'GoogleId', N'en-US', 263)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (502, N'GoogleId', N'nb-NO', 263)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (503, N'GoogleSecret', N'en-US', 264)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (504, N'GoogleSecret', N'nb-NO', 264)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (505, N'Update {0} success', N'en-US', 265)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (506, N'Oppdater {0} suksess', N'nb-NO', 265)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (507, N'Update {0} fail', N'en-US', 266)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (508, N'Oppdater {0} mislykkes', N'nb-NO', 266)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (509, N'Protocol URL format is wrong (not http:// or https:// )!', N'en-US', 267)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (510, N'Protokoll URL-formatet er feil (ikke http: // eller https: //)!', N'nb-NO', 267)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (511, N'User accounts', N'en-US', 268)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (512, N'Bruker kontoer', N'nb-NO', 268)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (513, N'{0} user only', N'en-US', 269)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (514, N'{0} brukeren bare', N'nb-NO', 269)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (515, N'Add new user', N'en-US', 270)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (516, N'Legg til ny bruker', N'nb-NO', 270)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (517, N'Manage user page', N'en-US', 271)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (518, N'Administrere brukerside', N'nb-NO', 271)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (519, N'Edit user page', N'en-US', 272)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (520, N'Rediger brukerside', N'nb-NO', 272)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (521, N'Logg deg inn her', N'nb-NO', 5)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (522, N'Logg inn Panel', N'nb-NO', 6)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (523, N'Glemt passord', N'nb-NO', 7)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (524, N'Kontakt oss', N'nb-NO', 8)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (525, N'E-post', N'nb-NO', 9)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (526, N'Send nytt passord', N'nb-NO', 10)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (527, N'Tittel', N'nb-NO', 11)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (528, N'Send kontakt', N'nb-NO', 13)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (529, N'Notice', N'nb-NO', 14)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (530, N'Vennligst legg inn brukernavn', N'nb-NO', 16)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (531, N'Brukernavnet eller passordet er feil.', N'nb-NO', 17)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (532, N'Sikkerhetskoden er ugyldig', N'nb-NO', 18)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (533, N'Skriv inn en e-postadressen.', N'nb-NO', 19)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (534, N'Sikkerhetskoden er nødvendig', N'nb-NO', 20)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (535, N'Epost feil.', N'nb-NO', 21)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (536, N'Send kontakt feil. E-post adressen er ikke eksisterer.', N'nb-NO', 24)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (537, N'Send kontakt vellykket.', N'nb-NO', 25)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (538, N'Send e-post feil. E-post adressen er ikke eksisterer.', N'nb-NO', 22)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (539, N'Send epost vellykket.', N'nb-NO', 23)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (540, N'Skriv inn et brukernavn og tittel.', N'nb-NO', 26)
GO
print 'Processed 500 total records'
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (541, N'Skriv inn en kontakt.', N'nb-NO', 27)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (542, N'Remind days', N'en-US', 273)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (543, N'Minn dager', N'nb-NO', 273)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (544, N'Notification', N'en-US', 274)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (545, N'Notification', N'nb-NO', 274)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (546, N'Social', N'en-US', 275)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (547, N'Sosial', N'nb-NO', 275)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (548, N'The field {0} must be a date.', N'en-US', 276)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (549, N'Feltet {0} må være en dato.', N'nb-NO', 276)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (550, N'Please input First Name.', N'en-US', 277)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (551, N'Vennligst legg inn fornavn.', N'nb-NO', 277)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (552, N' Please input Last Name.', N'en-US', 278)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (553, N'Vennligst legg inn etternavn.', N'nb-NO', 278)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (554, N' Please input Email.', N'en-US', 279)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (555, N'Vennligst legg inn e-post.', N'nb-NO', 279)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (556, N'No', N'en-US', 280)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (557, N'Nei', N'nb-NO', 280)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (558, N'Yes', N'en-US', 281)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (559, N'Ja', N'nb-NO', 281)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (560, N'Mobile', N'en-US', 285)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (561, N'Mobile', N'nb-NO', 285)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (562, N'Phone', N'en-US', 286)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (563, N'Telefon', N'nb-NO', 286)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (564, N'Update successfull', N'en-US', 288)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (565, N'Oppdater vellykket', N'nb-NO', 288)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (566, N'Update error', N'en-US', 289)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (567, N'Update-feil', N'nb-NO', 289)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (568, N'user name exists, please input user other', N'en-US', 290)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (569, N'Brukernavn eksisterer, legg inn bruker andre', N'nb-NO', 290)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (570, N'Password old not correct!', N'en-US', 291)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (571, N'Passord gamle ikke riktig!', N'nb-NO', 291)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (572, N'Delete user error', N'en-US', 292)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (573, N'Slett brukerfeil', N'nb-NO', 292)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (574, N'Edit user group', N'en-US', 293)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (575, N'Rediger brukergruppe', N'nb-NO', 293)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (576, N'Edit user group page', N'en-US', 294)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (577, N'Rediger brukergruppe side', N'nb-NO', 294)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (578, N'Create user group page', N'en-US', 295)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (579, N'Lag brukergruppe side', N'nb-NO', 295)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (580, N'Create user group', N'en-US', 296)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (581, N'Lag brukergruppe', N'nb-NO', 296)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (582, N'Create user page', N'en-US', 297)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (583, N'Lag brukerside', N'nb-NO', 297)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (584, N'Create user', N'en-US', 298)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (585, N'Opprett bruker', N'nb-NO', 298)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (586, N'Edit user', N'en-US', 299)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (587, N'Rediger bruker', N'nb-NO', 299)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (588, N'Please insert an image file...', N'en-US', 300)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (589, N'Sett inn en bildefil ...', N'nb-NO', 300)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (590, N'Input value only numbers', N'en-US', 301)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (591, N'Innspill verdi bare tall', N'nb-NO', 301)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (592, N'The Expiry date must be after today.', N'en-US', 302)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (593, N'Utløpsdatoen må være etter i dag.', N'nb-NO', 302)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (594, N'Please enter a date in the format!', N'en-US', 303)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (595, N'Vennligst skriv inn en dato i formatet!', N'nb-NO', 303)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (596, N'Add', N'en-US', 304)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (597, N'Legg', N'nb-NO', 304)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (598, N'Delete', N'en-US', 305)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (599, N'Slett', N'nb-NO', 305)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (600, N'Languague', N'en-US', 306)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (601, N'Språk', N'nb-NO', 306)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (602, N'Deactive page', N'en-US', 307)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (603, N'Deaktiver side', N'nb-NO', 307)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (604, N'Please try the following:', N'en-US', 308)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (605, N'Vennligst prøv følgende:', N'nb-NO', 308)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (606, N'<li>Go back to the frontpage</li>
                    <li>Try to <a title="return" href="javascript:window.history.back();">return</a> to the previous page.</li>
                    <li><a title="information" href="/">Send this information</a> to the administrator</li>', N'en-US', 309)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (607, N'<li> Gå tilbake til forsiden </ li> 
<li> Prøv å <a title="return" href="javascript:window.history.back();"> tilbake betaler til forrige side. </ li> 
<li> <a title="information" href="/"> Send denne informasjonen </a> til administrator </ li>', N'nb-NO', 309)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (608, N'File not found page', N'en-US', 310)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (609, N'Fil ikke funnet Side', N'nb-NO', 310)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (610, N'Internal error page', N'en-US', 311)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (611, N'Intern feil side', N'nb-NO', 311)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (612, N'It takes updates on our web solution.', N'en-US', 312)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (613, N'Det tar oppdateringer på vår web-løsning.', N'nb-NO', 312)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (614, N'Access denied page', N'en-US', 313)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (615, N'Tilgang nektet side', N'nb-NO', 313)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (616, N'Account to impersonate', N'en-US', 314)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (617, N'Konto for å etterligne', N'nb-NO', 314)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (618, N'This is a very powerful feature; you should be very careful while using it. Your actions may be logged more carefully than normal.', N'en-US', 315)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (619, N'Dette er en svært kraftig funksjon; du bør være svært forsiktig når du bruker den. Dine handlinger kan bli logget mer forsiktig enn normalt.', N'nb-NO', 315)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (620, N'The sudo session has been started. For the next 6 hours, or until you end the session, everything you do you do as the user you are impersonating', N'en-US', 316)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (621, N'Sudo økten er startet. For de neste 6 timer, eller til du avslutter økten, alt du gjør du som brukeren du utgi', N'nb-NO', 316)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (622, N'End session now', N'en-US', 317)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (623, N'Slutt økten nå', N'nb-NO', 317)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (624, N'Impersonating ({0}) ', N'en-US', 318)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (625, N'Utgi seg ({0})', N'nb-NO', 318)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (626, N'Do you want to delete this record?', N'en-US', 319)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (627, N'Ønsker du å slette denne posten?', N'nb-NO', 319)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (628, N'Impersonate this user', N'en-US', 321)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (629, N'Ligne denne brukeren', N'nb-NO', 321)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (630, N'Modules', N'en-US', 320)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (631, N'Moduler', N'nb-NO', 320)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (632, N'English', N'en-US', 322)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (633, N'Norsk', N'nb-NO', 322)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (634, N'Please comfirm and input new password', N'en-US', 323)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (635, N'Vennligst comfirm og innspill nytt passord', N'nb-NO', 323)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (636, N'Norwegian', N'en-US', 324)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (637, N'Norsk', N'nb-NO', 324)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (638, N'Manager Languages ', N'en-US', 325)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (639, N'Manager Språk', N'nb-NO', 325)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (640, N'Apply change to system', N'en-US', 326)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (641, N'Gjelder endring i systemet', N'nb-NO', 326)
GO
print 'Processed 600 total records'
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (642, N'Items per page', N'en-US', 327)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (643, N'Elementer per side', N'nb-NO', 327)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (644, N'Showing {0}-{1} from {2} data items', N'en-US', 328)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (645, N'Viser {0} - {1} fra {2} dataelementer', N'nb-NO', 328)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (646, N'Export to XML', N'en-US', 329)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (647, N'Eksport til XML', N'nb-NO', 329)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (648, N'Apply to system successfull!', N'en-US', 330)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (649, N'Gjelder for systemet vellykket!', N'nb-NO', 330)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (654, N'Do you want to apply to system?', N'en-US', 334)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (655, N'Vil du skal gjelde for systemet?', N'nb-NO', 334)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (656, N'Do you want to export XML?', N'en-US', 335)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (657, N'Vil du eksportere XML?', N'nb-NO', 335)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (658, N'Go to the first page', N'en-US', 336)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (659, N'Gå til første side', N'nb-NO', 336)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (660, N'Go to the previous page', N'en-US', 337)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (661, N'Gå til forrige side', N'nb-NO', 337)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (662, N'Go to the next page', N'en-US', 338)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (663, N'Gå til neste side', N'nb-NO', 338)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (664, N'Go to the last page', N'en-US', 339)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (665, N'Gå til siste side', N'nb-NO', 339)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (666, N'No item to display', N'en-US', 340)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (667, N'Ingen elementer å vise', N'nb-NO', 340)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (668, N'Select customer', N'en-US', 126)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (669, N'Velg kunde', N'nb-NO', 126)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (670, N'Select files...', N'en-US', 341)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (671, N'Velg filer ...', N'nb-NO', 341)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (672, N'Invoices', N'en-US', 342)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (673, N'Fakturaer', N'nb-NO', 342)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (674, N'Company profiles', N'en-US', 343)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (675, N'Selskapsprofiler', N'nb-NO', 343)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (676, N'Customers', N'en-US', 344)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (677, N'Kunder', N'nb-NO', 344)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (678, N'Contacts', N'en-US', 345)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (679, N'Kontakter', N'nb-NO', 345)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (680, N'Projects', N'en-US', 346)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (681, N'Prosjekter', N'nb-NO', 346)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (682, N'Tickets', N'en-US', 347)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (683, N'Billetter', N'nb-NO', 347)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (684, N'Other Pages', N'en-US', 348)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (685, N'Andre sider', N'nb-NO', 348)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (686, N'Error', N'en-US', 349)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (687, N'Feil', N'nb-NO', 349)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (688, N'Calendar', N'en-US', 352)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (689, N'Contact information', N'en-US', 353)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (690, N'Kontaktinformasjon', N'nb-NO', 353)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (691, N'Kalender', N'nb-NO', 352)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (692, N'Customer is not exist!', N'en-US', 354)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (693, N'Kunden ikke eksisterer!', N'nb-NO', 354)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (694, N'Country is not exist!', N'en-US', 355)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (695, N'Landet er ikke eksisterer!', N'nb-NO', 355)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (696, N'Org number must be numeric!', N'en-US', 356)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (697, N'Org nummer må være numerisk!', N'nb-NO', 356)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (698, N'Org number is exist!', N'en-US', 357)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (699, N'Org nummer er eksisterer!', N'nb-NO', 357)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (700, N'Email is exist!', N'en-US', 358)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (701, N'E-post er eksisterer!', N'nb-NO', 358)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (702, N'Normal user', N'en-US', 359)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (703, N'Normal bruker', N'nb-NO', 359)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (704, N'Sale', N'en-US', 360)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (705, N'Salg', N'nb-NO', 360)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (706, N'Marketing', N'en-US', 361)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (707, N'Markedsføring', N'nb-NO', 361)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (708, N'Support', N'en-US', 362)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (709, N'Support', N'nb-NO', 362)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (710, N'Manager', N'en-US', 363)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (711, N'Sjef', N'nb-NO', 363)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (712, N'Administrator', N'en-US', 364)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (713, N'Administrator', N'nb-NO', 364)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (714, N'Operator', N'en-US', 365)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (715, N'Operatør', N'nb-NO', 365)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (716, N'Super Administrator', N'en-US', 366)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (717, N'Super Administrator', N'nb-NO', 366)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (718, N'Project code already taken.', N'en-US', 367)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (719, N'Prosjektkoden allerede tatt.', N'nb-NO', 367)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (720, N'Completed date must be after Stated date.', N'en-US', 368)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (721, N'Fullført dato må etter oppgitte datoen.', N'nb-NO', 368)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (722, N'Save image unsuccessfully!', N'en-US', 369)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (723, N'Lagre bilde uten hell!', N'nb-NO', 369)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (724, N'Add project success.', N'en-US', 370)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (725, N'Legg prosjektets suksess.', N'nb-NO', 370)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (726, N'Add project fail.', N'en-US', 371)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (727, N'Legg prosjekt mislykkes.', N'nb-NO', 371)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (728, N'Project name', N'en-US', 372)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (729, N'Navn', N'nb-NO', 372)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (730, N'Users', N'en-US', 373)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (731, N'Brukere', N'nb-NO', 373)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (732, N'Category', N'en-US', 374)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (733, N'Kategori', N'nb-NO', 374)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (734, N'Male', N'en-US', 375)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (735, N'Mann', N'nb-NO', 375)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (736, N'Female', N'en-US', 376)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (737, N'Kvinne', N'nb-NO', 376)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (738, N'Choose gender', N'en-US', 377)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (739, N'Velg kjønn', N'nb-NO', 377)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (740, N'Add project', N'en-US', 378)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (741, N'Legg prosjekt', N'nb-NO', 378)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (742, N'Projects list', N'en-US', 379)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (743, N'Prosjekter liste', N'nb-NO', 379)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (744, N'Status', N'en-US', 380)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (745, N'Status', N'nb-NO', 380)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (746, N'Description', N'en-US', 381)
GO
print 'Processed 700 total records'
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (747, N'Beskrivelse', N'nb-NO', 381)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (748, N'Project lead', N'en-US', 382)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (749, N'Prosjektleder', N'nb-NO', 382)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (750, N'Completed date', N'en-US', 383)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (751, N'Fullført dato', N'nb-NO', 383)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (752, N'Code', N'en-US', 384)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (753, N'Kode', N'nb-NO', 384)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (754, N'Started date', N'en-US', 385)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (755, N'Startet dato', N'nb-NO', 385)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (756, N'Basic', N'en-US', 386)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (757, N'Grunnleggende', N'nb-NO', 386)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (758, N'Standard', N'en-US', 387)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (759, N'Standard', N'nb-NO', 387)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (760, N'Total', N'en-US', 388)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (761, N'Total', N'nb-NO', 388)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (762, N'Update', N'en-US', 389)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (763, N'Oppdater', N'nb-NO', 389)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (764, N'Edit', N'en-US', 390)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (765, N'Rediger', N'nb-NO', 390)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (766, N'Cancel', N'en-US', 391)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (767, N'Avbryt', N'nb-NO', 391)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (770, N'Permission', N'en-US', 393)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (771, N'Tillatelse', N'nb-NO', 393)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (772, N'Project detail', N'en-US', 394)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (773, N'Prosjekt detalj', N'nb-NO', 394)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (774, N'You have reached limit of number of customers in package!', N'en-US', 395)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (775, N'Du har nådd grensen for antall kunder i pakken!', N'nb-NO', 395)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (776, N'The Alias must be at least 3 characters long and maximum 16 characters.', N'en-US', 396)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (777, N'Alias må være minst 3 tegn og maks 16 tegn.', N'nb-NO', 396)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (778, N'Input value only numbers and letter.', N'en-US', 397)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (779, N'Inngangsverdien bare tall og brev.', N'nb-NO', 397)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (780, N'The Username must be at least 6 characters long and maximum 25 characters.', N'en-US', 398)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (781, N'Brukernavn må være minst 6 tegn og maks 25 tegn.', N'nb-NO', 398)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (782, N'The password must be at least 6 characters long and maximum 25 characters.', N'en-US', 399)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (783, N'Passord må være minst 6 tegn og maks 25 tegn.', N'nb-NO', 399)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (784, N'Please choose user.', N'en-US', 400)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (785, N'Vennligst velg bruker.', N'nb-NO', 400)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (786, N'Ticket number', N'en-US', 401)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (787, N'saksnummer', N'nb-NO', 401)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (788, N'Change setting', N'en-US', 402)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (789, N'Endre innstilling', N'nb-NO', 402)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (790, N'Groups', N'en-US', 403)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (791, N'Grupper', N'nb-NO', 403)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (792, N'List of users', N'en-US', 404)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (793, N'Liste over brukere', N'nb-NO', 404)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (794, N'Edit project', N'en-US', 405)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (795, N'Rediger', N'nb-NO', 405)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (796, N'Due date', N'en-US', 406)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (797, N'Due date', N'nb-NO', 406)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (798, N'Ticket name', N'en-US', 407)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (799, N'Billett navn', N'nb-NO', 407)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (800, N'Assign to', N'en-US', 408)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (801, N'Tildele', N'nb-NO', 408)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (802, N'Tickets list', N'en-US', 409)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (803, N'Listen billetter', N'nb-NO', 409)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (804, N'Add ticke', N'en-US', 410)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (805, N'Legg ticke', N'nb-NO', 410)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (806, N'Edit ticket page', N'en-US', 411)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (807, N'Edit billett side', N'nb-NO', 411)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (808, N'Edit ticket', N'en-US', 412)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (809, N'Edit billett', N'nb-NO', 412)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (810, N'Select status ...', N'en-US', 413)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (811, N'Velg status ...', N'nb-NO', 413)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (812, N'Select resolution ...', N'en-US', 414)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (813, N'Velg oppløsning ...', N'nb-NO', 414)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (814, N'Select assign to ...', N'en-US', 415)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (815, N'Velg tildele til ...', N'nb-NO', 415)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (816, N'Ticket number exists, please input user other', N'en-US', 416)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (817, N'Saksnummer eksisterer, legg inn bruker andre', N'nb-NO', 416)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (818, N'Complete date date should be after start date', N'en-US', 417)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (819, N'Komplett dato date bør være etter start dato', N'nb-NO', 417)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (820, N'Due date date should be after complete date', N'en-US', 418)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (821, N'Forfallsdato dato bør være etter fullstendig dato', N'nb-NO', 418)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (822, N'Ticket add', N'en-US', 419)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (823, N'Billett add', N'nb-NO', 419)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (824, N'Tick add page', N'en-US', 420)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (825, N'Kryss legge side', N'nb-NO', 420)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (826, N'Delete ticket success', N'en-US', 421)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (827, N'Slett billett suksess', N'nb-NO', 421)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (828, N'Delete ticket Error', N'en-US', 422)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (829, N'Slett billett feil', N'nb-NO', 422)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (830, N'Delete file success', N'en-US', 423)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (831, N'Slett filen suksess', N'nb-NO', 423)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (832, N'please select file delete', N'en-US', 424)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (833, N'Vennligst velg fil slette', N'nb-NO', 424)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (834, N'Delete file unsuccess', N'en-US', 425)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (835, N'Slett filen mislyktes', N'nb-NO', 425)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (836, N'Db Username already exists.', N'en-US', 426)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (837, N'Db Brukernavn finnes allerede.', N'nb-NO', 426)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (838, N'{0} project only', N'en-US', 427)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (839, N'Bare {0} prosjektet', N'nb-NO', 427)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (840, N'Document name', N'en-US', 428)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (841, N'Dokument navn', N'nb-NO', 428)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (842, N'Attach file', N'en-US', 429)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (843, N'Legg ved fil', N'nb-NO', 429)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (844, N'Create date', N'en-US', 430)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (845, N'Lag dato', N'nb-NO', 430)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (846, N'Comment', N'en-US', 431)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (847, N'Kommentar', N'nb-NO', 431)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (848, N'Owner', N'en-US', 432)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (849, N'Eier', N'nb-NO', 432)
GO
print 'Processed 800 total records'
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (850, N'Document list ', N'en-US', 433)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (851, N'Dokument liste', N'nb-NO', 433)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (852, N'Add Document', N'en-US', 434)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (853, N'Legg til dokument', N'nb-NO', 434)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (854, N'Resolution', N'en-US', 435)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (855, N'Oppløsning', N'nb-NO', 435)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (856, N'Bug name', N'en-US', 436)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (857, N'Bug navn', N'nb-NO', 436)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (858, N'Bugs', N'en-US', 437)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (859, N'Bugs', N'nb-NO', 437)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (860, N'Bugs List', N'en-US', 438)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (861, N'Bugs Liste', N'nb-NO', 438)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (862, N'Add bug', N'en-US', 439)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (863, N'Legg bug', N'nb-NO', 439)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (864, N'Edit bug page', N'en-US', 440)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (865, N'Edit bug side', N'nb-NO', 440)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (866, N'Edit bug', N'en-US', 441)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (867, N'Edit bug', N'nb-NO', 441)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (868, N'Input category name', N'en-US', 442)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (869, N'Inngangsverdien!', N'nb-NO', 442)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (870, N'Add category success.', N'en-US', 443)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (871, N'Legg til kategori suksess.', N'nb-NO', 443)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (872, N'Category already exists.', N'en-US', 444)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (873, N'Kategori finnes allerede.', N'nb-NO', 444)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (874, N'Bug add page', N'en-US', 445)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (875, N'Bug add side', N'nb-NO', 445)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (876, N'Bug add', N'en-US', 446)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (877, N'Bug add', N'nb-NO', 446)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (878, N'Delete bug success', N'en-US', 447)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (879, N'Slett bug suksess', N'nb-NO', 447)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (880, N'Delete bug error', N'en-US', 448)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (881, N'Slett bug error', N'nb-NO', 448)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (882, N'Create document succesful', N'en-US', 449)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (883, N'Lag dokument vellykket', N'nb-NO', 449)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (884, N'Update document succesful', N'en-US', 450)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (885, N'Oppdater dokument vellykket', N'nb-NO', 450)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (886, N'Tasks', N'en-US', 451)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (887, N'Oppgaver', N'nb-NO', 451)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (888, N'Add task', N'en-US', 452)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (889, N'Legg til oppgave', N'nb-NO', 452)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (890, N'Tasks list', N'en-US', 453)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (891, N'Oppgaver liste', N'nb-NO', 453)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (892, N'Tasks name', N'en-US', 454)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (893, N'Oppgaver navn', N'nb-NO', 454)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (894, N'Edit task page', N'en-US', 455)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (895, N'Rediger oppgave side', N'nb-NO', 455)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (896, N'Edit task', N'en-US', 456)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (897, N'Rediger oppgave', N'nb-NO', 456)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (898, N'Task add page', N'en-US', 457)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (899, N'Task legge side', N'nb-NO', 457)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (900, N'Task add', N'en-US', 458)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (901, N'Task legge', N'nb-NO', 458)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (902, N'Delete contact success', N'en-US', 459)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (903, N'Slett kontakt suksess', N'nb-NO', 459)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (904, N'Delete task error', N'en-US', 460)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (905, N'Slett kontakt error', N'nb-NO', 460)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (906, N'Task number exists, please input task other', N'en-US', 461)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (907, N'oppgave eksisterer, legg inn oppgave andre', N'nb-NO', 461)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (908, N'Bug number exists, please input Bug other', N'en-US', 462)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (909, N'Bug eksisterer, legg inn Bug andre', N'nb-NO', 462)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (910, N'Categories', N'en-US', 463)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (911, N'Kategorier', N'nb-NO', 463)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (912, N'Choose category', N'en-US', 464)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (913, N'Velg kategori', N'nb-NO', 464)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (914, N'Choose customer', N'en-US', 465)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (915, N'Velg kunde', N'nb-NO', 465)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (916, N'Category name', N'en-US', 466)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (917, N'kategorier navn', N'nb-NO', 466)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (918, N'Customer name', N'en-US', 467)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (919, N'Kunde navn', N'nb-NO', 467)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (920, N'Edit document', N'en-US', 468)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (921, N'Rediger dokument', N'nb-NO', 468)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (922, N'Add document', N'en-US', 469)
INSERT [dbo].[crm_PhraseLanguages] ([ID], [PhraseValue], [LanguageCode], [PhraseID]) VALUES (923, N'Legg dokumentet', N'nb-NO', 469)
SET IDENTITY_INSERT [dbo].[crm_PhraseLanguages] OFF
/****** Object:  Table [dbo].[crm_Packages]    Script Date: 09/30/2014 16:33:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Packages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[NumberOfUsers] [int] NULL,
	[NumberOfProjects] [int] NULL,
	[NumberOfCustomers] [int] NULL,
 CONSTRAINT [PK_crm_Package] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[crm_Packages] ON
INSERT [dbo].[crm_Packages] ([Id], [Name], [NumberOfUsers], [NumberOfProjects], [NumberOfCustomers]) VALUES (1, N'Basic', 2, 2, 2)
INSERT [dbo].[crm_Packages] ([Id], [Name], [NumberOfUsers], [NumberOfProjects], [NumberOfCustomers]) VALUES (2, N'Standard', 301, 101, 201)
INSERT [dbo].[crm_Packages] ([Id], [Name], [NumberOfUsers], [NumberOfProjects], [NumberOfCustomers]) VALUES (3, N'Total', 30, 10, 20)
SET IDENTITY_INSERT [dbo].[crm_Packages] OFF
/****** Object:  Table [dbo].[crm_Logs]    Script Date: 09/30/2014 16:33:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Logs](
	[tk] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[LogTypeActionId] [int] NULL,
	[UserId] [int] NULL,
	[Content] [nvarchar](max) NULL,
	[LoginDate] [datetime] NULL,
	[LogoutDate] [datetime] NULL,
	[AccessBrowser] [nvarchar](100) NULL,
	[DetectedIp] [nvarchar](100) NULL,
	[ComputerName] [nvarchar](100) NULL,
	[Platform] [nvarchar](100) NULL,
	[Component] [nvarchar](100) NULL,
	[IsSuccess] [bit] NULL,
 CONSTRAINT [PK_crm_Logs] PRIMARY KEY CLUSTERED 
(
	[tk] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[crm_Logs] ON
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1, 10000, 2, 1, N'ffsdf', CAST(0x0000A36400E00332 AS DateTime), NULL, N'IE', N'1:', N'THUYHK', N'DESKTOP', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (2, 10000, 1, 1, N'Content', CAST(0x0000A29200000000 AS DateTime), CAST(0x0000A12500000000 AS DateTime), N'IE', N'1::', N'HGT', N'M', N'ABC', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (3, 10000, 1, 1, N'Content', CAST(0x0000A29200000000 AS DateTime), CAST(0x0000A12500000000 AS DateTime), N'IE', N'1::', N'HGT', N'M', N'ABC', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (4, 10000, 1, 1, N'Content', CAST(0x0000A36500000000 AS DateTime), CAST(0x0000A36500000000 AS DateTime), N'Chrome', N'1::', N'HGT', N'M', N'ABC', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (5, 10000, 1, 1, N'content', CAST(0x0000A36500AA6BEC AS DateTime), CAST(0x0000A36500AA6BEC AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (6, 10000, 1, 1, N'Insert new tenant', CAST(0x0000A3650112948E AS DateTime), CAST(0x0000A3650112948E AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (7, 10000, 2, 1, N'Update tenant', CAST(0x0000A3650118271F AS DateTime), CAST(0x0000A3650118271F AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (35, 10000, 2, 4, N'update user success:', CAST(0x0000A3690110CBC1 AS DateTime), CAST(0x0000A3690110CBC1 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (36, 10000, 2, 4, N'update user success:', CAST(0x0000A3690113E42D AS DateTime), CAST(0x0000A3690113E42D AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (37, 10000, 2, 4, N'update user success:', CAST(0x0000A3690115A29B AS DateTime), CAST(0x0000A3690115A29B AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (38, 10000, 2, 4, N'update user success:', CAST(0x0000A3690115AFC0 AS DateTime), CAST(0x0000A3690115AFC0 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (39, 10000, 2, 4, N'update user success:', CAST(0x0000A3690115B871 AS DateTime), CAST(0x0000A3690115B871 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (40, 10000, 2, 4, N'change password succes.', CAST(0x0000A3690115D5FB AS DateTime), CAST(0x0000A3690115D5FB AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (41, 10000, 2, 4, N'change password succes.', CAST(0x0000A36901160FE6 AS DateTime), CAST(0x0000A36901160FE6 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (46, 10000, 2, 5, N'update user success:', CAST(0x0000A36A00A2A97F AS DateTime), CAST(0x0000A36A00A2A97F AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (51, 0, 2, 1, N'update user success:', CAST(0x0000A36A00EE515D AS DateTime), CAST(0x0000A36A00EE515D AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (53, 0, 1, 1, N'Insert new user', CAST(0x0000A36A010BA67E AS DateTime), CAST(0x0000A36A010BA67E AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (54, 0, 3, 1, N'Delete user success.', CAST(0x0000A36A0114A7FB AS DateTime), CAST(0x0000A36A0114A7FB AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (55, 0, 2, 1, N'update user success:', CAST(0x0000A36A01279473 AS DateTime), CAST(0x0000A36A01279473 AS DateTime), N'Firefox', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (56, 0, 3, 1, N'Delete user success.', CAST(0x0000A36B00AD6DFC AS DateTime), CAST(0x0000A36B00AD6DFC AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (57, 0, 3, 1, N'Delete user success.', CAST(0x0000A36B00AD7434 AS DateTime), CAST(0x0000A36B00AD7434 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (58, 0, 3, 1, N'Delete user success.', CAST(0x0000A36B00AD7A6B AS DateTime), CAST(0x0000A36B00AD7A6B AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (59, 0, 1, 1, N'Insert new user', CAST(0x0000A36B00AEE146 AS DateTime), CAST(0x0000A36B00AEE146 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (60, 10000, 2, 4, N'Sudo Login support.', CAST(0x0000A36B00B0880E AS DateTime), CAST(0x0000A36B00B0880E AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (61, 10000, 2, 4, N'Sudo Login support.', CAST(0x0000A36B00B156FF AS DateTime), CAST(0x0000A36B00B156FF AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (62, 0, 1, 1, N'Insert new user', CAST(0x0000A36B00B2A44A AS DateTime), CAST(0x0000A36B00B2A44A AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (63, 10000, 2, 4, N'Sudo Login support.', CAST(0x0000A36B00B21972 AS DateTime), CAST(0x0000A36B00B21972 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (64, 0, 3, 1, N'Delete user success.', CAST(0x0000A36B00B2BF59 AS DateTime), CAST(0x0000A36B00B2BF59 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (65, 0, 1, 3, N'Insert usergroup', CAST(0x0000A36B00B4CD66 AS DateTime), CAST(0x0000A36B00B4CD66 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (66, 10000, 2, 4, N'Sudo Login support.', CAST(0x0000A36B00B492FB AS DateTime), CAST(0x0000A36B00B492FB AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (67, 0, 2, 3, N'Update new usergroup', CAST(0x0000A36B00B606E5 AS DateTime), CAST(0x0000A36B00B606E5 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (69, 10000, 2, 5, N'Update access right', CAST(0x0000A36B00D94D97 AS DateTime), CAST(0x0000A36B00D94D97 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (70, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36B00DA6766 AS DateTime), CAST(0x0000A36B00DA6766 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (71, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36B00DABF82 AS DateTime), CAST(0x0000A36B00DABF82 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (72, 10000, 2, 5, N'update user success:', CAST(0x0000A36B00DC0D46 AS DateTime), CAST(0x0000A36B00DC0D46 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (73, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36B00DB3FEC AS DateTime), CAST(0x0000A36B00DB3FEC AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (74, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36B00DB95D7 AS DateTime), CAST(0x0000A36B00DB95D7 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (75, 0, 2, 3, N'Update access right', CAST(0x0000A36B00ECF5F9 AS DateTime), CAST(0x0000A36B00ECF5F9 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (76, 0, 2, 3, N'Update access right', CAST(0x0000A36B00ED0527 AS DateTime), CAST(0x0000A36B00ED0527 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (77, 10000, 1, 5, N'Insert new user', CAST(0x0000A36B00EED8D4 AS DateTime), CAST(0x0000A36B00EED8D4 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (78, 10000, 3, 5, N'Delete user success.', CAST(0x0000A36B00EEE9A5 AS DateTime), CAST(0x0000A36B00EEE9A5 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (79, 0, 2, 1, N'Update tenant', CAST(0x0000A36B00EFDD17 AS DateTime), CAST(0x0000A36B00EFDD17 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (80, 0, 3, 1, N'Delete tenant', CAST(0x0000A36B00F06D8D AS DateTime), CAST(0x0000A36B00F06D8D AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (81, 10000, 2, 5, N'update user success:', CAST(0x0000A36B00F2CBAC AS DateTime), CAST(0x0000A36B00F2CBAC AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (82, 10000, 2, 5, N'Update access right', CAST(0x0000A36B00F26C26 AS DateTime), CAST(0x0000A36B00F26C26 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (83, 10055, 1, 34, N'Insert new user', CAST(0x0000A36B00FB87D1 AS DateTime), CAST(0x0000A36B00FB87D1 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (84, 0, 2, 1, N'Update access right', CAST(0x0000A36B00FBC36D AS DateTime), CAST(0x0000A36B00FBC36D AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (85, 0, 2, 1, N'Update access right', CAST(0x0000A36B00FC9FA8 AS DateTime), CAST(0x0000A36B00FC9FA8 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (86, 0, 2, 1, N'Update access right', CAST(0x0000A36B00FD1ECF AS DateTime), CAST(0x0000A36B00FD1ECF AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (87, 0, 2, 1, N'Update access right', CAST(0x0000A36B00FD729E AS DateTime), CAST(0x0000A36B00FD729E AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (88, 0, 2, 1, N'Update access right', CAST(0x0000A36B00FDB828 AS DateTime), CAST(0x0000A36B00FDB828 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (89, 0, 2, 1, N'Update access right', CAST(0x0000A36B00FE0E4E AS DateTime), CAST(0x0000A36B00FE0E4E AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (90, 0, 2, 1, N'Update access right', CAST(0x0000A36B00FEDDFC AS DateTime), CAST(0x0000A36B00FEDDFD AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (91, 0, 2, 1, N'Update access right', CAST(0x0000A36B00FF0E07 AS DateTime), CAST(0x0000A36B00FF0E07 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (92, 0, 2, 1, N'Update tenant', CAST(0x0000A36B00FFFCDB AS DateTime), CAST(0x0000A36B00FFFCDB AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (93, 0, 2, 1, N'Update access right', CAST(0x0000A36B00FF3582 AS DateTime), CAST(0x0000A36B00FF3582 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (94, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36B0116AA73 AS DateTime), CAST(0x0000A36B0116AA73 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (95, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36B011720BD AS DateTime), CAST(0x0000A36B011720BD AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (96, 0, 1, 1, N'Insert usergroup', CAST(0x0000A36B011738CB AS DateTime), CAST(0x0000A36B011738CB AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (97, 0, 2, 1, N'Update access right', CAST(0x0000A36B01189019 AS DateTime), CAST(0x0000A36B01189019 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (98, 0, 2, 1, N'Update tenant', CAST(0x0000A36C00918658 AS DateTime), CAST(0x0000A36C00918658 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (99, 0, 2, 1, N'Update tenant', CAST(0x0000A36C0091FC31 AS DateTime), CAST(0x0000A36C0091FC31 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (100, 0, 2, 1, N'Update access right', CAST(0x0000A36C009F49EA AS DateTime), CAST(0x0000A36C009F49EA AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (101, 0, 2, 1, N'Update tenant', CAST(0x0000A36C00A3F9F1 AS DateTime), CAST(0x0000A36C00A3F9F1 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (102, 0, 1, 1, N'Insert new tenant', CAST(0x0000A36C00AD9741 AS DateTime), CAST(0x0000A36C00AD9741 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (103, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A36C00AD9911 AS DateTime), CAST(0x0000A36C00AD9911 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (104, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A36C00AD993A AS DateTime), CAST(0x0000A36C00AD993A AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (105, 0, 1, 1, N'Insert role tenant admin for user', CAST(0x0000A36C00AD993F AS DateTime), CAST(0x0000A36C00AD993F AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (106, 0, 2, 1, N'Update tenant', CAST(0x0000A36C00AF05F3 AS DateTime), CAST(0x0000A36C00AF05F3 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (107, 0, 2, 1, N'update user success:', CAST(0x0000A36C00B53163 AS DateTime), CAST(0x0000A36C00B53163 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (108, 0, 2, 1, N'update user success:', CAST(0x0000A36C00B54F71 AS DateTime), CAST(0x0000A36C00B54F71 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (109, 0, 2, 1, N'Update tenant', CAST(0x0000A36C00B717E6 AS DateTime), CAST(0x0000A36C00B717E6 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (110, 0, 2, 1, N'update user success:', CAST(0x0000A36C00B6B731 AS DateTime), CAST(0x0000A36C00B6B731 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (111, 0, 2, 1, N'Update tenant', CAST(0x0000A36C00B84F08 AS DateTime), CAST(0x0000A36C00B84F08 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (112, 0, 2, 1, N'update user success:', CAST(0x0000A36C00B994AA AS DateTime), CAST(0x0000A36C00B994AA AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (113, 0, 2, 1, N'update user success:', CAST(0x0000A36C00B99FDD AS DateTime), CAST(0x0000A36C00B99FDD AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (114, 0, 2, 1, N'update user success:', CAST(0x0000A36C00B93613 AS DateTime), CAST(0x0000A36C00B93613 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (115, 0, 2, 1, N'Update tenant', CAST(0x0000A36C00BB32CB AS DateTime), CAST(0x0000A36C00BB32CB AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (116, 0, 2, 1, N'Update tenant', CAST(0x0000A36C00BB40AE AS DateTime), CAST(0x0000A36C00BB40AE AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (117, 0, 1, 3, N'Insert new tenant', CAST(0x0000A36C00DF4B4C AS DateTime), CAST(0x0000A36C00DF4B4C AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (118, 0, 1, 3, N'Insert user tenant admin', CAST(0x0000A36C00DF4F91 AS DateTime), CAST(0x0000A36C00DF4F91 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (119, 0, 2, 3, N'Assigned user for tenant', CAST(0x0000A36C00DF4FB7 AS DateTime), CAST(0x0000A36C00DF4FB7 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (120, 0, 1, 3, N'Insert role tenant admin for user', CAST(0x0000A36C00DF4FCD AS DateTime), CAST(0x0000A36C00DF4FCD AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (121, 0, 2, 1, N'update user success:', CAST(0x0000A36C00EA4BB6 AS DateTime), CAST(0x0000A36C00EA4BB6 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (122, 0, 2, 1, N'update user success:', CAST(0x0000A36C00EC312C AS DateTime), CAST(0x0000A36C00EC312C AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (123, 0, 2, 1, N'update user success:', CAST(0x0000A36C00EC5B70 AS DateTime), CAST(0x0000A36C00EC5B70 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (124, 0, 2, 1, N'update user success:', CAST(0x0000A36C00EC7B3F AS DateTime), CAST(0x0000A36C00EC7B3F AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (125, 0, 1, 1, N'Insert new tenant', CAST(0x0000A36C00F73F32 AS DateTime), CAST(0x0000A36C00F73F32 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (126, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A36C00F7403C AS DateTime), CAST(0x0000A36C00F7403C AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (127, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A36C00F74043 AS DateTime), CAST(0x0000A36C00F74043 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (128, 0, 1, 1, N'Insert role tenant admin for user', CAST(0x0000A36C00F74052 AS DateTime), CAST(0x0000A36C00F74052 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (129, 0, 1, 1, N'Insert new tenant', CAST(0x0000A36C00FA2C4C AS DateTime), CAST(0x0000A36C00FA2C4C AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (130, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A36C00FA3D0B AS DateTime), CAST(0x0000A36C00FA3D0B AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (131, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A36C00FA43D6 AS DateTime), CAST(0x0000A36C00FA43D6 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (132, 0, 1, 1, N'Insert role tenant admin for user', CAST(0x0000A36C00FA6F9C AS DateTime), CAST(0x0000A36C00FA6F9C AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (133, 0, 2, 1, N'Update tenant', CAST(0x0000A36C00FFE911 AS DateTime), CAST(0x0000A36C00FFE911 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (134, 0, 1, 1, N'Insert new tenant', CAST(0x0000A36C0107E822 AS DateTime), CAST(0x0000A36C0107E822 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (135, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A36C0107E8FE AS DateTime), CAST(0x0000A36C0107E8FE AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (136, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A36C0107E90D AS DateTime), CAST(0x0000A36C0107E90D AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (137, 0, 1, 1, N'Insert role tenant admin for user', CAST(0x0000A36C0107E93F AS DateTime), CAST(0x0000A36C0107E93F AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User Role', 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (138, 0, 2, 1, N'update user success:', CAST(0x0000A36C011A6A54 AS DateTime), CAST(0x0000A36C011A6A54 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (139, 10061, 2, 49, N'update user success:', CAST(0x0000A36F009C1E76 AS DateTime), CAST(0x0000A36F009C1E76 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (140, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36F00AB2DE0 AS DateTime), CAST(0x0000A36F00AB2DE0 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (141, 0, 1, 1, N'Insert usergroup', CAST(0x0000A36F00AC76D8 AS DateTime), CAST(0x0000A36F00AC76D8 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (142, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36F00ACE968 AS DateTime), CAST(0x0000A36F00ACE968 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (143, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36F00AD37B3 AS DateTime), CAST(0x0000A36F00AD37B3 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (144, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36F00B0F567 AS DateTime), CAST(0x0000A36F00B0F567 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (145, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36F00B23DF2 AS DateTime), CAST(0x0000A36F00B23DF2 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (146, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36F00B5DA52 AS DateTime), CAST(0x0000A36F00B5DA52 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (147, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36F00B5E6AB AS DateTime), CAST(0x0000A36F00B5E6AB AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (148, 0, 1, 1, N'Insert new tenant', CAST(0x0000A36F00B84DC5 AS DateTime), CAST(0x0000A36F00B84DC5 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (149, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A36F00B84F34 AS DateTime), CAST(0x0000A36F00B84F34 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (150, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A36F00B84F5A AS DateTime), CAST(0x0000A36F00B84F5A AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (151, 0, 1, 1, N'Insert role tenant admin for user', CAST(0x0000A36F00B84F81 AS DateTime), CAST(0x0000A36F00B84F81 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (152, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36F00BE10D2 AS DateTime), CAST(0x0000A36F00BE10D2 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (153, 0, 2, 1, N'Update new usergroup', CAST(0x0000A36F00C7B53C AS DateTime), CAST(0x0000A36F00C7B53C AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (154, 0, 1, 1, N'Insert usergroup', CAST(0x0000A36F00D8E5AF AS DateTime), CAST(0x0000A36F00D8E5AF AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (155, 0, 2, 1, N'Update access right', CAST(0x0000A36F012F04C1 AS DateTime), CAST(0x0000A36F012F04C1 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (156, 0, 1, 1, N'Insert new tenant', CAST(0x0000A37001053CB0 AS DateTime), CAST(0x0000A37001053CB0 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (157, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A370010542E3 AS DateTime), CAST(0x0000A370010542E3 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (158, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A37001054406 AS DateTime), CAST(0x0000A37001054406 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (159, 0, 1, 1, N'Insert role tenant admin for user', CAST(0x0000A3700105441A AS DateTime), CAST(0x0000A3700105441A AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (160, 0, 1, 1, N'Insert new tenant', CAST(0x0000A370010A96C1 AS DateTime), CAST(0x0000A370010A96C1 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (161, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A370010A992E AS DateTime), CAST(0x0000A370010A992E AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (162, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A370010A9953 AS DateTime), CAST(0x0000A370010A9953 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (163, 0, 1, 1, N'Insert role tenant admin for user', CAST(0x0000A370010A99A1 AS DateTime), CAST(0x0000A370010A99A1 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (164, 10061, 2, 49, N'Update tenant', CAST(0x0000A37001284A64 AS DateTime), CAST(0x0000A37001284A64 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (165, 10061, 2, 49, N'Update tenant', CAST(0x0000A3700128B7F9 AS DateTime), CAST(0x0000A3700128B7F9 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (166, 10061, 2, 49, N'Update tenant', CAST(0x0000A371009E19BE AS DateTime), CAST(0x0000A371009E19BE AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (167, 10061, 2, 49, N'Update tenant', CAST(0x0000A37100A473F8 AS DateTime), CAST(0x0000A37100A473F8 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (168, 10061, 2, 49, N'Update tenant', CAST(0x0000A37100AEC227 AS DateTime), CAST(0x0000A37100AEC227 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (169, 10061, 2, 49, N'Update company profiles', CAST(0x0000A37100F6CBF0 AS DateTime), CAST(0x0000A37100F6CBF0 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (170, 10061, 2, 49, N'Update company profiles', CAST(0x0000A37100F72927 AS DateTime), CAST(0x0000A37100F72927 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (171, 10061, 2, 49, N'Update company profiles', CAST(0x0000A37100F7D421 AS DateTime), CAST(0x0000A37100F7D421 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (172, 10061, 2, 49, N'Update company profiles', CAST(0x0000A37100F8F52E AS DateTime), CAST(0x0000A37100F8F52E AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (173, 10061, 2, 49, N'Update company profiles', CAST(0x0000A37100F91668 AS DateTime), CAST(0x0000A37100F91668 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (174, 0, 2, 1, N'update user success:', CAST(0x0000A3710104C2C1 AS DateTime), CAST(0x0000A3710104C2C1 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (175, 0, 1, 1, N'Create contact', CAST(0x0000A37700906859 AS DateTime), CAST(0x0000A37700906859 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (176, 0, 2, 1, N'Update access right', CAST(0x0000A37701276C1A AS DateTime), CAST(0x0000A37701276C1A AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (177, 0, 2, 1, N'Update access right', CAST(0x0000A3770127B125 AS DateTime), CAST(0x0000A3770127B125 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (178, 0, 2, 1, N'Update access right', CAST(0x0000A3770127C559 AS DateTime), CAST(0x0000A3770127C559 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (179, 0, 2, 1, N'Update access right', CAST(0x0000A3770127E5EA AS DateTime), CAST(0x0000A3770127E5EA AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (180, 0, 2, 1, N'Update tenant', CAST(0x0000A37800B2B65F AS DateTime), CAST(0x0000A37800B2B65F AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (181, 0, 1, 1, N'Insert usergroup', CAST(0x0000A37800B666D1 AS DateTime), CAST(0x0000A37800B666D2 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (182, 0, 1, 1, N'Insert usergroup', CAST(0x0000A37800B737AC AS DateTime), CAST(0x0000A37800B737AC AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (183, 0, 2, 1, N'Update tenant', CAST(0x0000A37800B8709D AS DateTime), CAST(0x0000A37800B8709D AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (184, 0, 1, 1, N'Insert usergroup', CAST(0x0000A37800B849A1 AS DateTime), CAST(0x0000A37800B849A1 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (185, 0, 1, 1, N'Insert usergroup', CAST(0x0000A37800B8C69B AS DateTime), CAST(0x0000A37800B8C69B AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (186, 0, 1, 1, N'Insert usergroup', CAST(0x0000A37800BB1EDB AS DateTime), CAST(0x0000A37800BB1EDB AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (187, 0, 2, 1, N'Update new usergroup', CAST(0x0000A37800BBBB42 AS DateTime), CAST(0x0000A37800BBBB42 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (188, 0, 2, 1, N'Update new usergroup', CAST(0x0000A37800BBDA21 AS DateTime), CAST(0x0000A37800BBDA21 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (189, 0, 2, 1, N'Update new usergroup', CAST(0x0000A37800BC2C42 AS DateTime), CAST(0x0000A37800BC2C42 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (190, 0, 1, 1, N'Insert usergroup', CAST(0x0000A37800BC5160 AS DateTime), CAST(0x0000A37800BC5160 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (191, 0, 2, 1, N'Update new usergroup', CAST(0x0000A37800BCFAB0 AS DateTime), CAST(0x0000A37800BCFAB0 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (192, 0, 2, 1, N'update user success:', CAST(0x0000A37800EAB673 AS DateTime), CAST(0x0000A37800EAB673 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (193, 0, 2, 1, N'update user success:', CAST(0x0000A37800EB0121 AS DateTime), CAST(0x0000A37800EB0121 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (194, 0, 2, 1, N'update user success:', CAST(0x0000A37800EB0F9A AS DateTime), CAST(0x0000A37800EB0F9A AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (195, 0, 2, 1, N'update user success:', CAST(0x0000A37800ED2DD4 AS DateTime), CAST(0x0000A37800ED2DD4 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (196, 0, 1, 1, N'Insert new tenant', CAST(0x0000A37800EEC2F2 AS DateTime), CAST(0x0000A37800EEC2F2 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (197, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A37800EEC4B3 AS DateTime), CAST(0x0000A37800EEC4B3 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (198, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A37800EEC4E0 AS DateTime), CAST(0x0000A37800EEC4E0 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (199, 0, 1, 1, N'Insert role tenant admin for user', CAST(0x0000A37800EEC503 AS DateTime), CAST(0x0000A37800EEC503 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (200, 0, 2, 1, N'update user success:', CAST(0x0000A37800F2D0DF AS DateTime), CAST(0x0000A37800F2D0DF AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (201, 0, 2, 1, N'update user success:', CAST(0x0000A37800F2DA84 AS DateTime), CAST(0x0000A37800F2DA84 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (202, 0, 2, 1, N'Update tenant', CAST(0x0000A37800F34281 AS DateTime), CAST(0x0000A37800F34281 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (203, 0, 2, 1, N'update user success:', CAST(0x0000A37800F469AE AS DateTime), CAST(0x0000A37800F469AE AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (204, 0, 2, 1, N'update user success:', CAST(0x0000A37800F49074 AS DateTime), CAST(0x0000A37800F49074 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (205, 0, 2, 1, N'update avatar of user success', CAST(0x0000A37800F540D7 AS DateTime), CAST(0x0000A37800F540D7 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (206, 0, 2, 1, N'update user success:', CAST(0x0000A37800F55578 AS DateTime), CAST(0x0000A37800F55578 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (207, 0, 2, 1, N'Update tenant', CAST(0x0000A37800F9D2AC AS DateTime), CAST(0x0000A37800F9D2AC AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (208, 0, 2, 1, N'update user success:', CAST(0x0000A37800FF49F5 AS DateTime), CAST(0x0000A37800FF49F5 AS DateTime), N'Firefox', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (209, 0, 2, 1, N'update user success:', CAST(0x0000A37801073A4F AS DateTime), CAST(0x0000A37801073A4F AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (210, 0, 2, 1, N'update user success:', CAST(0x0000A37801084B30 AS DateTime), CAST(0x0000A37801084B30 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (211, 0, 2, 1, N'update avatar of user success', CAST(0x0000A3780108C035 AS DateTime), CAST(0x0000A3780108C035 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (212, 0, 2, 1, N'Update new usergroup', CAST(0x0000A378010FE057 AS DateTime), CAST(0x0000A378010FE057 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (213, 0, 2, 1, N'update user success:', CAST(0x0000A3780118CA6C AS DateTime), CAST(0x0000A3780118CA6C AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (214, 0, 2, 1, N'update user success:', CAST(0x0000A3780118D7D7 AS DateTime), CAST(0x0000A3780118D7D7 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (215, 0, 2, 1, N'update user success:', CAST(0x0000A3780118E99A AS DateTime), CAST(0x0000A3780118E99A AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (216, 0, 2, 1, N'update user success:', CAST(0x0000A37801191C05 AS DateTime), CAST(0x0000A37801191C05 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (217, 0, 2, 1, N'update user success:', CAST(0x0000A378011BB9B1 AS DateTime), CAST(0x0000A378011BB9B1 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (218, 0, 1, 1, N'Insert usergroup', CAST(0x0000A3780125C555 AS DateTime), CAST(0x0000A3780125C555 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'UserGroup', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (219, 10061, 2, 49, N'Update access right', CAST(0x0000A378012F3800 AS DateTime), CAST(0x0000A378012F3800 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (220, 0, 1, 1, N'Insert new tenant', CAST(0x0000A37900937347 AS DateTime), CAST(0x0000A37900937347 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (221, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A379009374C8 AS DateTime), CAST(0x0000A379009374C8 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (222, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A379009374D7 AS DateTime), CAST(0x0000A379009374D7 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (223, 0, 1, 1, N'Insert role tenant admin for user', CAST(0x0000A379009374F9 AS DateTime), CAST(0x0000A379009374F9 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (224, 0, 1, 1, N'Insert new tenant', CAST(0x0000A379009521CA AS DateTime), CAST(0x0000A379009521CA AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (225, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A37900952295 AS DateTime), CAST(0x0000A37900952295 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (226, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A379009522A1 AS DateTime), CAST(0x0000A379009522A1 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (227, 0, 1, 1, N'Insert role tenant admin for user', CAST(0x0000A379009522AD AS DateTime), CAST(0x0000A379009522AD AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (228, 0, 2, 1, N'update user success:', CAST(0x0000A37900982AE7 AS DateTime), CAST(0x0000A37900982AE7 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (229, 0, 1, 1, N'Insert new tenant', CAST(0x0000A379009927CB AS DateTime), CAST(0x0000A379009927CB AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (230, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A37900993D34 AS DateTime), CAST(0x0000A37900993D34 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (231, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A37900994919 AS DateTime), CAST(0x0000A37900994919 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (232, 0, 1, 1, N'Insert new tenant', CAST(0x0000A379009CA20E AS DateTime), CAST(0x0000A379009CA20E AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (233, 0, 1, 1, N'Insert user tenant admin', CAST(0x0000A379009CA849 AS DateTime), CAST(0x0000A379009CA849 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (234, 0, 2, 1, N'Assigned user for tenant', CAST(0x0000A379009CB308 AS DateTime), CAST(0x0000A379009CB308 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (235, 0, 1, 1, N'Insert role tenant admin for user', CAST(0x0000A379009CB318 AS DateTime), CAST(0x0000A379009CB318 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (236, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37900A28182 AS DateTime), CAST(0x0000A37900A28182 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (237, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A37900A2824A AS DateTime), CAST(0x0000A37900A2824A AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (238, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37900A28255 AS DateTime), CAST(0x0000A37900A28255 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
GO
print 'Processed 200 total records'
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (239, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37900A28270 AS DateTime), CAST(0x0000A37900A28270 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (240, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37900A3603F AS DateTime), CAST(0x0000A37900A3603F AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (241, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37900A40BF2 AS DateTime), CAST(0x0000A37900A40BF2 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (242, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37900A42C60 AS DateTime), CAST(0x0000A37900A42C60 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (243, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37900A4B48B AS DateTime), CAST(0x0000A37900A4B48C AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (244, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37900A624C4 AS DateTime), CAST(0x0000A37900A624C4 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (245, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A37900A62ECC AS DateTime), CAST(0x0000A37900A62ECC AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (246, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37900A634D5 AS DateTime), CAST(0x0000A37900A634D5 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (247, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37900A63A84 AS DateTime), CAST(0x0000A37900A63A84 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (248, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37900A730AC AS DateTime), CAST(0x0000A37900A730AC AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (249, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A37900A731A2 AS DateTime), CAST(0x0000A37900A731A2 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (250, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37900A731A9 AS DateTime), CAST(0x0000A37900A731A9 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (251, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37900A731B6 AS DateTime), CAST(0x0000A37900A731B6 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (252, 10072, 2, 62, N'update avatar of user success', CAST(0x0000A37900A762C8 AS DateTime), CAST(0x0000A37900A762C8 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (253, 10072, 2, 62, N'update user success:', CAST(0x0000A37900A77878 AS DateTime), CAST(0x0000A37900A77878 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (254, 10071, 2, 61, N'Update company profiles', CAST(0x0000A37900ADDE08 AS DateTime), CAST(0x0000A37900ADDE08 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (255, 0, 2, 59, N'Update tenant', CAST(0x0000A37900AE14F1 AS DateTime), CAST(0x0000A37900AE14F1 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (256, 0, 2, 3, N'Update access right', CAST(0x0000A37900AE4F4C AS DateTime), CAST(0x0000A37900AE4F4C AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (258, 0, 2, 59, N'update avatar of user success', CAST(0x0000A37900BA5AEC AS DateTime), CAST(0x0000A37900BA5AEC AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (259, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37900BCDBCE AS DateTime), CAST(0x0000A37900BCDBCE AS DateTime), N'Firefox', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (260, 10071, 2, 61, N'Update company profiles', CAST(0x0000A37900E37311 AS DateTime), CAST(0x0000A37900E37311 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (261, 10071, 2, 61, N'update avatar of user success', CAST(0x0000A37900E38F52 AS DateTime), CAST(0x0000A37900E38F52 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (262, 0, 1, 59, N'Insert new user', CAST(0x0000A37900E5E74A AS DateTime), CAST(0x0000A37900E5E74A AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (263, 0, 1, 59, N'Insert new user', CAST(0x0000A37900E62CCB AS DateTime), CAST(0x0000A37900E62CCB AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (264, 0, 2, 59, N'update avatar of user success', CAST(0x0000A37900E9FF66 AS DateTime), CAST(0x0000A37900E9FF67 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (265, 0, 1, 59, N'Insert new user', CAST(0x0000A37900EFAE93 AS DateTime), CAST(0x0000A37900EFAE93 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (266, 0, 2, 59, N'update avatar of user success', CAST(0x0000A37900F7BC20 AS DateTime), CAST(0x0000A37900F7BC20 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (267, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37900F9878F AS DateTime), CAST(0x0000A37900F9878F AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (268, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A37900F98CB4 AS DateTime), CAST(0x0000A37900F98CB4 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (269, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37900F990A6 AS DateTime), CAST(0x0000A37900F990A6 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (270, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37900F99264 AS DateTime), CAST(0x0000A37900F99264 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (271, 10072, 1, 62, N'Create contact', CAST(0x0000A3790112AFB8 AS DateTime), CAST(0x0000A3790112AFB8 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (272, 10072, 2, 62, N'Edit contact', CAST(0x0000A3790112C40E AS DateTime), CAST(0x0000A3790112C40E AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (273, 10072, 1, 62, N'Save avatar image.', CAST(0x0000A379011D0EEE AS DateTime), CAST(0x0000A379011D0EEE AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Customers', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (274, 10072, 1, 62, N'Save avatar image.', CAST(0x0000A379011DBF6A AS DateTime), CAST(0x0000A379011DBF6A AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Customers', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (275, 10072, 1, 62, N'Insert new customer', CAST(0x0000A379011E6249 AS DateTime), CAST(0x0000A379011E6249 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (276, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37A00E6D424 AS DateTime), CAST(0x0000A37A00E6D424 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (277, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A37A00E6D549 AS DateTime), CAST(0x0000A37A00E6D549 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (278, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37A00E6D555 AS DateTime), CAST(0x0000A37A00E6D555 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (279, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37A00E6D573 AS DateTime), CAST(0x0000A37A00E6D573 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (280, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A37D00B0846C AS DateTime), CAST(0x0000A37D00B0846C AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (281, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A37D00BD4BB7 AS DateTime), CAST(0x0000A37D00BD4BB7 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (282, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A37D00CB1799 AS DateTime), CAST(0x0000A37D00CB1799 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (283, 0, 2, 59, N'update avatar of user success', CAST(0x0000A37D00F40912 AS DateTime), CAST(0x0000A37D00F40912 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (284, 0, 1, 59, N'Created new user', CAST(0x0000A37D00F4ED60 AS DateTime), CAST(0x0000A37D00F4ED60 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (285, 0, 1, 59, N'Created new user', CAST(0x0000A37D00F58DF7 AS DateTime), CAST(0x0000A37D00F58DF7 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (286, 0, 1, 59, N'Created new user', CAST(0x0000A37D00F61D20 AS DateTime), CAST(0x0000A37D00F61D20 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (287, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A37D00FB7C0A AS DateTime), CAST(0x0000A37D00FB7C0A AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (288, 0, 1, 59, N'Insert new user', CAST(0x0000A37D0105C91A AS DateTime), CAST(0x0000A37D0105C91A AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (289, 0, 2, 59, N'update user success:', CAST(0x0000A37D010C4EE1 AS DateTime), CAST(0x0000A37D010C4EE1 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (290, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A37D01145CA4 AS DateTime), CAST(0x0000A37D01145CA4 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (291, 0, 2, 59, N'update user success:', CAST(0x0000A37D011B45CD AS DateTime), CAST(0x0000A37D011B45CD AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (292, 0, 1, 59, N'Insert new user', CAST(0x0000A37D011B755F AS DateTime), CAST(0x0000A37D011B755F AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (293, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37D011E4389 AS DateTime), CAST(0x0000A37D011E4389 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (294, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37D011EE3B0 AS DateTime), CAST(0x0000A37D011EE3B0 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (295, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37D01262B54 AS DateTime), CAST(0x0000A37D01262B54 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (296, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37D01266D03 AS DateTime), CAST(0x0000A37D01266D03 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (297, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37D0127ED25 AS DateTime), CAST(0x0000A37D0127ED25 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (298, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37D0127ED46 AS DateTime), CAST(0x0000A37D0127ED46 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (299, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37D01293578 AS DateTime), CAST(0x0000A37D01293578 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (300, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37D012943AB AS DateTime), CAST(0x0000A37D012943AB AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (301, 0, 2, 59, N'Update setting', CAST(0x0000A37E00B34790 AS DateTime), CAST(0x0000A37E00B34790 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (302, 0, 2, 59, N'Update access right', CAST(0x0000A37E00B4EB39 AS DateTime), CAST(0x0000A37E00B4EB39 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (303, 0, 2, 59, N'Update access right', CAST(0x0000A37E00B66130 AS DateTime), CAST(0x0000A37E00B66130 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (304, 0, 2, 59, N'Update access right', CAST(0x0000A37E00B69C1A AS DateTime), CAST(0x0000A37E00B69C1A AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (305, 0, 2, 59, N'Update access right', CAST(0x0000A37E00B76688 AS DateTime), CAST(0x0000A37E00B76688 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (306, 0, 2, 59, N'Update setting', CAST(0x0000A37E00B7AF93 AS DateTime), CAST(0x0000A37E00B7AF93 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (307, 0, 2, 59, N'Update setting', CAST(0x0000A37E00B7CDE0 AS DateTime), CAST(0x0000A37E00B7CDE0 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (308, 0, 2, 59, N'Update setting', CAST(0x0000A37E00BA9BF7 AS DateTime), CAST(0x0000A37E00BA9BF7 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (309, 0, 2, 59, N'Update setting', CAST(0x0000A37E00BAB9F7 AS DateTime), CAST(0x0000A37E00BAB9F7 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (310, 0, 2, 59, N'Update setting', CAST(0x0000A37E00BAE9FF AS DateTime), CAST(0x0000A37E00BAE9FF AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (311, 0, 2, 59, N'Update access right', CAST(0x0000A37E00BC8B21 AS DateTime), CAST(0x0000A37E00BC8B21 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (312, 0, 2, 59, N'Update access right', CAST(0x0000A37E00BCAAE6 AS DateTime), CAST(0x0000A37E00BCAAE6 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (313, 0, 2, 59, N'Update access right', CAST(0x0000A37E00BCC486 AS DateTime), CAST(0x0000A37E00BCC486 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (314, 0, 2, 59, N'Update info tenant', CAST(0x0000A37E00CC6614 AS DateTime), CAST(0x0000A37E00CC6614 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (315, 0, 2, 59, N'Update person contact', CAST(0x0000A37E00CCA0AC AS DateTime), CAST(0x0000A37E00CCA0AC AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (316, 0, 2, 59, N'Update info tenant', CAST(0x0000A37E00CD1040 AS DateTime), CAST(0x0000A37E00CD1040 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (317, 0, 2, 59, N'Update person contact', CAST(0x0000A37E00CDB6B6 AS DateTime), CAST(0x0000A37E00CDB6B6 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (318, 0, 2, 59, N'Update info tenant', CAST(0x0000A37E00DA3957 AS DateTime), CAST(0x0000A37E00DA3957 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (319, 0, 2, 59, N'Update info tenant', CAST(0x0000A37E00DA669B AS DateTime), CAST(0x0000A37E00DA669B AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (320, 0, 2, 59, N'Update person contact', CAST(0x0000A37E00DA66AB AS DateTime), CAST(0x0000A37E00DA66AB AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (321, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37E00E2BAE2 AS DateTime), CAST(0x0000A37E00E2BAE2 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (322, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37E00E2BBE1 AS DateTime), CAST(0x0000A37E00E2BBE1 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (323, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37E00E2BC08 AS DateTime), CAST(0x0000A37E00E2BC08 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (324, 0, 2, 59, N'Update info tenant', CAST(0x0000A37E00E2ECB3 AS DateTime), CAST(0x0000A37E00E2ECB3 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (325, 0, 2, 59, N'Update person contact', CAST(0x0000A37E00E2ECB8 AS DateTime), CAST(0x0000A37E00E2ECB8 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (326, 0, 2, 59, N'Update setting', CAST(0x0000A37E00F65C92 AS DateTime), CAST(0x0000A37E00F65C92 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (327, 0, 2, 59, N'Update setting', CAST(0x0000A37E00F6F824 AS DateTime), CAST(0x0000A37E00F6F824 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (328, 0, 2, 59, N'Update setting', CAST(0x0000A37E00FC4891 AS DateTime), CAST(0x0000A37E00FC4891 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (329, 0, 2, 59, N'Update setting', CAST(0x0000A37E00FE19AE AS DateTime), CAST(0x0000A37E00FE19AE AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (330, 0, 2, 59, N'Update setting', CAST(0x0000A37E00FE2476 AS DateTime), CAST(0x0000A37E00FE2476 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (331, 0, 2, 59, N'Update setting', CAST(0x0000A37E00FFFC78 AS DateTime), CAST(0x0000A37E00FFFC78 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (332, 10094, 2, 1, N'Update setting', CAST(0x0000A37E0124C456 AS DateTime), CAST(0x0000A37E0124C456 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (333, 0, 2, 59, N'Update setting', CAST(0x0000A37E01289858 AS DateTime), CAST(0x0000A37E01289858 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (334, 10094, 2, 1, N'Update setting', CAST(0x0000A37E0129C87A AS DateTime), CAST(0x0000A37E0129C87A AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (335, 10094, 2, 1, N'Update setting', CAST(0x0000A37E0129CCF7 AS DateTime), CAST(0x0000A37E0129CCF7 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (336, 10094, 2, 1, N'Update setting', CAST(0x0000A37E0129D906 AS DateTime), CAST(0x0000A37E0129D906 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (337, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37E012C6DF3 AS DateTime), CAST(0x0000A37E012C6DF3 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (338, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37E012C6F6D AS DateTime), CAST(0x0000A37E012C6F6D AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (339, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37E012C6F89 AS DateTime), CAST(0x0000A37E012C6F89 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (340, 10094, 2, 1, N'update user success:', CAST(0x0000A37E012CBF81 AS DateTime), CAST(0x0000A37E012CBF81 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
GO
print 'Processed 300 total records'
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (341, 10094, 2, 1, N'update user success:', CAST(0x0000A37E012CCDAD AS DateTime), CAST(0x0000A37E012CCDAD AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (342, 0, 2, 59, N'Update access right', CAST(0x0000A37E012CF6F2 AS DateTime), CAST(0x0000A37E012CF6F2 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (343, 0, 2, 59, N'Update access right', CAST(0x0000A37E012D0967 AS DateTime), CAST(0x0000A37E012D0967 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (344, 0, 2, 59, N'Update access right', CAST(0x0000A37E012D13DE AS DateTime), CAST(0x0000A37E012D13DE AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (345, 0, 2, 59, N'update user success:', CAST(0x0000A37E012D8A64 AS DateTime), CAST(0x0000A37E012D8A64 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (346, 0, 2, 59, N'update user success:', CAST(0x0000A37E012E1D60 AS DateTime), CAST(0x0000A37E012E1D60 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (347, 0, 2, 59, N'update user success:', CAST(0x0000A37E012E4AF5 AS DateTime), CAST(0x0000A37E012E4AF5 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (348, 0, 2, 59, N'Update info tenant', CAST(0x0000A37F009DF5B1 AS DateTime), CAST(0x0000A37F009DF5B1 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (349, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37F00A326C4 AS DateTime), CAST(0x0000A37F00A326C4 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (350, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37F00A32800 AS DateTime), CAST(0x0000A37F00A32800 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (351, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37F00A32824 AS DateTime), CAST(0x0000A37F00A32824 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (352, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37F00A4C228 AS DateTime), CAST(0x0000A37F00A4C228 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (353, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37F00A4C300 AS DateTime), CAST(0x0000A37F00A4C300 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (354, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37F00A4C311 AS DateTime), CAST(0x0000A37F00A4C311 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (355, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37F00B538C5 AS DateTime), CAST(0x0000A37F00B538C5 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (356, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37F00B5ACC8 AS DateTime), CAST(0x0000A37F00B5ACC8 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (357, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37F00B5CC36 AS DateTime), CAST(0x0000A37F00B5CC36 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (358, 0, 2, 59, N'Update info tenant', CAST(0x0000A37F00B74EDF AS DateTime), CAST(0x0000A37F00B74EDF AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (359, 0, 2, 59, N'Update info tenant', CAST(0x0000A37F00B784AE AS DateTime), CAST(0x0000A37F00B784AE AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (360, 0, 2, 59, N'Update info tenant', CAST(0x0000A37F00B9C0F4 AS DateTime), CAST(0x0000A37F00B9C0F4 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (361, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37F00DF8E34 AS DateTime), CAST(0x0000A37F00DF8E34 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (362, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37F00DF9954 AS DateTime), CAST(0x0000A37F00DF9954 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (363, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37F00DF9D10 AS DateTime), CAST(0x0000A37F00DF9D10 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (364, 0, 2, 59, N'Update access right', CAST(0x0000A37F00F70D85 AS DateTime), CAST(0x0000A37F00F70D85 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (365, 10100, 1, 1, N'Insert new user', CAST(0x0000A37F00F8C595 AS DateTime), CAST(0x0000A37F00F8C595 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (366, 0, 1, 59, N'Insert new tenant', CAST(0x0000A37F010E6A14 AS DateTime), CAST(0x0000A37F010E6A14 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (367, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A37F010E6C1E AS DateTime), CAST(0x0000A37F010E6C1E AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (368, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A37F010E6C3C AS DateTime), CAST(0x0000A37F010E6C3C AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (372, 0, 2, 59, N'update user success:', CAST(0x0000A37F011762F3 AS DateTime), CAST(0x0000A37F011762F3 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (373, 0, 2, 59, N'update user success:', CAST(0x0000A37F01177107 AS DateTime), CAST(0x0000A37F01177107 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (374, 0, 2, 59, N'Update setting success', CAST(0x0000A380009517BE AS DateTime), CAST(0x0000A380009517BE AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (375, 0, 2, 59, N'Update setting success', CAST(0x0000A380009526F7 AS DateTime), CAST(0x0000A380009526F7 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (376, 0, 2, 59, N'Update setting success', CAST(0x0000A3800095459F AS DateTime), CAST(0x0000A3800095459F AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (377, 0, 1, 59, N'Insert new tenant', CAST(0x0000A380009E9FF6 AS DateTime), CAST(0x0000A380009E9FF6 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (378, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A380009EA1A1 AS DateTime), CAST(0x0000A380009EA1A1 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (379, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A380009EA1B3 AS DateTime), CAST(0x0000A380009EA1B3 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (380, 0, 2, 59, N'update user success:', CAST(0x0000A38000A5B831 AS DateTime), CAST(0x0000A38000A5B831 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (381, 0, 2, 59, N'update user success:', CAST(0x0000A38000A626B6 AS DateTime), CAST(0x0000A38000A626B6 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (382, 0, 2, 59, N'update user success:', CAST(0x0000A38000A633D7 AS DateTime), CAST(0x0000A38000A633D7 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (383, 0, 2, 59, N'update user success:', CAST(0x0000A38000A747B5 AS DateTime), CAST(0x0000A38000A747B5 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (384, 0, 2, 59, N'update user success:', CAST(0x0000A38000A82821 AS DateTime), CAST(0x0000A38000A82821 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (385, 0, 2, 59, N'Update info tenant', CAST(0x0000A38000BB5FAB AS DateTime), CAST(0x0000A38000BB5FAB AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (386, 0, 2, 59, N'Update access right', CAST(0x0000A38000D9534F AS DateTime), CAST(0x0000A38000D9534F AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (387, 0, 2, 59, N'Update access right', CAST(0x0000A38000D96491 AS DateTime), CAST(0x0000A38000D96491 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (388, 0, 2, 59, N'Update setting success', CAST(0x0000A380010CE2D0 AS DateTime), CAST(0x0000A380010CE2D0 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (389, 0, 2, 59, N'Update setting success', CAST(0x0000A380010CEFF7 AS DateTime), CAST(0x0000A380010CEFF7 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (390, 0, 2, 59, N'Update setting success', CAST(0x0000A38001177DD5 AS DateTime), CAST(0x0000A38001177DD5 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (391, 0, 2, 59, N'Update setting fail', CAST(0x0000A3800122C312 AS DateTime), CAST(0x0000A3800122C312 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (392, 0, 2, 59, N'Update setting fail', CAST(0x0000A3800122D87A AS DateTime), CAST(0x0000A3800122D87A AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (393, 0, 2, 59, N'Update setting fail', CAST(0x0000A3800122F7C8 AS DateTime), CAST(0x0000A3800122F7C8 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (394, 0, 2, 59, N'Update setting success', CAST(0x0000A38001244416 AS DateTime), CAST(0x0000A38001244416 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (395, 0, 2, 59, N'Update setting success', CAST(0x0000A381009BADC2 AS DateTime), CAST(0x0000A381009BADC2 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (396, 0, 2, 59, N'Update setting success', CAST(0x0000A38100A7E6A8 AS DateTime), CAST(0x0000A38100A7E6A8 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (398, 0, 2, 59, N'Update setting success', CAST(0x0000A38100B9C825 AS DateTime), CAST(0x0000A38100B9C825 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (399, 0, 1, 59, N'Insert new tenant', CAST(0x0000A38100D901FB AS DateTime), CAST(0x0000A38100D901FB AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (400, 0, 1, 59, N'Insert new tenant', CAST(0x0000A38100D9B392 AS DateTime), CAST(0x0000A38100D9B392 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (401, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38100D9B528 AS DateTime), CAST(0x0000A38100D9B528 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (402, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38100D9B545 AS DateTime), CAST(0x0000A38100D9B545 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (403, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A38100D9B55C AS DateTime), CAST(0x0000A38100D9B55C AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (404, 0, 1, 59, N'Created new tenant', CAST(0x0000A3810102A81A AS DateTime), CAST(0x0000A3810102A81A AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (405, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A3810102E4C3 AS DateTime), CAST(0x0000A3810102E4C3 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (406, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A3810102E9BA AS DateTime), CAST(0x0000A3810102E9BA AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (407, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A3810102EA31 AS DateTime), CAST(0x0000A3810102EA31 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (408, 0, 1, 59, N'Created new tenant', CAST(0x0000A3810103ABE2 AS DateTime), CAST(0x0000A3810103ABE2 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (409, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A3810103C037 AS DateTime), CAST(0x0000A3810103C037 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (410, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A3810103C054 AS DateTime), CAST(0x0000A3810103C054 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (411, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A3810103C0C6 AS DateTime), CAST(0x0000A3810103C0C6 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (412, 0, 1, 59, N'Created new tenant', CAST(0x0000A384009941AB AS DateTime), CAST(0x0000A384009941AB AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (413, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38400995886 AS DateTime), CAST(0x0000A38400995886 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (414, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A384009958E3 AS DateTime), CAST(0x0000A384009958E3 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (415, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A384009959E0 AS DateTime), CAST(0x0000A384009959E0 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (416, 0, 1, 59, N'Created new tenant', CAST(0x0000A384009A0455 AS DateTime), CAST(0x0000A384009A0455 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (417, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A384009A0C77 AS DateTime), CAST(0x0000A384009A0C77 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (418, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A384009A13BD AS DateTime), CAST(0x0000A384009A13BD AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (419, 0, 1, 59, N'Created new tenant', CAST(0x0000A384009C7894 AS DateTime), CAST(0x0000A384009C7894 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (420, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A384009C8574 AS DateTime), CAST(0x0000A384009C8574 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (421, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A384009C85A9 AS DateTime), CAST(0x0000A384009C85A9 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (422, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A384009CE777 AS DateTime), CAST(0x0000A384009CE777 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (423, 0, 1, 59, N'Created new tenant', CAST(0x0000A384009DFCF0 AS DateTime), CAST(0x0000A384009DFCF0 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (424, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A384009E05F6 AS DateTime), CAST(0x0000A384009E05F6 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (425, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A384009E0611 AS DateTime), CAST(0x0000A384009E0611 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (426, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A384009FAD1C AS DateTime), CAST(0x0000A384009FAD1C AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (427, 0, 1, 59, N'Created new tenant', CAST(0x0000A38400A1C2EE AS DateTime), CAST(0x0000A38400A1C2EE AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (428, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38400A1C780 AS DateTime), CAST(0x0000A38400A1C780 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (429, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38400A1C79E AS DateTime), CAST(0x0000A38400A1C79E AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (430, 0, 1, 59, N'Created new tenant', CAST(0x0000A38400A3718E AS DateTime), CAST(0x0000A38400A3718E AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (431, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38400A37560 AS DateTime), CAST(0x0000A38400A37560 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (432, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38400A37582 AS DateTime), CAST(0x0000A38400A37582 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (433, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A38400A3E95D AS DateTime), CAST(0x0000A38400A3E95D AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (434, 0, 1, 59, N'Created new tenant', CAST(0x0000A38400A56BF5 AS DateTime), CAST(0x0000A38400A56BF5 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (435, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38400A57C61 AS DateTime), CAST(0x0000A38400A57C61 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (436, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38400A57C9E AS DateTime), CAST(0x0000A38400A57C9E AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (437, 0, 2, 59, N'Update profile', CAST(0x0000A38400A58E85 AS DateTime), CAST(0x0000A38400A58E85 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (438, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A38400A58F08 AS DateTime), CAST(0x0000A38400A58F08 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (439, 0, 2, 59, N'Update setting success', CAST(0x0000A38400CA9920 AS DateTime), CAST(0x0000A38400CA9920 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (440, 0, 2, 59, N'Update tenant', CAST(0x0000A38400D78A95 AS DateTime), CAST(0x0000A38400D78A95 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (441, 0, 2, 59, N'Update plan package', CAST(0x0000A38400D915C2 AS DateTime), CAST(0x0000A38400D915C2 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Package', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (442, 0, 2, 59, N'Update setting success', CAST(0x0000A38400DA703F AS DateTime), CAST(0x0000A38400DA703F AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (443, 0, 2, 59, N'Update info tenant', CAST(0x0000A38400DE9D69 AS DateTime), CAST(0x0000A38400DE9D69 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (444, 0, 2, 59, N'Update person contact', CAST(0x0000A38400DE9D70 AS DateTime), CAST(0x0000A38400DE9D70 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (445, 0, 2, 59, N'Update setting success', CAST(0x0000A38400DF1E3E AS DateTime), CAST(0x0000A38400DF1E3E AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
GO
print 'Processed 400 total records'
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (446, 0, 2, 59, N'Update setting success', CAST(0x0000A38400DF5C11 AS DateTime), CAST(0x0000A38400DF5C11 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (447, 0, 1, 59, N'Created new tenant', CAST(0x0000A38400E84748 AS DateTime), CAST(0x0000A38400E84748 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (448, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38400E84AFF AS DateTime), CAST(0x0000A38400E84AFF AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (449, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38400E84B29 AS DateTime), CAST(0x0000A38400E84B29 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (450, 0, 2, 59, N'Update profile', CAST(0x0000A38400E8515A AS DateTime), CAST(0x0000A38400E8515A AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (451, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A38400E85710 AS DateTime), CAST(0x0000A38400E85710 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (452, 0, 1, 59, N'Created new tenant', CAST(0x0000A38400E91804 AS DateTime), CAST(0x0000A38400E91804 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (453, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38400E91CFF AS DateTime), CAST(0x0000A38400E91CFF AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (454, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38400E91D97 AS DateTime), CAST(0x0000A38400E91D97 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (455, 0, 2, 59, N'Update profile', CAST(0x0000A38400E92122 AS DateTime), CAST(0x0000A38400E92122 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (456, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A38400E9F238 AS DateTime), CAST(0x0000A38400E9F238 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (457, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38400EA398A AS DateTime), CAST(0x0000A38400EA398A AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (458, 0, 2, 59, N'Update person contact', CAST(0x0000A38400EA468F AS DateTime), CAST(0x0000A38400EA468F AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (459, 0, 1, 59, N'Created new tenant', CAST(0x0000A38400EA7EDA AS DateTime), CAST(0x0000A38400EA7EDA AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (460, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38400EA8125 AS DateTime), CAST(0x0000A38400EA8125 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (461, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38400EA8136 AS DateTime), CAST(0x0000A38400EA8136 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (462, 0, 2, 59, N'Update profile', CAST(0x0000A38400EA84C8 AS DateTime), CAST(0x0000A38400EA84C8 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (463, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A38400EAD1F5 AS DateTime), CAST(0x0000A38400EAD1F5 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (464, 0, 1, 59, N'Created new tenant', CAST(0x0000A38400EAF6BF AS DateTime), CAST(0x0000A38400EAF6BF AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (465, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38400EAF87A AS DateTime), CAST(0x0000A38400EAF87A AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (466, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38400EAF888 AS DateTime), CAST(0x0000A38400EAF888 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (467, 0, 2, 59, N'Update profile', CAST(0x0000A38400EAFE75 AS DateTime), CAST(0x0000A38400EAFE75 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (468, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A38400EBB4F6 AS DateTime), CAST(0x0000A38400EBB4F6 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (469, 0, 1, 59, N'Created new tenant', CAST(0x0000A38400EBDEE3 AS DateTime), CAST(0x0000A38400EBDEE3 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (470, 0, 1, 59, N'Created new tenant', CAST(0x0000A38400ECD7F6 AS DateTime), CAST(0x0000A38400ECD7F6 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (471, 0, 1, 59, N'Created new tenant', CAST(0x0000A38400ED4139 AS DateTime), CAST(0x0000A38400ED4139 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (472, 0, 2, 59, N'Update setting success', CAST(0x0000A38400EDA94F AS DateTime), CAST(0x0000A38400EDA94F AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (473, 0, 1, 59, N'Created new tenant', CAST(0x0000A38400EF0D6A AS DateTime), CAST(0x0000A38400EF0D6A AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (474, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38400EF339D AS DateTime), CAST(0x0000A38400EF339D AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (475, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38400EF33BA AS DateTime), CAST(0x0000A38400EF33BA AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (476, 0, 2, 59, N'Update profile', CAST(0x0000A38400EF3630 AS DateTime), CAST(0x0000A38400EF3630 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (477, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38400F18658 AS DateTime), CAST(0x0000A38400F18658 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (478, 0, 2, 59, N'Update person contact', CAST(0x0000A38400F18665 AS DateTime), CAST(0x0000A38400F18665 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (479, 0, 1, 59, N'Created new tenant', CAST(0x0000A38400F33DA6 AS DateTime), CAST(0x0000A38400F33DA6 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (480, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38400F377D6 AS DateTime), CAST(0x0000A38400F377D6 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (481, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38400F377F1 AS DateTime), CAST(0x0000A38400F377F1 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (482, 0, 1, 59, N'Created new tenant', CAST(0x0000A38400F4C72D AS DateTime), CAST(0x0000A38400F4C72D AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (483, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38400F4CAB4 AS DateTime), CAST(0x0000A38400F4CAB4 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (484, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38400F4CAD2 AS DateTime), CAST(0x0000A38400F4CAD2 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (485, 0, 2, 59, N'Update profile', CAST(0x0000A38400F4CFEB AS DateTime), CAST(0x0000A38400F4CFEB AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (486, 0, 2, 59, N'Update plan package', CAST(0x0000A38400F54564 AS DateTime), CAST(0x0000A38400F54564 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Package', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (487, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38400F57E35 AS DateTime), CAST(0x0000A38400F57E35 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (488, 0, 2, 59, N'Update person contact', CAST(0x0000A38400F585C5 AS DateTime), CAST(0x0000A38400F585C5 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (489, 0, 2, 59, N'Update plan package', CAST(0x0000A38400F5D19C AS DateTime), CAST(0x0000A38400F5D19C AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Package', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (490, 0, 2, 59, N'Update setting success', CAST(0x0000A38400F55B18 AS DateTime), CAST(0x0000A38400F55B18 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (491, 0, 2, 59, N'Update tenant', CAST(0x0000A38400F73FDD AS DateTime), CAST(0x0000A38400F73FDD AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (492, 0, 1, 59, N'Created new tenant', CAST(0x0000A38400FB9D50 AS DateTime), CAST(0x0000A38400FB9D50 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (493, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38400FBA1A6 AS DateTime), CAST(0x0000A38400FBA1A6 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (494, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38400FBA1C9 AS DateTime), CAST(0x0000A38400FBA1C9 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (495, 0, 2, 59, N'Update profile', CAST(0x0000A38400FBA455 AS DateTime), CAST(0x0000A38400FBA455 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (496, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38400FD24DB AS DateTime), CAST(0x0000A38400FD24DB AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (497, 0, 2, 59, N'Update person contact', CAST(0x0000A38400FD24F1 AS DateTime), CAST(0x0000A38400FD24F1 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (498, 0, 2, 59, N'Update tenant', CAST(0x0000A38400FD5610 AS DateTime), CAST(0x0000A38400FD5610 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (499, 0, 2, 59, N'Update tenant', CAST(0x0000A38400FD8C77 AS DateTime), CAST(0x0000A38400FD8C77 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (500, 0, 2, 59, N'Update setting success', CAST(0x0000A38400FD7FDE AS DateTime), CAST(0x0000A38400FD7FDE AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (501, 0, 2, 59, N'Update setting success', CAST(0x0000A38400FD9252 AS DateTime), CAST(0x0000A38400FD9252 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (502, 0, 2, 59, N'Update tenant', CAST(0x0000A38400FFBBA0 AS DateTime), CAST(0x0000A38400FFBBA0 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (503, 0, 2, 59, N'Update tenant', CAST(0x0000A38400FFD385 AS DateTime), CAST(0x0000A38400FFD385 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (504, 0, 2, 59, N'Update tenant', CAST(0x0000A38401012546 AS DateTime), CAST(0x0000A38401012546 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (505, 0, 2, 59, N'Update tenant', CAST(0x0000A384010269C4 AS DateTime), CAST(0x0000A384010269C4 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (506, 0, 2, 59, N'Update tenant', CAST(0x0000A3840102EF3F AS DateTime), CAST(0x0000A3840102EF3F AS DateTime), N'Chrome', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (507, 0, 2, 59, N'Update plan package', CAST(0x0000A38401060FFE AS DateTime), CAST(0x0000A38401060FFF AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Package', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (508, 0, 2, 59, N'Update setting success', CAST(0x0000A384011377A6 AS DateTime), CAST(0x0000A384011377A6 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (509, 0, 2, 59, N'Update setting success', CAST(0x0000A384011382CE AS DateTime), CAST(0x0000A384011382CE AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (510, 0, 2, 59, N'update avatar of user success', CAST(0x0000A3840115A828 AS DateTime), CAST(0x0000A3840115A828 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (511, 0, 1, 59, N'Created new tenant', CAST(0x0000A38401187A6F AS DateTime), CAST(0x0000A38401187A6F AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (512, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38401187BBC AS DateTime), CAST(0x0000A38401187BBC AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (513, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38401187BD6 AS DateTime), CAST(0x0000A38401187BD6 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (514, 0, 2, 59, N'Update profile', CAST(0x0000A38401187BEB AS DateTime), CAST(0x0000A38401187BEB AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (515, 0, 1, 59, N'Created new tenant', CAST(0x0000A384011A1AEB AS DateTime), CAST(0x0000A384011A1AEB AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (516, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A384011A1CB8 AS DateTime), CAST(0x0000A384011A1CB8 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (517, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A384011A1CCF AS DateTime), CAST(0x0000A384011A1CCF AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (518, 0, 2, 59, N'Update profile', CAST(0x0000A384011A1CE4 AS DateTime), CAST(0x0000A384011A1CE4 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (519, 0, 1, 59, N'Created new tenant', CAST(0x0000A384011BD39F AS DateTime), CAST(0x0000A384011BD39F AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (520, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A384011BD46C AS DateTime), CAST(0x0000A384011BD46C AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (521, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A384011BD477 AS DateTime), CAST(0x0000A384011BD477 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (522, 0, 2, 59, N'Update profile', CAST(0x0000A384011BD47C AS DateTime), CAST(0x0000A384011BD47C AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (523, 0, 1, 59, N'Created new tenant', CAST(0x0000A38401205113 AS DateTime), CAST(0x0000A38401205113 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (524, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38401205474 AS DateTime), CAST(0x0000A38401205474 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (525, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A384012054AF AS DateTime), CAST(0x0000A384012054AF AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (526, 0, 2, 59, N'Update profile', CAST(0x0000A384012054C9 AS DateTime), CAST(0x0000A384012054C9 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (527, 0, 1, 59, N'Created new tenant', CAST(0x0000A3840126A2B4 AS DateTime), CAST(0x0000A3840126A2B4 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (528, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A3840126ACB5 AS DateTime), CAST(0x0000A3840126ACB5 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (529, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A3840126B249 AS DateTime), CAST(0x0000A3840126B249 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (530, 0, 2, 59, N'Update profile', CAST(0x0000A3840126B563 AS DateTime), CAST(0x0000A3840126B563 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (531, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38401273BFF AS DateTime), CAST(0x0000A38401273BFF AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (532, 0, 2, 59, N'Update person contact', CAST(0x0000A38401274810 AS DateTime), CAST(0x0000A38401274810 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (533, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A3840127CD8A AS DateTime), CAST(0x0000A3840127CD8A AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (534, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A384012873B1 AS DateTime), CAST(0x0000A384012873B1 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (535, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38401294922 AS DateTime), CAST(0x0000A38401294922 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (536, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A384012B41B1 AS DateTime), CAST(0x0000A384012B41B1 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (537, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38500AFFCCD AS DateTime), CAST(0x0000A38500AFFCCD AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (538, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38500B0569B AS DateTime), CAST(0x0000A38500B0569B AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (539, 0, 2, 59, N'Update setting success', CAST(0x0000A38500B7E833 AS DateTime), CAST(0x0000A38500B7E833 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (540, 0, 2, 59, N'Update setting success', CAST(0x0000A38500B7F744 AS DateTime), CAST(0x0000A38500B7F744 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (541, 0, 2, 59, N'Update setting success', CAST(0x0000A38500B97D53 AS DateTime), CAST(0x0000A38500B97D53 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (542, 0, 2, 59, N'Update setting success', CAST(0x0000A38500B99DAE AS DateTime), CAST(0x0000A38500B99DAE AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (543, 0, 2, 59, N'Update setting success', CAST(0x0000A38500BAAE42 AS DateTime), CAST(0x0000A38500BAAE42 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (544, 0, 2, 59, N'Update setting success', CAST(0x0000A38500BBFA03 AS DateTime), CAST(0x0000A38500BBFA03 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (545, 0, 2, 59, N'Update setting success', CAST(0x0000A38500BBFF5D AS DateTime), CAST(0x0000A38500BBFF5D AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (546, 0, 2, 59, N'Update setting success', CAST(0x0000A38500BC0C41 AS DateTime), CAST(0x0000A38500BC0C41 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
GO
print 'Processed 500 total records'
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (547, 0, 2, 59, N'Update setting success', CAST(0x0000A38500C826B4 AS DateTime), CAST(0x0000A38500C826B4 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (548, 0, 2, 59, N'Update setting success', CAST(0x0000A38500C8330D AS DateTime), CAST(0x0000A38500C8330D AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (549, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38500D6553A AS DateTime), CAST(0x0000A38500D6553A AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (550, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38500DCF713 AS DateTime), CAST(0x0000A38500DCF713 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (551, 0, 2, 59, N'Update person contact', CAST(0x0000A38500DCF72C AS DateTime), CAST(0x0000A38500DCF72C AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (552, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38500DD102B AS DateTime), CAST(0x0000A38500DD102B AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (553, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38500DD4103 AS DateTime), CAST(0x0000A38500DD4103 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (554, 0, 2, 59, N'Update person contact', CAST(0x0000A38500DD410C AS DateTime), CAST(0x0000A38500DD410C AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (555, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38500DDEB92 AS DateTime), CAST(0x0000A38500DDEB92 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (556, 0, 2, 59, N'Update person contact', CAST(0x0000A38500DDEB98 AS DateTime), CAST(0x0000A38500DDEB98 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (557, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38500DEA6F1 AS DateTime), CAST(0x0000A38500DEA6F1 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (558, 0, 2, 59, N'update user success:', CAST(0x0000A38500EB699D AS DateTime), CAST(0x0000A38500EB699D AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (559, 0, 2, 59, N'update user success:', CAST(0x0000A38500ED23BD AS DateTime), CAST(0x0000A38500ED23BD AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (560, 0, 2, 59, N'Update setting success', CAST(0x0000A38500F999DC AS DateTime), CAST(0x0000A38500F999DC AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (561, 0, 2, 59, N'Update setting success', CAST(0x0000A38500F9A2AC AS DateTime), CAST(0x0000A38500F9A2AC AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (562, 0, 2, 59, N'Update setting success', CAST(0x0000A38500F9BD6D AS DateTime), CAST(0x0000A38500F9BD6D AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (563, 0, 2, 59, N'Update setting success', CAST(0x0000A38500F9FD5C AS DateTime), CAST(0x0000A38500F9FD5C AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (564, 0, 2, 59, N'Update setting success', CAST(0x0000A38500FA7EC5 AS DateTime), CAST(0x0000A38500FA7EC5 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (565, 0, 2, 59, N'Update setting success', CAST(0x0000A38500FB6ACE AS DateTime), CAST(0x0000A38500FB6ACE AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (566, 0, 2, 59, N'Update setting success', CAST(0x0000A38500FB81C3 AS DateTime), CAST(0x0000A38500FB81C3 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (567, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38501083CE3 AS DateTime), CAST(0x0000A38501083CE3 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (568, 0, 1, 59, N'Created new tenant', CAST(0x0000A385010A58E9 AS DateTime), CAST(0x0000A385010A58E9 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (569, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A385010A5A7D AS DateTime), CAST(0x0000A385010A5A7D AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (570, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A385010A5A98 AS DateTime), CAST(0x0000A385010A5A98 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (571, 0, 2, 59, N'Update profile', CAST(0x0000A385010A5AA9 AS DateTime), CAST(0x0000A385010A5AA9 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (572, 0, 2, 59, N'Update setting success', CAST(0x0000A3850115E117 AS DateTime), CAST(0x0000A3850115E117 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (573, 0, 2, 59, N'Update setting success', CAST(0x0000A3850115EE6B AS DateTime), CAST(0x0000A3850115EE6B AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (574, 0, 2, 59, N'Update setting success', CAST(0x0000A385011623C5 AS DateTime), CAST(0x0000A385011623C5 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (577, 0, 1, 59, N'Created new tenant', CAST(0x0000A385011CD022 AS DateTime), CAST(0x0000A385011CD022 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (578, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A385011CDF9B AS DateTime), CAST(0x0000A385011CDF9B AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (579, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A385011CDFBC AS DateTime), CAST(0x0000A385011CDFBC AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (580, 0, 2, 59, N'Update profile', CAST(0x0000A385011CDFD6 AS DateTime), CAST(0x0000A385011CDFD6 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (581, 0, 2, 59, N'Update setting success', CAST(0x0000A385011F85B2 AS DateTime), CAST(0x0000A385011F85B2 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (582, 0, 2, 59, N'Update setting success', CAST(0x0000A3850128E55B AS DateTime), CAST(0x0000A3850128E55B AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (583, 0, 2, 59, N'Update setting success', CAST(0x0000A38501291DEE AS DateTime), CAST(0x0000A38501291DEE AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (584, 0, 2, 59, N'Update setting success', CAST(0x0000A385012BF6DA AS DateTime), CAST(0x0000A385012BF6DA AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (585, 0, 2, 59, N'Update setting success', CAST(0x0000A385012BFEEB AS DateTime), CAST(0x0000A385012BFEEB AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (586, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38600917C42 AS DateTime), CAST(0x0000A38600917C42 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (587, 0, 2, 59, N'Update person contact', CAST(0x0000A38600917C57 AS DateTime), CAST(0x0000A38600917C57 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (588, 0, 2, 59, N'Update setting success', CAST(0x0000A3860091DC56 AS DateTime), CAST(0x0000A3860091DC56 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (589, 0, 2, 59, N'Update setting success', CAST(0x0000A386009239F6 AS DateTime), CAST(0x0000A386009239F6 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (590, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A386009285AE AS DateTime), CAST(0x0000A386009285AE AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (591, 0, 2, 59, N'Update setting success', CAST(0x0000A38600A038E6 AS DateTime), CAST(0x0000A38600A038E6 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (592, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38600A69432 AS DateTime), CAST(0x0000A38600A69432 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (593, 0, 2, 59, N'Update setting success', CAST(0x0000A38600AECC5A AS DateTime), CAST(0x0000A38600AECC5A AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (594, 0, 2, 59, N'Update setting success', CAST(0x0000A38600B08B38 AS DateTime), CAST(0x0000A38600B08B38 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (595, 0, 1, 59, N'Created new tenant', CAST(0x0000A38600B6C464 AS DateTime), CAST(0x0000A38600B6C464 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (596, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38600B6C82B AS DateTime), CAST(0x0000A38600B6C82B AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (597, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38600B6C87E AS DateTime), CAST(0x0000A38600B6C87E AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (598, 0, 2, 59, N'Update profile', CAST(0x0000A38600B6C89E AS DateTime), CAST(0x0000A38600B6C89E AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (599, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38600B79196 AS DateTime), CAST(0x0000A38600B79196 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (600, 0, 2, 59, N'Update person contact', CAST(0x0000A38600B7919B AS DateTime), CAST(0x0000A38600B7919B AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (601, 0, 2, 59, N'Update tenant', CAST(0x0000A38600B7D1A9 AS DateTime), CAST(0x0000A38600B7D1A9 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (602, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38600B7ED8F AS DateTime), CAST(0x0000A38600B7ED8F AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (603, 0, 2, 59, N'Update setting success', CAST(0x0000A38600BA177C AS DateTime), CAST(0x0000A38600BA177C AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (604, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38600BB46D3 AS DateTime), CAST(0x0000A38600BB46D3 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (605, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38600BBBB17 AS DateTime), CAST(0x0000A38600BBBB17 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (606, 0, 2, 59, N'Update setting success', CAST(0x0000A38600BBFEEF AS DateTime), CAST(0x0000A38600BBFEEF AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (607, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38600BC0A2F AS DateTime), CAST(0x0000A38600BC0A2F AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (608, 0, 2, 59, N'Update setting success', CAST(0x0000A38600BCCA13 AS DateTime), CAST(0x0000A38600BCCA13 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (609, 0, 2, 59, N'Update setting success', CAST(0x0000A38600BCF9CD AS DateTime), CAST(0x0000A38600BCF9CD AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (610, 0, 2, 59, N'Update setting success', CAST(0x0000A38600BED105 AS DateTime), CAST(0x0000A38600BED105 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (611, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38600CC1D10 AS DateTime), CAST(0x0000A38600CC1D10 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (612, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38600DDBF01 AS DateTime), CAST(0x0000A38600DDBF01 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (613, 0, 2, 59, N'Update setting success', CAST(0x0000A38600E0C2EE AS DateTime), CAST(0x0000A38600E0C2EE AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (614, 0, 2, 59, N'Update setting success', CAST(0x0000A38600E0D7BF AS DateTime), CAST(0x0000A38600E0D7BF AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (615, 0, 2, 59, N'Update setting success', CAST(0x0000A38600E6C596 AS DateTime), CAST(0x0000A38600E6C596 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (616, 0, 2, 59, N'Update setting success', CAST(0x0000A38600E6CB37 AS DateTime), CAST(0x0000A38600E6CB37 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (617, 0, 2, 59, N'Update setting success', CAST(0x0000A38600F4B6EC AS DateTime), CAST(0x0000A38600F4B6EC AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (618, 0, 2, 59, N'Update setting success', CAST(0x0000A38600F4E7F7 AS DateTime), CAST(0x0000A38600F4E7F7 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (619, 0, 2, 59, N'Update setting success', CAST(0x0000A38600F5A947 AS DateTime), CAST(0x0000A38600F5A947 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (620, 0, 2, 59, N'Update setting success', CAST(0x0000A38600F5B15C AS DateTime), CAST(0x0000A38600F5B15C AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (621, 0, 2, 59, N'Update setting success', CAST(0x0000A38600F6F98C AS DateTime), CAST(0x0000A38600F6F98C AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (622, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38600FAF5A4 AS DateTime), CAST(0x0000A38600FAF5A4 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (623, 0, 2, 59, N'Update person contact', CAST(0x0000A38600FAF5C8 AS DateTime), CAST(0x0000A38600FAF5C8 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (624, 0, 1, 59, N'Created new tenant', CAST(0x0000A3860101D77A AS DateTime), CAST(0x0000A3860101D77B AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (625, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A3860101DA90 AS DateTime), CAST(0x0000A3860101DA90 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (626, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A3860101DBA9 AS DateTime), CAST(0x0000A3860101DBA9 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (627, 0, 1, 59, N'Insert user tenant admin', CAST(0x0000A3860101DC14 AS DateTime), CAST(0x0000A3860101DC14 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (628, 0, 1, 59, N'Created new tenant', CAST(0x0000A38601032E06 AS DateTime), CAST(0x0000A38601032E06 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (629, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38601032F79 AS DateTime), CAST(0x0000A38601032F79 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (630, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38601032FA1 AS DateTime), CAST(0x0000A38601032FA1 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (631, 0, 2, 59, N'Update profile', CAST(0x0000A3860103300F AS DateTime), CAST(0x0000A3860103300F AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (632, 0, 2, 59, N'Update setting success', CAST(0x0000A3860110AB52 AS DateTime), CAST(0x0000A3860110AB52 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (633, 0, 2, 59, N'Update setting success', CAST(0x0000A3860110D18D AS DateTime), CAST(0x0000A3860110D18D AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (634, 0, 2, 59, N'update user success:', CAST(0x0000A3860110F9AE AS DateTime), CAST(0x0000A3860110F9AE AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (635, 0, 1, 59, N'Created new tenant', CAST(0x0000A3860123CEDA AS DateTime), CAST(0x0000A3860123CEDA AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (636, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A3860123D06A AS DateTime), CAST(0x0000A3860123D06A AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (637, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A3860123D0B5 AS DateTime), CAST(0x0000A3860123D0B5 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (638, 0, 2, 59, N'Update profile', CAST(0x0000A3860123D0CA AS DateTime), CAST(0x0000A3860123D0CA AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (639, 0, 2, 59, N'Update setting success', CAST(0x0000A3860123400D AS DateTime), CAST(0x0000A3860123400D AS DateTime), N'Chrome', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (640, 0, 2, 59, N'Update setting success', CAST(0x0000A3860123852C AS DateTime), CAST(0x0000A3860123852C AS DateTime), N'Chrome', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (641, 0, 1, 59, N'Created new tenant', CAST(0x0000A3860129D464 AS DateTime), CAST(0x0000A3860129D464 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (642, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A3860129D653 AS DateTime), CAST(0x0000A3860129D653 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (643, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A3860129D68A AS DateTime), CAST(0x0000A3860129D68A AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (644, 0, 2, 59, N'Update profile', CAST(0x0000A3860129D6A0 AS DateTime), CAST(0x0000A3860129D6A0 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (645, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A386012A2B9A AS DateTime), CAST(0x0000A386012A2B9A AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (646, 0, 1, 59, N'Created new tenant', CAST(0x0000A387009B5014 AS DateTime), CAST(0x0000A387009B5014 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (647, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A387009B515E AS DateTime), CAST(0x0000A387009B515E AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (648, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A387009B516F AS DateTime), CAST(0x0000A387009B516F AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (649, 0, 2, 59, N'Update profile', CAST(0x0000A387009B5178 AS DateTime), CAST(0x0000A387009B5178 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Setting', 1)
GO
print 'Processed 600 total records'
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (650, 0, 2, 59, N'Update setting success', CAST(0x0000A387009C66FA AS DateTime), CAST(0x0000A387009C66FA AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (651, 0, 2, 59, N'Update setting success', CAST(0x0000A38700A88892 AS DateTime), CAST(0x0000A38700A88892 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (652, 0, 1, 59, N'Created new tenant', CAST(0x0000A38700AC0ABA AS DateTime), CAST(0x0000A38700AC0ABA AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (653, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38700AC3A3B AS DateTime), CAST(0x0000A38700AC3A3B AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (654, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38700AC3A64 AS DateTime), CAST(0x0000A38700AC3A64 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (655, 0, 2, 59, N'Update profile', CAST(0x0000A38700AC3A78 AS DateTime), CAST(0x0000A38700AC3A78 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (656, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38700AD8D5E AS DateTime), CAST(0x0000A38700AD8D5E AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (657, 0, 2, 59, N'Update person contact', CAST(0x0000A38700AD95A5 AS DateTime), CAST(0x0000A38700AD95A5 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (658, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38700B6DD31 AS DateTime), CAST(0x0000A38700B6DD31 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (659, 0, 2, 59, N'Update setting success', CAST(0x0000A38700BA1453 AS DateTime), CAST(0x0000A38700BA1453 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (660, 0, 1, 59, N'Created new tenant', CAST(0x0000A38700DD600C AS DateTime), CAST(0x0000A38700DD600C AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (661, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38700DD6230 AS DateTime), CAST(0x0000A38700DD6230 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (662, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38700DD6250 AS DateTime), CAST(0x0000A38700DD6250 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (663, 0, 2, 59, N'Update profile', CAST(0x0000A38700DD6261 AS DateTime), CAST(0x0000A38700DD6261 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (664, 0, 2, 59, N'Update access right', CAST(0x0000A38700E5DA82 AS DateTime), CAST(0x0000A38700E5DA82 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (665, 0, 2, 3, N'Update profiles tenant', CAST(0x0000A38700EC8E0F AS DateTime), CAST(0x0000A38700EC8E0F AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (666, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38701018938 AS DateTime), CAST(0x0000A38701018938 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (667, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38701050782 AS DateTime), CAST(0x0000A38701050782 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (668, 0, 2, 59, N'Update tenant', CAST(0x0000A38701052651 AS DateTime), CAST(0x0000A38701052651 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (669, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A3870108C7E9 AS DateTime), CAST(0x0000A3870108C7E9 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (670, 0, 2, 59, N'Update tenant', CAST(0x0000A3870109B085 AS DateTime), CAST(0x0000A3870109B085 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (671, 0, 2, 59, N'Update tenant', CAST(0x0000A3870109B749 AS DateTime), CAST(0x0000A3870109B749 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (672, 0, 1, 59, N'Created new tenant', CAST(0x0000A387010D9383 AS DateTime), CAST(0x0000A387010D9383 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (673, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A387010D9515 AS DateTime), CAST(0x0000A387010D9515 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (674, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A387010D954E AS DateTime), CAST(0x0000A387010D954E AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (675, 0, 2, 59, N'Update profile', CAST(0x0000A387010D955C AS DateTime), CAST(0x0000A387010D955C AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (676, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A387010E889F AS DateTime), CAST(0x0000A387010E889F AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (677, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38701117DE6 AS DateTime), CAST(0x0000A38701117DE7 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (678, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A387011A8CE9 AS DateTime), CAST(0x0000A387011A8CE9 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (679, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A387011AEFA9 AS DateTime), CAST(0x0000A387011AEFA9 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (680, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A387012BFE40 AS DateTime), CAST(0x0000A387012BFE40 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (681, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38800934D72 AS DateTime), CAST(0x0000A38800934D72 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (682, 0, 2, 59, N'Update setting success', CAST(0x0000A38800A71345 AS DateTime), CAST(0x0000A38800A71345 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (683, 0, 2, 59, N'Update setting success', CAST(0x0000A38800A725BF AS DateTime), CAST(0x0000A38800A725BF AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (684, 0, 2, 59, N'Update setting success', CAST(0x0000A38800AC7E84 AS DateTime), CAST(0x0000A38800AC7E84 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (685, 0, 2, 59, N'Update setting success', CAST(0x0000A38800ADDF8A AS DateTime), CAST(0x0000A38800ADDF8A AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (686, 0, 1, 59, N'Created new tenant', CAST(0x0000A38800B0F112 AS DateTime), CAST(0x0000A38800B0F112 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (687, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38800B0F2A1 AS DateTime), CAST(0x0000A38800B0F2A1 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (688, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38800B0F2D4 AS DateTime), CAST(0x0000A38800B0F2D4 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (689, 0, 2, 59, N'Update profile', CAST(0x0000A38800B0F2EB AS DateTime), CAST(0x0000A38800B0F2EB AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (690, 0, 2, 59, N'Update setting success', CAST(0x0000A38800B3DC9C AS DateTime), CAST(0x0000A38800B3DC9C AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (691, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38800B5BD8E AS DateTime), CAST(0x0000A38800B5BD8E AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (692, 0, 2, 59, N'Update setting success', CAST(0x0000A38800DAD18D AS DateTime), CAST(0x0000A38800DAD18D AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (693, 0, 2, 59, N'Update setting success', CAST(0x0000A38800DC442C AS DateTime), CAST(0x0000A38800DC442C AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (694, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38800EFFEE9 AS DateTime), CAST(0x0000A38800EFFEE9 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (695, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38800F02233 AS DateTime), CAST(0x0000A38800F02233 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (696, 0, 2, 59, N'Update setting success', CAST(0x0000A38800F679D9 AS DateTime), CAST(0x0000A38800F679D9 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (697, 0, 2, 59, N'Update setting success', CAST(0x0000A38800F8CB77 AS DateTime), CAST(0x0000A38800F8CB77 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (698, 0, 2, 59, N'Update setting success', CAST(0x0000A38800F942D1 AS DateTime), CAST(0x0000A38800F942D1 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (699, 0, 2, 59, N'Update setting success', CAST(0x0000A38800F94A2A AS DateTime), CAST(0x0000A38800F94A2A AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (700, 0, 2, 59, N'Update setting success', CAST(0x0000A38800F95A94 AS DateTime), CAST(0x0000A38800F95A94 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (701, 0, 2, 59, N'Update setting success', CAST(0x0000A38800F999DE AS DateTime), CAST(0x0000A38800F999DE AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (702, 0, 2, 59, N'Update setting success', CAST(0x0000A38800F9AC22 AS DateTime), CAST(0x0000A38800F9AC22 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (703, 0, 2, 59, N'Update setting success', CAST(0x0000A38800F9B98E AS DateTime), CAST(0x0000A38800F9B98E AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (704, 0, 2, 59, N'Update setting success', CAST(0x0000A38800FC66B3 AS DateTime), CAST(0x0000A38800FC66B3 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (705, 0, 2, 59, N'Update setting success', CAST(0x0000A38800FE1D8B AS DateTime), CAST(0x0000A38800FE1D8B AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (706, 0, 2, 59, N'Update setting success', CAST(0x0000A38800FE29D2 AS DateTime), CAST(0x0000A38800FE29D2 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (707, 0, 2, 59, N'Update access right', CAST(0x0000A38801048ADC AS DateTime), CAST(0x0000A38801048ADC AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (708, 0, 2, 59, N'Update setting success', CAST(0x0000A38801248F3A AS DateTime), CAST(0x0000A38801248F3A AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (709, 0, 2, 59, N'Update setting success', CAST(0x0000A388012777CE AS DateTime), CAST(0x0000A388012777CE AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (710, 0, 2, 59, N'Update setting success', CAST(0x0000A38B009B9A20 AS DateTime), CAST(0x0000A38B009B9A20 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (711, 0, 1, 59, N'Created new tenant', CAST(0x0000A38B00E591F9 AS DateTime), CAST(0x0000A38B00E591F9 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (712, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38B00E593BD AS DateTime), CAST(0x0000A38B00E593BD AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (713, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38B00E593F1 AS DateTime), CAST(0x0000A38B00E593F1 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (714, 0, 2, 59, N'Update profile', CAST(0x0000A38B00E59400 AS DateTime), CAST(0x0000A38B00E59400 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (715, 0, 1, 59, N'Created new tenant', CAST(0x0000A38B00E7A448 AS DateTime), CAST(0x0000A38B00E7A448 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (716, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38B00E7A583 AS DateTime), CAST(0x0000A38B00E7A583 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (717, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38B00E7A58F AS DateTime), CAST(0x0000A38B00E7A58F AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (718, 0, 2, 59, N'Update profile', CAST(0x0000A38B00E7A597 AS DateTime), CAST(0x0000A38B00E7A597 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (719, 0, 2, 59, N'Update setting success', CAST(0x0000A38B00EB609B AS DateTime), CAST(0x0000A38B00EB609B AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (720, 0, 2, 59, N'Update setting success', CAST(0x0000A38B00EB8422 AS DateTime), CAST(0x0000A38B00EB8422 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (721, 0, 1, 59, N'Created new tenant', CAST(0x0000A38B0104A9DC AS DateTime), CAST(0x0000A38B0104A9DC AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (722, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38B0104ABF0 AS DateTime), CAST(0x0000A38B0104ABF0 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (723, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38B0104AC09 AS DateTime), CAST(0x0000A38B0104AC09 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (724, 0, 2, 59, N'Update profile', CAST(0x0000A38B0104AC18 AS DateTime), CAST(0x0000A38B0104AC18 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (725, 0, 1, 59, N'Created new tenant', CAST(0x0000A38B010C5F1C AS DateTime), CAST(0x0000A38B010C5F1C AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (726, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38B010C6119 AS DateTime), CAST(0x0000A38B010C6119 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (727, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38B010C612A AS DateTime), CAST(0x0000A38B010C612A AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (728, 0, 2, 59, N'Update profile', CAST(0x0000A38B010C612F AS DateTime), CAST(0x0000A38B010C612F AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (729, 0, 1, 59, N'Created new tenant', CAST(0x0000A38B01150C8F AS DateTime), CAST(0x0000A38B01150C8F AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (730, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38B01150E97 AS DateTime), CAST(0x0000A38B01150E97 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (731, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38B01150EB3 AS DateTime), CAST(0x0000A38B01150EB3 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (732, 0, 2, 59, N'Update profile', CAST(0x0000A38B01150EC1 AS DateTime), CAST(0x0000A38B01150EC1 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (733, 0, 2, 59, N'update user success:', CAST(0x0000A38C00A5A3F1 AS DateTime), CAST(0x0000A38C00A5A3F1 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (734, 0, 2, 59, N'update user success:', CAST(0x0000A38C00A5B597 AS DateTime), CAST(0x0000A38C00A5B597 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (735, 0, 2, 59, N'update user success:', CAST(0x0000A38C00A6CDE6 AS DateTime), CAST(0x0000A38C00A6CDE6 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (736, 0, 2, 59, N'update user success:', CAST(0x0000A38C00A6D994 AS DateTime), CAST(0x0000A38C00A6D994 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (737, 0, 1, 59, N'Created new tenant', CAST(0x0000A38C00A88E26 AS DateTime), CAST(0x0000A38C00A88E26 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (738, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38C00A88FEB AS DateTime), CAST(0x0000A38C00A88FEB AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (739, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38C00A88FFD AS DateTime), CAST(0x0000A38C00A88FFD AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (740, 0, 2, 59, N'Update profile', CAST(0x0000A38C00A89009 AS DateTime), CAST(0x0000A38C00A89009 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (741, 0, 2, 59, N'update user success:', CAST(0x0000A38C00A8E202 AS DateTime), CAST(0x0000A38C00A8E202 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (742, 0, 2, 59, N'update user success:', CAST(0x0000A38C00A8E7CC AS DateTime), CAST(0x0000A38C00A8E7CC AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (743, 0, 2, 59, N'update user success:', CAST(0x0000A38C00A94FF7 AS DateTime), CAST(0x0000A38C00A94FF7 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (744, 0, 2, 59, N'update user success:', CAST(0x0000A38C00AACDD2 AS DateTime), CAST(0x0000A38C00AACDD2 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (745, 0, 2, 59, N'update user success:', CAST(0x0000A38C00AAF76D AS DateTime), CAST(0x0000A38C00AAF76D AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (746, 10139, 1, 1, N'Create contact', CAST(0x0000A38C00ABC179 AS DateTime), CAST(0x0000A38C00ABC179 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (747, 0, 2, 59, N'update user success:', CAST(0x0000A38C00AF6BE0 AS DateTime), CAST(0x0000A38C00AF6BE0 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (748, 0, 2, 59, N'update user success:', CAST(0x0000A38C00AF83A3 AS DateTime), CAST(0x0000A38C00AF83A3 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (749, 10139, 2, 1, N'Edit contact', CAST(0x0000A38C00B5C720 AS DateTime), CAST(0x0000A38C00B5C720 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (750, 10139, 1, 1, N'Create contact', CAST(0x0000A38C00B6284B AS DateTime), CAST(0x0000A38C00B6284B AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
GO
print 'Processed 700 total records'
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (751, 10139, 1, 1, N'Create contact', CAST(0x0000A38C00B735B6 AS DateTime), CAST(0x0000A38C00B735B6 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (752, 10139, 1, 1, N'Create contact', CAST(0x0000A38C00B96582 AS DateTime), CAST(0x0000A38C00B96582 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (753, 10139, 1, 1, N'Create contact', CAST(0x0000A38C00BA5759 AS DateTime), CAST(0x0000A38C00BA5759 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (754, 10139, 3, 1, N'Delete contact', CAST(0x0000A38C00BBD1B6 AS DateTime), CAST(0x0000A38C00BBD1B6 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (755, 10139, 3, 1, N'Delete contact', CAST(0x0000A38C00BBE45A AS DateTime), CAST(0x0000A38C00BBE45A AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (756, 10139, 3, 1, N'Delete contact', CAST(0x0000A38C00BBECD4 AS DateTime), CAST(0x0000A38C00BBECD4 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (757, 10139, 1, 1, N'Create contact', CAST(0x0000A38C00BCF918 AS DateTime), CAST(0x0000A38C00BCF918 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (758, 10139, 2, 1, N'Edit contact', CAST(0x0000A38C00BD1D73 AS DateTime), CAST(0x0000A38C00BD1D73 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (759, 0, 2, 59, N'Update setting success', CAST(0x0000A38C00DCAE7B AS DateTime), CAST(0x0000A38C00DCAE7B AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (760, 0, 1, 59, N'Created new tenant', CAST(0x0000A38C00E1E009 AS DateTime), CAST(0x0000A38C00E1E009 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (761, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38C00E1E2D0 AS DateTime), CAST(0x0000A38C00E1E2D0 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (762, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38C00E1E2E9 AS DateTime), CAST(0x0000A38C00E1E2E9 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (763, 0, 2, 59, N'Update profile', CAST(0x0000A38C00E1E314 AS DateTime), CAST(0x0000A38C00E1E314 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (764, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38C00E4E501 AS DateTime), CAST(0x0000A38C00E4E501 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (765, 0, 2, 59, N'Update setting success', CAST(0x0000A38C00E8CADE AS DateTime), CAST(0x0000A38C00E8CADE AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (766, 0, 2, 59, N'Update setting success', CAST(0x0000A38C00EE2D28 AS DateTime), CAST(0x0000A38C00EE2D28 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (767, 0, 1, 59, N'Created new tenant', CAST(0x0000A38C00F932EC AS DateTime), CAST(0x0000A38C00F932EC AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (768, 0, 2, 59, N'Assigned user for tenant', CAST(0x0000A38C00F936CF AS DateTime), CAST(0x0000A38C00F936CF AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (769, 0, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38C00F9373F AS DateTime), CAST(0x0000A38C00F9373F AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (770, 0, 2, 59, N'Update profile', CAST(0x0000A38C00F93751 AS DateTime), CAST(0x0000A38C00F93751 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (771, 0, 2, 59, N'update user success:', CAST(0x0000A38C00FE51A7 AS DateTime), CAST(0x0000A38C00FE51A7 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (772, 0, 2, 59, N'Update setting success', CAST(0x0000A38C0100FB63 AS DateTime), CAST(0x0000A38C0100FB63 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (773, 0, 2, 59, N'Update setting success', CAST(0x0000A38C0110BF8F AS DateTime), CAST(0x0000A38C0110BF8F AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (774, 0, 2, 59, N'Update setting success', CAST(0x0000A38C0110F5C0 AS DateTime), CAST(0x0000A38C0110F5C0 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (775, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38C0110E4BC AS DateTime), CAST(0x0000A38C0110E4BC AS DateTime), N'Chrome', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (776, 0, 2, 59, N'Update setting success', CAST(0x0000A38C01140BBE AS DateTime), CAST(0x0000A38C01140BBE AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (777, 0, 2, 59, N'Update setting success', CAST(0x0000A38C0118A2F4 AS DateTime), CAST(0x0000A38C0118A2F4 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (778, 0, 2, 59, N'Update setting success', CAST(0x0000A38C0118B4C9 AS DateTime), CAST(0x0000A38C0118B4C9 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (779, 10162, 2, 59, N'Update profiles tenant', CAST(0x0000A38C011EDEB9 AS DateTime), CAST(0x0000A38C011EDEB9 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (780, 0, 2, 59, N'Update setting success', CAST(0x0000A38C011F2679 AS DateTime), CAST(0x0000A38C011F267A AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (781, 0, 2, 59, N'Update setting success', CAST(0x0000A38C011F2B69 AS DateTime), CAST(0x0000A38C011F2B69 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (782, 0, 2, 59, N'Update setting success', CAST(0x0000A38C0122708F AS DateTime), CAST(0x0000A38C0122708F AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (783, 10162, 2, 59, N'Update profiles tenant', CAST(0x0000A38C0124A7AB AS DateTime), CAST(0x0000A38C0124A7AB AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (784, 0, 2, 59, N'Update profiles tenant', CAST(0x0000A38C01266474 AS DateTime), CAST(0x0000A38C01266474 AS DateTime), N'Chrome', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (785, 0, 2, 59, N'Update setting success', CAST(0x0000A38C01298C77 AS DateTime), CAST(0x0000A38C01298C77 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (786, 0, 2, 59, N'Update setting success', CAST(0x0000A38D009703E1 AS DateTime), CAST(0x0000A38D009703E1 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (787, 0, 1, 59, N'Insert new user success', CAST(0x0000A38D009B21FE AS DateTime), CAST(0x0000A38D009B21FE AS DateTime), N'Firefox', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (788, 10136, 1, 1, N'Insert new customer', CAST(0x0000A38D00A67B34 AS DateTime), CAST(0x0000A38D00A67B35 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (789, 0, 2, 59, N'Update setting success', CAST(0x0000A38D00A6B10A AS DateTime), CAST(0x0000A38D00A6B10A AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (790, 0, 1, 59, N'Insert new user success', CAST(0x0000A38D00A74DEC AS DateTime), CAST(0x0000A38D00A74DEC AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (791, 0, 2, 59, N'update user success:', CAST(0x0000A38D00A81D61 AS DateTime), CAST(0x0000A38D00A81D61 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (792, 0, 3, 59, N'Delete user success.', CAST(0x0000A38D00A833A1 AS DateTime), CAST(0x0000A38D00A833A1 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (793, 0, 3, 59, N'Delete user success.', CAST(0x0000A38D00A84CDB AS DateTime), CAST(0x0000A38D00A84CDB AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (795, 0, 1, 59, N'Insert new user success', CAST(0x0000A38D00AE10F8 AS DateTime), CAST(0x0000A38D00AE10F8 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (796, 0, 3, 59, N'Delete user success.', CAST(0x0000A38D00AE1DD2 AS DateTime), CAST(0x0000A38D00AE1DD2 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (797, 0, 1, 59, N'Insert new user success', CAST(0x0000A38D00AE7716 AS DateTime), CAST(0x0000A38D00AE7716 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (798, 0, 3, 59, N'Delete user success.', CAST(0x0000A38D00AE8004 AS DateTime), CAST(0x0000A38D00AE8004 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (799, 0, 1, 59, N'Insert new user success', CAST(0x0000A38D00AF6986 AS DateTime), CAST(0x0000A38D00AF6986 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (800, 0, 3, 59, N'Delete user success.', CAST(0x0000A38D00AF767D AS DateTime), CAST(0x0000A38D00AF767D AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (801, 0, 1, 59, N'Insert new user success', CAST(0x0000A38D00AFB92F AS DateTime), CAST(0x0000A38D00AFB92F AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (802, 0, 3, 59, N'Delete user success.', CAST(0x0000A38D00B04394 AS DateTime), CAST(0x0000A38D00B04394 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (803, 0, 2, 59, N'Update setting success', CAST(0x0000A38D00C70BC5 AS DateTime), CAST(0x0000A38D00C70BC5 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (804, 0, 2, 59, N'Update setting success', CAST(0x0000A38D00C72656 AS DateTime), CAST(0x0000A38D00C72656 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (805, 0, 2, 59, N'Update setting success', CAST(0x0000A38D00C732F5 AS DateTime), CAST(0x0000A38D00C732F5 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (806, 0, 2, 59, N'Update setting success', CAST(0x0000A38D00C8BCBE AS DateTime), CAST(0x0000A38D00C8BCBE AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (807, 0, 2, 59, N'Update setting success', CAST(0x0000A38D00C9114C AS DateTime), CAST(0x0000A38D00C9114C AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (808, 0, 2, 59, N'Update setting success', CAST(0x0000A38D00CA14FE AS DateTime), CAST(0x0000A38D00CA14FE AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (809, 0, 2, 59, N'Update setting success', CAST(0x0000A38D00CA2BC6 AS DateTime), CAST(0x0000A38D00CA2BC6 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (810, 0, 2, 59, N'Update setting success', CAST(0x0000A38D00CA3EBB AS DateTime), CAST(0x0000A38D00CA3EBB AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (811, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00D67C4A AS DateTime), CAST(0x0000A38D00D67C4A AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (812, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00D6913F AS DateTime), CAST(0x0000A38D00D6913F AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (813, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00D7CBA1 AS DateTime), CAST(0x0000A38D00D7CBA1 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (814, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00D7D7C3 AS DateTime), CAST(0x0000A38D00D7D7C3 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (815, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00DC1D34 AS DateTime), CAST(0x0000A38D00DC1D34 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (816, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00DC1D71 AS DateTime), CAST(0x0000A38D00DC1D71 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (817, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00DCEEC5 AS DateTime), CAST(0x0000A38D00DCEEC5 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (818, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00DD0738 AS DateTime), CAST(0x0000A38D00DD0738 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (819, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00DDF9B7 AS DateTime), CAST(0x0000A38D00DDF9B7 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (820, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00DDF9EF AS DateTime), CAST(0x0000A38D00DDF9EF AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (821, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00DE9273 AS DateTime), CAST(0x0000A38D00DE9273 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (822, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00DE9308 AS DateTime), CAST(0x0000A38D00DE9308 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (823, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00DE9EF5 AS DateTime), CAST(0x0000A38D00DE9EF5 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (824, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00DE9F8D AS DateTime), CAST(0x0000A38D00DE9F8D AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (825, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E14B65 AS DateTime), CAST(0x0000A38D00E14B65 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (826, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E14C0C AS DateTime), CAST(0x0000A38D00E14C0C AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (827, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E151B2 AS DateTime), CAST(0x0000A38D00E151B2 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (828, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E1524C AS DateTime), CAST(0x0000A38D00E1524C AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (829, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E17F5E AS DateTime), CAST(0x0000A38D00E17F5E AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (830, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E17FFB AS DateTime), CAST(0x0000A38D00E17FFB AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (831, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E1A98D AS DateTime), CAST(0x0000A38D00E1A98D AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (832, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E1AA23 AS DateTime), CAST(0x0000A38D00E1AA23 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (833, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E20D93 AS DateTime), CAST(0x0000A38D00E20D93 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (834, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E20E3C AS DateTime), CAST(0x0000A38D00E20E3C AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (835, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E2D1F2 AS DateTime), CAST(0x0000A38D00E2D1F2 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (836, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E2D28A AS DateTime), CAST(0x0000A38D00E2D28A AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (837, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E52CFE AS DateTime), CAST(0x0000A38D00E52CFE AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (838, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E52D99 AS DateTime), CAST(0x0000A38D00E52D99 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (839, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E54829 AS DateTime), CAST(0x0000A38D00E54829 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (840, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E54896 AS DateTime), CAST(0x0000A38D00E54896 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (841, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E5D783 AS DateTime), CAST(0x0000A38D00E5D783 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (842, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E5D7F9 AS DateTime), CAST(0x0000A38D00E5D7F9 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (843, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E5D99B AS DateTime), CAST(0x0000A38D00E5D99B AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (844, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E5DA36 AS DateTime), CAST(0x0000A38D00E5DA36 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (845, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E5DB61 AS DateTime), CAST(0x0000A38D00E5DB61 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (846, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E5DC1D AS DateTime), CAST(0x0000A38D00E5DC1D AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (847, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E5E077 AS DateTime), CAST(0x0000A38D00E5E077 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (848, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E5E14F AS DateTime), CAST(0x0000A38D00E5E14F AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (849, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E5E17F AS DateTime), CAST(0x0000A38D00E5E17F AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (850, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E5E1B6 AS DateTime), CAST(0x0000A38D00E5E1B6 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (851, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E5E1F2 AS DateTime), CAST(0x0000A38D00E5E1F2 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (852, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E5E22A AS DateTime), CAST(0x0000A38D00E5E22A AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
GO
print 'Processed 800 total records'
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (853, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E5E25A AS DateTime), CAST(0x0000A38D00E5E25A AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (854, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E5E28C AS DateTime), CAST(0x0000A38D00E5E28C AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (855, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E60C0A AS DateTime), CAST(0x0000A38D00E60C0A AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (856, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E60C88 AS DateTime), CAST(0x0000A38D00E60C88 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (857, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E65147 AS DateTime), CAST(0x0000A38D00E65147 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (858, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E651D4 AS DateTime), CAST(0x0000A38D00E651D4 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (859, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E65D60 AS DateTime), CAST(0x0000A38D00E65D60 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (860, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E65E1C AS DateTime), CAST(0x0000A38D00E65E1C AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (861, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E7B99B AS DateTime), CAST(0x0000A38D00E7B99B AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (862, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D00E7BA31 AS DateTime), CAST(0x0000A38D00E7BA31 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (863, 0, 2, 59, N'Update setting success', CAST(0x0000A38D00EF65CD AS DateTime), CAST(0x0000A38D00EF65CD AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (864, 0, 2, 59, N'Update setting success', CAST(0x0000A38D00EFAE3B AS DateTime), CAST(0x0000A38D00EFAE3B AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (865, 0, 1, 59, N'Created new tenant', CAST(0x0000A38D00F0CAEE AS DateTime), CAST(0x0000A38D00F0CAEE AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (866, 10163, 2, 59, N'Assigned user for tenant', CAST(0x0000A38D00F0CD10 AS DateTime), CAST(0x0000A38D00F0CD10 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (867, 10163, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38D00F0CD2F AS DateTime), CAST(0x0000A38D00F0CD2F AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (868, 10163, 2, 59, N'Update profile', CAST(0x0000A38D00F0CD63 AS DateTime), CAST(0x0000A38D00F0CD63 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (869, 0, 2, 59, N'Update setting success', CAST(0x0000A38D00F0F5CB AS DateTime), CAST(0x0000A38D00F0F5CB AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (870, 0, 2, 59, N'Update setting success', CAST(0x0000A38D00F11FF5 AS DateTime), CAST(0x0000A38D00F11FF5 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (871, 0, 2, 59, N'Update setting success', CAST(0x0000A38D00F131D8 AS DateTime), CAST(0x0000A38D00F131D8 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (872, 0, 2, 59, N'Update setting success', CAST(0x0000A38D00F1BC1B AS DateTime), CAST(0x0000A38D00F1BC1B AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (873, 0, 2, 59, N'Update setting success', CAST(0x0000A38D00F1CAF1 AS DateTime), CAST(0x0000A38D00F1CAF1 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (874, 0, 2, 59, N'Update setting success', CAST(0x0000A38D00F29B99 AS DateTime), CAST(0x0000A38D00F29B99 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (875, 0, 2, 59, N'Update setting success', CAST(0x0000A38D00F2C572 AS DateTime), CAST(0x0000A38D00F2C572 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (876, 0, 2, 59, N'Update setting success', CAST(0x0000A38D00F38109 AS DateTime), CAST(0x0000A38D00F38109 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (877, 0, 2, 59, N'Update setting success', CAST(0x0000A38D00F6223F AS DateTime), CAST(0x0000A38D00F6223F AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (878, 0, 2, 59, N'Update setting success', CAST(0x0000A38D00F7D3EB AS DateTime), CAST(0x0000A38D00F7D3EB AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (879, 0, 1, 59, N'Created new tenant', CAST(0x0000A38D0102D951 AS DateTime), CAST(0x0000A38D0102D951 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (880, 10164, 2, 59, N'Assigned user for tenant', CAST(0x0000A38D0102DA96 AS DateTime), CAST(0x0000A38D0102DA96 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (881, 10164, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38D0102DAAB AS DateTime), CAST(0x0000A38D0102DAAB AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (882, 10164, 2, 59, N'Update profile', CAST(0x0000A38D0102DAB8 AS DateTime), CAST(0x0000A38D0102DAB8 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (883, 0, 1, 59, N'Insert new user success', CAST(0x0000A38D0105BD75 AS DateTime), CAST(0x0000A38D0105BD75 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (884, 0, 1, 59, N'Insert new user success', CAST(0x0000A38D0105BE73 AS DateTime), CAST(0x0000A38D0105BE73 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (885, 0, 1, 59, N'Insert new user success', CAST(0x0000A38D0105BF81 AS DateTime), CAST(0x0000A38D0105BF81 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (886, 0, 3, 59, N'Delete user success.', CAST(0x0000A38D0105CBC9 AS DateTime), CAST(0x0000A38D0105CBC9 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (887, 0, 3, 59, N'Delete user success.', CAST(0x0000A38D0105DC75 AS DateTime), CAST(0x0000A38D0105DC75 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (888, 0, 3, 59, N'Delete user success.', CAST(0x0000A38D0105DF03 AS DateTime), CAST(0x0000A38D0105DF03 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (889, 0, 3, 59, N'Delete user success.', CAST(0x0000A38D0105E1C2 AS DateTime), CAST(0x0000A38D0105E1C2 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (890, 10164, 1, 1, N'Insert new customer', CAST(0x0000A38D0107082E AS DateTime), CAST(0x0000A38D0107082E AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (891, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D010B7AAB AS DateTime), CAST(0x0000A38D010B7AAB AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (892, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D010B7B4D AS DateTime), CAST(0x0000A38D010B7B4D AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (893, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D010D0C9A AS DateTime), CAST(0x0000A38D010D0C9A AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (894, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D010F35C8 AS DateTime), CAST(0x0000A38D010F35C8 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (895, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D0110D899 AS DateTime), CAST(0x0000A38D0110D899 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (896, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D0113568B AS DateTime), CAST(0x0000A38D0113568B AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (897, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D0115D2FA AS DateTime), CAST(0x0000A38D0115D2FA AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (898, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D0115D5BF AS DateTime), CAST(0x0000A38D0115D5BF AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (899, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D0115D798 AS DateTime), CAST(0x0000A38D0115D798 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (900, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D0115D863 AS DateTime), CAST(0x0000A38D0115D863 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (901, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D0115D8EE AS DateTime), CAST(0x0000A38D0115D8EE AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (902, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D0115E024 AS DateTime), CAST(0x0000A38D0115E024 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (903, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D0116212C AS DateTime), CAST(0x0000A38D0116212C AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (904, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D01162BA7 AS DateTime), CAST(0x0000A38D01162BA7 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (905, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D011ED9C3 AS DateTime), CAST(0x0000A38D011ED9C3 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (906, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D011EDE7E AS DateTime), CAST(0x0000A38D011EDE7E AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (907, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D011F0E3D AS DateTime), CAST(0x0000A38D011F0E3D AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (908, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D011F2CEA AS DateTime), CAST(0x0000A38D011F2CEA AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (909, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D011F317F AS DateTime), CAST(0x0000A38D011F317F AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (910, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D011F4EEC AS DateTime), CAST(0x0000A38D011F4EEC AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (911, 10139, 2, 1, N'Edit contact', CAST(0x0000A38D011F5A55 AS DateTime), CAST(0x0000A38D011F5A55 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (912, 0, 2, 59, N'update user success:', CAST(0x0000A38E00A335CE AS DateTime), CAST(0x0000A38E00A335CE AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (913, 0, 2, 59, N'update user success:', CAST(0x0000A38E00A340BC AS DateTime), CAST(0x0000A38E00A340BC AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (914, 0, 2, 59, N'Update setting success', CAST(0x0000A38E00AE3329 AS DateTime), CAST(0x0000A38E00AE3329 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (915, 0, 2, 59, N'Update setting success', CAST(0x0000A38E00AF30AE AS DateTime), CAST(0x0000A38E00AF30AE AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (916, 0, 1, 59, N'Created new tenant', CAST(0x0000A38E00AF73B4 AS DateTime), CAST(0x0000A38E00AF73B4 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (917, 10165, 2, 59, N'Assigned user for tenant', CAST(0x0000A38E00AF74F3 AS DateTime), CAST(0x0000A38E00AF74F3 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (918, 10165, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A38E00AF750A AS DateTime), CAST(0x0000A38E00AF750A AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (919, 10165, 2, 59, N'Update profile', CAST(0x0000A38E00AF751D AS DateTime), CAST(0x0000A38E00AF751D AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (920, 10165, 1, 1, N'Create contact', CAST(0x0000A38E00AFB119 AS DateTime), CAST(0x0000A38E00AFB119 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (921, 10165, 2, 1, N'Edit contact', CAST(0x0000A38E00AFBDC3 AS DateTime), CAST(0x0000A38E00AFBDC3 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (922, 10165, 1, 1, N'Insert new customer', CAST(0x0000A38E00B02E23 AS DateTime), CAST(0x0000A38E00B02E23 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (923, 10165, 2, 1, N'Edit contact', CAST(0x0000A38E00B076D0 AS DateTime), CAST(0x0000A38E00B076D0 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (924, 10165, 2, 1, N'Edit contact', CAST(0x0000A38E00B56889 AS DateTime), CAST(0x0000A38E00B56889 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (927, 0, 1, 59, N'Insert new user success', CAST(0x0000A38E00DB7D7F AS DateTime), CAST(0x0000A38E00DB7D7F AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (928, 10165, 2, 1, N'Edit contact', CAST(0x0000A38E00DA761F AS DateTime), CAST(0x0000A38E00DA761F AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (929, 0, 2, 59, N'update avatar of user success', CAST(0x0000A38E00DB9BD7 AS DateTime), CAST(0x0000A38E00DB9BD7 AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (930, 0, 2, 59, N'Update setting success', CAST(0x0000A38E00EDD1D2 AS DateTime), CAST(0x0000A38E00EDD1D2 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (931, 0, 2, 59, N'Update setting success', CAST(0x0000A38E00EEACC7 AS DateTime), CAST(0x0000A38E00EEACC7 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (932, 0, 2, 59, N'Update setting success', CAST(0x0000A38E010288C7 AS DateTime), CAST(0x0000A38E010288C7 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (933, 0, 2, 59, N'Update setting success', CAST(0x0000A38F00E1208B AS DateTime), CAST(0x0000A38F00E1208B AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (934, 0, 2, 59, N'Update setting success', CAST(0x0000A38F011BE164 AS DateTime), CAST(0x0000A38F011BE164 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (935, 0, 2, 59, N'Update setting success', CAST(0x0000A38F01298924 AS DateTime), CAST(0x0000A38F01298924 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (936, 0, 2, 59, N'Update setting success', CAST(0x0000A38F01299621 AS DateTime), CAST(0x0000A38F01299621 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (937, 0, 2, 59, N'Update setting success', CAST(0x0000A3920095A0FE AS DateTime), CAST(0x0000A3920095A0FE AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (938, 0, 2, 59, N'Update setting success', CAST(0x0000A392009AB714 AS DateTime), CAST(0x0000A392009AB714 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (939, 0, 2, 59, N'Update setting success', CAST(0x0000A392009B2849 AS DateTime), CAST(0x0000A392009B2849 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (940, 0, 2, 59, N'Update setting success', CAST(0x0000A392009C47E6 AS DateTime), CAST(0x0000A392009C47E6 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (941, 10164, 2, 1, N'Update customer', CAST(0x0000A392009D0CC1 AS DateTime), CAST(0x0000A392009D0CC1 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (942, 10165, 2, 1, N'Edit contact', CAST(0x0000A392009D55BA AS DateTime), CAST(0x0000A392009D55BA AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (943, 0, 2, 59, N'Update setting success', CAST(0x0000A39200A9449C AS DateTime), CAST(0x0000A39200A9449C AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (944, 10165, 1, 1, N'Create contact', CAST(0x0000A39200AD5EA7 AS DateTime), CAST(0x0000A39200AD5EA7 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (945, 0, 1, 59, N'Created new tenant', CAST(0x0000A39200D70774 AS DateTime), CAST(0x0000A39200D70774 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (946, 10170, 2, 59, N'Assigned user for tenant', CAST(0x0000A39200D70975 AS DateTime), CAST(0x0000A39200D70975 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (947, 10170, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A39200D7098D AS DateTime), CAST(0x0000A39200D7098D AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (948, 10170, 1, 59, N'Insert user tenant admin', CAST(0x0000A39200D709A3 AS DateTime), CAST(0x0000A39200D709A3 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (949, 0, 2, 59, N'Update tenant', CAST(0x0000A39200F2DB52 AS DateTime), CAST(0x0000A39200F2DB52 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (950, 10162, 2, 59, N'Update profiles tenant', CAST(0x0000A39200F2DC5B AS DateTime), CAST(0x0000A39200F2DC5B AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (951, 10162, 2, 59, N'Update profiles tenant', CAST(0x0000A39200F39D49 AS DateTime), CAST(0x0000A39200F39D49 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (952, 10162, 2, 59, N'Update profiles tenant', CAST(0x0000A39200F44D76 AS DateTime), CAST(0x0000A39200F44D76 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (953, 10162, 2, 59, N'Update profiles tenant', CAST(0x0000A39200F55DD8 AS DateTime), CAST(0x0000A39200F55DD8 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (954, 0, 2, 59, N'Update tenant', CAST(0x0000A39200F5BD95 AS DateTime), CAST(0x0000A39200F5BD95 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (955, 0, 1, 59, N'Created new tenant', CAST(0x0000A39200F5F711 AS DateTime), CAST(0x0000A39200F5F711 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
GO
print 'Processed 900 total records'
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (956, 10171, 2, 59, N'Assigned user for tenant', CAST(0x0000A39200F5F964 AS DateTime), CAST(0x0000A39200F5F964 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (957, 10171, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A39200F5F979 AS DateTime), CAST(0x0000A39200F5F979 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (958, 10171, 2, 59, N'Update profile', CAST(0x0000A39200F5F984 AS DateTime), CAST(0x0000A39200F5F984 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (959, 10162, 2, 59, N'Update profiles tenant', CAST(0x0000A39200F6E198 AS DateTime), CAST(0x0000A39200F6E198 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (960, 10162, 2, 59, N'Update profiles tenant', CAST(0x0000A39200F73403 AS DateTime), CAST(0x0000A39200F73403 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (961, 0, 2, 59, N'Update setting success', CAST(0x0000A39200F9A079 AS DateTime), CAST(0x0000A39200F9A079 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (962, 0, 2, 59, N'Update tenant', CAST(0x0000A39200FA47A1 AS DateTime), CAST(0x0000A39200FA47A1 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (963, 0, 2, 59, N'Update tenant', CAST(0x0000A39200FB9EC5 AS DateTime), CAST(0x0000A39200FB9EC5 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (964, 0, 2, 59, N'Update tenant', CAST(0x0000A392010380EF AS DateTime), CAST(0x0000A392010380EF AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (965, 10162, 2, 59, N'Update profiles tenant', CAST(0x0000A3920103E815 AS DateTime), CAST(0x0000A3920103E815 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (966, 10162, 2, 59, N'Update profiles tenant', CAST(0x0000A3920104241F AS DateTime), CAST(0x0000A3920104241F AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (967, 0, 2, 59, N'Update setting success', CAST(0x0000A39201060DE6 AS DateTime), CAST(0x0000A39201060DE6 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (968, 10162, 2, 59, N'Update profiles tenant', CAST(0x0000A39201154D4A AS DateTime), CAST(0x0000A39201154D4A AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (969, 10162, 2, 59, N'Update profiles tenant', CAST(0x0000A39201187109 AS DateTime), CAST(0x0000A39201187109 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (970, 10162, 2, 59, N'Update person contact', CAST(0x0000A39201187125 AS DateTime), CAST(0x0000A39201187125 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (971, 10162, 2, 59, N'Update profiles tenant', CAST(0x0000A392011A7A72 AS DateTime), CAST(0x0000A392011A7A72 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (972, 0, 2, 59, N'Update tenant', CAST(0x0000A392011AD7AA AS DateTime), CAST(0x0000A392011AD7AA AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (973, 0, 1, 59, N'Created new tenant', CAST(0x0000A392011BD96C AS DateTime), CAST(0x0000A392011BD96C AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (974, 10172, 2, 59, N'Assigned user for tenant', CAST(0x0000A392011BDBE4 AS DateTime), CAST(0x0000A392011BDBE4 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (975, 10172, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A392011BDC04 AS DateTime), CAST(0x0000A392011BDC04 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (976, 10172, 2, 59, N'Update profile', CAST(0x0000A392011BDC20 AS DateTime), CAST(0x0000A392011BDC20 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (977, 10172, 2, 59, N'Update profiles tenant', CAST(0x0000A392011DC2B8 AS DateTime), CAST(0x0000A392011DC2B8 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (978, 0, 1, 59, N'Created new tenant', CAST(0x0000A39201242D5C AS DateTime), CAST(0x0000A39201242D5C AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (979, 10173, 2, 59, N'Assigned user for tenant', CAST(0x0000A39201242F02 AS DateTime), CAST(0x0000A39201242F02 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (980, 10173, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A39201242F19 AS DateTime), CAST(0x0000A39201242F19 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (981, 10173, 2, 59, N'Update profile', CAST(0x0000A39201242F4C AS DateTime), CAST(0x0000A39201242F4C AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (982, 0, 2, 59, N'Update setting success', CAST(0x0000A39300A00FCC AS DateTime), CAST(0x0000A39300A00FCC AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (983, 0, 2, 59, N'Update setting success', CAST(0x0000A39300A01FC9 AS DateTime), CAST(0x0000A39300A01FC9 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (984, 0, 2, 59, N'Update setting success', CAST(0x0000A39300A037C0 AS DateTime), CAST(0x0000A39300A037C0 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (985, 0, 2, 59, N'update user success:', CAST(0x0000A39300AA2962 AS DateTime), CAST(0x0000A39300AA2962 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (986, 0, 2, 59, N'update user success:', CAST(0x0000A39300AA4745 AS DateTime), CAST(0x0000A39300AA4745 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (987, 0, 2, 59, N'update user success:', CAST(0x0000A39300AA5196 AS DateTime), CAST(0x0000A39300AA5196 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (988, 0, 2, 59, N'update user success:', CAST(0x0000A39300AA6AB2 AS DateTime), CAST(0x0000A39300AA6AB2 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (989, 0, 2, 59, N'update user success:', CAST(0x0000A39300AAAAEE AS DateTime), CAST(0x0000A39300AAAAEE AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (990, 0, 2, 59, N'update user success:', CAST(0x0000A39300ADA7C8 AS DateTime), CAST(0x0000A39300ADA7C8 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (991, 0, 2, 59, N'Update setting success', CAST(0x0000A39300B07B39 AS DateTime), CAST(0x0000A39300B07B39 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (992, 0, 2, 59, N'Update setting success', CAST(0x0000A39300DFD3EF AS DateTime), CAST(0x0000A39300DFD3EF AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (993, 0, 2, 59, N'Update setting success', CAST(0x0000A39300ED3E47 AS DateTime), CAST(0x0000A39300ED3E47 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (994, 0, 1, 59, N'Created new tenant', CAST(0x0000A393010628AD AS DateTime), CAST(0x0000A393010628AD AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (995, 10174, 2, 59, N'Assigned user for tenant', CAST(0x0000A39301062D01 AS DateTime), CAST(0x0000A39301062D01 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (996, 10174, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A39301062D4B AS DateTime), CAST(0x0000A39301062D4B AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (997, 10174, 2, 59, N'Update profile', CAST(0x0000A39301062D64 AS DateTime), CAST(0x0000A39301062D64 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (998, 10174, 2, 59, N'Update profiles tenant', CAST(0x0000A3930106F254 AS DateTime), CAST(0x0000A3930106F254 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (999, 10174, 2, 59, N'Update person contact', CAST(0x0000A3930106F25B AS DateTime), CAST(0x0000A3930106F25B AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1000, 0, 2, 59, N'Update tenant', CAST(0x0000A393010833D6 AS DateTime), CAST(0x0000A393010833D6 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1001, 10174, 2, 59, N'Update profiles tenant', CAST(0x0000A39301084D18 AS DateTime), CAST(0x0000A39301084D18 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1002, 10174, 2, 59, N'Update profiles tenant', CAST(0x0000A393010A8602 AS DateTime), CAST(0x0000A393010A8602 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1003, 0, 2, 59, N'update user success:', CAST(0x0000A393010A8728 AS DateTime), CAST(0x0000A393010A8728 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1004, 0, 2, 59, N'update user success:', CAST(0x0000A393010A9FE3 AS DateTime), CAST(0x0000A393010A9FE3 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1005, 0, 2, 59, N'update user success:', CAST(0x0000A393010BCCF0 AS DateTime), CAST(0x0000A393010BCCF0 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1006, 0, 2, 59, N'update user success:', CAST(0x0000A393010D2397 AS DateTime), CAST(0x0000A393010D2397 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1007, 0, 2, 59, N'update user success:', CAST(0x0000A393010D5E80 AS DateTime), CAST(0x0000A393010D5E80 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1008, 0, 2, 59, N'Update setting success', CAST(0x0000A39301130F19 AS DateTime), CAST(0x0000A39301130F19 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1009, 0, 2, 59, N'update user success:', CAST(0x0000A39301128040 AS DateTime), CAST(0x0000A39301128040 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1010, 0, 2, 59, N'update user success:', CAST(0x0000A39301146AE8 AS DateTime), CAST(0x0000A39301146AE8 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1011, 0, 2, 59, N'Update setting success', CAST(0x0000A393011A3D4F AS DateTime), CAST(0x0000A393011A3D4F AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1012, 0, 2, 59, N'Update setting success', CAST(0x0000A393011A60B0 AS DateTime), CAST(0x0000A393011A60B0 AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1013, 0, 2, 59, N'Update setting success', CAST(0x0000A393011A7967 AS DateTime), CAST(0x0000A393011A7967 AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1014, 0, 2, 59, N'update user success:', CAST(0x0000A393011DDC97 AS DateTime), CAST(0x0000A393011DDC97 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1015, 0, 2, 59, N'update user success:', CAST(0x0000A393011DE5E2 AS DateTime), CAST(0x0000A393011DE5E2 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1016, 0, 2, 59, N'Update setting success', CAST(0x0000A393011EAD0F AS DateTime), CAST(0x0000A393011EAD0F AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1017, 0, 2, 59, N'Update setting success', CAST(0x0000A393011EB877 AS DateTime), CAST(0x0000A393011EB877 AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1018, 0, 2, 59, N'Update setting success', CAST(0x0000A393011F42D9 AS DateTime), CAST(0x0000A393011F42D9 AS DateTime), N'Chrome', N'192.168.1.50', N'sun.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1019, 0, 2, 59, N'Update setting success', CAST(0x0000A393011F6E75 AS DateTime), CAST(0x0000A393011F6E75 AS DateTime), N'Chrome', N'192.168.1.50', N'sun.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1020, 0, 2, 59, N'Update setting success', CAST(0x0000A393011F7545 AS DateTime), CAST(0x0000A393011F7545 AS DateTime), N'Chrome', N'192.168.1.50', N'sun.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1021, 0, 2, 59, N'Update setting success', CAST(0x0000A393011F7E1E AS DateTime), CAST(0x0000A393011F7E1E AS DateTime), N'Chrome', N'192.168.1.50', N'sun.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1022, 0, 2, 59, N'Update setting success', CAST(0x0000A39301205073 AS DateTime), CAST(0x0000A39301205073 AS DateTime), N'Chrome', N'192.168.1.50', N'sun.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1023, 0, 2, 59, N'Update setting success', CAST(0x0000A394009DA3A7 AS DateTime), CAST(0x0000A394009DA3A7 AS DateTime), N'Firefox', N'192.168.1.50', N'sun.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1024, 0, 2, 59, N'Update setting success', CAST(0x0000A394009DADBE AS DateTime), CAST(0x0000A394009DADBE AS DateTime), N'Firefox', N'192.168.1.50', N'sun.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1025, 0, 2, 59, N'Update setting success', CAST(0x0000A394009DB936 AS DateTime), CAST(0x0000A394009DB936 AS DateTime), N'Firefox', N'192.168.1.50', N'sun.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1026, 0, 1, 59, N'Created new tenant', CAST(0x0000A39400AC6406 AS DateTime), CAST(0x0000A39400AC6406 AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1027, 10175, 2, 59, N'Assigned user for tenant', CAST(0x0000A39400AC6C3F AS DateTime), CAST(0x0000A39400AC6C3F AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1028, 10175, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A39400AC6C8B AS DateTime), CAST(0x0000A39400AC6C8B AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1029, 10175, 2, 59, N'Update profile', CAST(0x0000A39400AC6CB5 AS DateTime), CAST(0x0000A39400AC6CB5 AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1030, 10175, 2, 59, N'Update profiles tenant', CAST(0x0000A39400AE11DB AS DateTime), CAST(0x0000A39400AE11DB AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1031, 10174, 2, 59, N'Update profiles tenant', CAST(0x0000A39400B4E2D4 AS DateTime), CAST(0x0000A39400B4E2D4 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1032, 0, 2, 59, N'update user success:', CAST(0x0000A39400B90E29 AS DateTime), CAST(0x0000A39400B90E29 AS DateTime), N'Chrome', N'192.168.1.50', N'sun.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1033, 10175, 2, 59, N'Update profiles tenant', CAST(0x0000A39400B983B5 AS DateTime), CAST(0x0000A39400B983B5 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1034, 0, 2, 59, N'update user success:', CAST(0x0000A39400B97114 AS DateTime), CAST(0x0000A39400B97114 AS DateTime), N'Firefox', N'192.168.1.50', N'sun.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1036, 0, 2, 59, N'Update tenant', CAST(0x0000A39400DAC89B AS DateTime), CAST(0x0000A39400DAC89B AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1037, 0, 2, 59, N'Update tenant', CAST(0x0000A39400E1BBDB AS DateTime), CAST(0x0000A39400E1BBDB AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1038, 0, 2, 59, N'Update tenant', CAST(0x0000A39400E200FE AS DateTime), CAST(0x0000A39400E200FE AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1039, 0, 2, 59, N'Update tenant', CAST(0x0000A39400E34096 AS DateTime), CAST(0x0000A39400E34097 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1040, 0, 2, 59, N'Update setting success', CAST(0x0000A39400EC17F0 AS DateTime), CAST(0x0000A39400EC17F0 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1041, 0, 2, 59, N'Update tenant', CAST(0x0000A39400ED04AA AS DateTime), CAST(0x0000A39400ED04AA AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1043, 0, 1, 59, N'Created new tenant', CAST(0x0000A39400EF2818 AS DateTime), CAST(0x0000A39400EF2818 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1044, 10180, 2, 59, N'Assigned user for tenant', CAST(0x0000A39400EF2943 AS DateTime), CAST(0x0000A39400EF2943 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1045, 10180, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A39400EF2984 AS DateTime), CAST(0x0000A39400EF2984 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1046, 10180, 2, 59, N'Update profile', CAST(0x0000A39400EF2997 AS DateTime), CAST(0x0000A39400EF2997 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1047, 0, 2, 59, N'Update tenant', CAST(0x0000A39400EF4285 AS DateTime), CAST(0x0000A39400EF4285 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1048, 0, 2, 59, N'Update tenant', CAST(0x0000A39400EF55FE AS DateTime), CAST(0x0000A39400EF55FE AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1049, 10180, 2, 59, N'Update profiles tenant', CAST(0x0000A39400EF7B95 AS DateTime), CAST(0x0000A39400EF7B95 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1050, 10180, 2, 59, N'Update person contact', CAST(0x0000A39400EF7BBC AS DateTime), CAST(0x0000A39400EF7BBC AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1051, 0, 2, 59, N'Update setting success', CAST(0x0000A39400F5C31F AS DateTime), CAST(0x0000A39400F5C31F AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1052, 0, 2, 59, N'Update setting success', CAST(0x0000A39400F60023 AS DateTime), CAST(0x0000A39400F60023 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1053, 0, 2, 59, N'Update setting success', CAST(0x0000A39400F96E68 AS DateTime), CAST(0x0000A39400F96E68 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1054, 0, 2, 59, N'Update setting success', CAST(0x0000A39400FAF791 AS DateTime), CAST(0x0000A39400FAF791 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1055, 0, 2, 59, N'Update setting success', CAST(0x0000A39400FB24B6 AS DateTime), CAST(0x0000A39400FB24B6 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1056, 0, 2, 59, N'Update setting success', CAST(0x0000A39400FB6A58 AS DateTime), CAST(0x0000A39400FB6A58 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1057, 0, 2, 59, N'Update setting success', CAST(0x0000A39400FD8A8E AS DateTime), CAST(0x0000A39400FD8A8E AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1058, 0, 1, 59, N'Created new tenant', CAST(0x0000A3940102B72C AS DateTime), CAST(0x0000A3940102B72C AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenants', 1)
GO
print 'Processed 1000 total records'
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1059, 10181, 2, 59, N'Assigned user for tenant', CAST(0x0000A3940102B88E AS DateTime), CAST(0x0000A3940102B88E AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1060, 10181, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A3940102B8AB AS DateTime), CAST(0x0000A3940102B8AB AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1061, 10181, 2, 59, N'Update profile', CAST(0x0000A3940102B8B6 AS DateTime), CAST(0x0000A3940102B8B6 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1062, 0, 2, 59, N'Update setting success', CAST(0x0000A3940116E04B AS DateTime), CAST(0x0000A3940116E04B AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1063, 0, 2, 59, N'Update tenant', CAST(0x0000A3950095C076 AS DateTime), CAST(0x0000A3950095C076 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1064, 0, 2, 59, N'Update tenant', CAST(0x0000A3950096C162 AS DateTime), CAST(0x0000A3950096C162 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1065, 0, 2, 59, N'Update setting success', CAST(0x0000A395009A3B01 AS DateTime), CAST(0x0000A395009A3B01 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1066, 0, 1, 59, N'Created new tenant', CAST(0x0000A39500AAD4AD AS DateTime), CAST(0x0000A39500AAD4AD AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1067, 0, 2, 59, N'update avatar of user success', CAST(0x0000A39500ABACE3 AS DateTime), CAST(0x0000A39500ABACE3 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1068, 0, 2, 59, N'update avatar of user success', CAST(0x0000A39500ACC370 AS DateTime), CAST(0x0000A39500ACC370 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1069, 0, 2, 59, N'update user success:', CAST(0x0000A39500AD368F AS DateTime), CAST(0x0000A39500AD368F AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1070, 0, 2, 59, N'update avatar of user success', CAST(0x0000A39500ADC2D6 AS DateTime), CAST(0x0000A39500ADC2D6 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1071, 0, 2, 59, N'Update setting success', CAST(0x0000A39500B1290B AS DateTime), CAST(0x0000A39500B1290B AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1072, 0, 2, 59, N'Update setting success', CAST(0x0000A39500B15938 AS DateTime), CAST(0x0000A39500B15938 AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1073, 0, 2, 59, N'update avatar of user success', CAST(0x0000A39500B11964 AS DateTime), CAST(0x0000A39500B11964 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1074, 0, 2, 59, N'update user success:', CAST(0x0000A39500B133A8 AS DateTime), CAST(0x0000A39500B133A8 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1075, 0, 2, 59, N'update avatar of user success', CAST(0x0000A39500B27802 AS DateTime), CAST(0x0000A39500B27802 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1076, 0, 2, 59, N'Update setting success', CAST(0x0000A39500B68DD8 AS DateTime), CAST(0x0000A39500B68DD8 AS DateTime), N'Firefox', N'::1', N'THINH-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1077, 0, 2, 59, N'update avatar of user success', CAST(0x0000A39500B6ADE6 AS DateTime), CAST(0x0000A39500B6ADE6 AS DateTime), N'Firefox', N'::1', N'THINH-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1078, 0, 2, 59, N'update avatar of user success', CAST(0x0000A39500B6BCF5 AS DateTime), CAST(0x0000A39500B6BCF5 AS DateTime), N'Firefox', N'::1', N'THINH-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1079, 0, 2, 59, N'Update setting success', CAST(0x0000A39500B7202E AS DateTime), CAST(0x0000A39500B7202E AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1080, 0, 1, 59, N'Created new tenant', CAST(0x0000A39500B8F4C7 AS DateTime), CAST(0x0000A39500B8F4C7 AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1081, 10184, 2, 59, N'Assigned user for tenant', CAST(0x0000A39500B8F5E9 AS DateTime), CAST(0x0000A39500B8F5E9 AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1082, 10184, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A39500B8F601 AS DateTime), CAST(0x0000A39500B8F601 AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1083, 10184, 2, 59, N'Update profile', CAST(0x0000A39500B8F613 AS DateTime), CAST(0x0000A39500B8F613 AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1084, 0, 2, 59, N'update avatar of user success', CAST(0x0000A39500B733B9 AS DateTime), CAST(0x0000A39500B733B9 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1085, 0, 2, 59, N'update avatar of user success', CAST(0x0000A39500B73757 AS DateTime), CAST(0x0000A39500B73757 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1086, 0, 2, 59, N'Update setting success', CAST(0x0000A39500B9626A AS DateTime), CAST(0x0000A39500B9626A AS DateTime), N'Firefox', N'192.168.1.50', N'sun.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1087, 0, 3, 59, N'Delete user success.', CAST(0x0000A39500BD3E33 AS DateTime), CAST(0x0000A39500BD3E33 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1088, 0, 1, 59, N'Insert new user success', CAST(0x0000A39500BD6C0D AS DateTime), CAST(0x0000A39500BD6C0D AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1089, 0, 3, 59, N'Delete user success.', CAST(0x0000A39500DF5048 AS DateTime), CAST(0x0000A39500DF5048 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1090, 0, 1, 59, N'Insert new user success', CAST(0x0000A39500DF79A2 AS DateTime), CAST(0x0000A39500DF79A2 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1091, 0, 1, 80, N'Created new tenant', CAST(0x0000A39500E01B52 AS DateTime), CAST(0x0000A39500E01B52 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1092, 0, 3, 59, N'Delete user success.', CAST(0x0000A39500E04376 AS DateTime), CAST(0x0000A39500E04376 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1093, 0, 1, 59, N'Insert new user success', CAST(0x0000A39500E111C9 AS DateTime), CAST(0x0000A39500E111C9 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1094, 0, 2, 59, N'update user success:', CAST(0x0000A39500E8A80A AS DateTime), CAST(0x0000A39500E8A80A AS DateTime), N'Firefox', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1095, 0, 2, 59, N'update user success:', CAST(0x0000A39500E8CD96 AS DateTime), CAST(0x0000A39500E8CD96 AS DateTime), N'Firefox', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1096, 0, 2, 59, N'update user success:', CAST(0x0000A39500EA5B9D AS DateTime), CAST(0x0000A39500EA5B9D AS DateTime), N'Firefox', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1097, 0, 2, 59, N'update user success:', CAST(0x0000A39500EA9F7E AS DateTime), CAST(0x0000A39500EA9F7E AS DateTime), N'Firefox', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1098, 0, 2, 59, N'update user success:', CAST(0x0000A39500EAB315 AS DateTime), CAST(0x0000A39500EAB315 AS DateTime), N'Firefox', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1099, 0, 2, 59, N'update user success:', CAST(0x0000A39500EAF7ED AS DateTime), CAST(0x0000A39500EAF7ED AS DateTime), N'Firefox', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1100, 0, 2, 59, N'update user success:', CAST(0x0000A39500EB06C2 AS DateTime), CAST(0x0000A39500EB06C2 AS DateTime), N'Firefox', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1101, 0, 2, 59, N'update user success:', CAST(0x0000A39500EC5EDA AS DateTime), CAST(0x0000A39500EC5EDA AS DateTime), N'Firefox', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1102, 0, 2, 59, N'update avatar of user success', CAST(0x0000A39500ECD9D0 AS DateTime), CAST(0x0000A39500ECD9D0 AS DateTime), N'Firefox', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1103, 0, 2, 59, N'update user success:', CAST(0x0000A39500ED9A2A AS DateTime), CAST(0x0000A39500ED9A2A AS DateTime), N'Firefox', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1104, 0, 2, 59, N'update user success:', CAST(0x0000A39500EE0F56 AS DateTime), CAST(0x0000A39500EE0F56 AS DateTime), N'Firefox', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1105, 0, 2, 59, N'Update setting success', CAST(0x0000A396009CFDDF AS DateTime), CAST(0x0000A396009CFDDF AS DateTime), N'Firefox', N'192.168.1.50', N'sun.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1106, 10174, 2, 1, N'Update access right', CAST(0x0000A39600DE161C AS DateTime), CAST(0x0000A39600DE161C AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1107, 10174, 2, 1, N'Update access right', CAST(0x0000A39600DE1BEF AS DateTime), CAST(0x0000A39600DE1BEF AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1108, 10174, 2, 1, N'Update access right', CAST(0x0000A39600DF0D75 AS DateTime), CAST(0x0000A39600DF0D75 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1109, 0, 2, 59, N'Update setting success', CAST(0x0000A39600EFB3A0 AS DateTime), CAST(0x0000A39600EFB3A0 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1110, 0, 2, 59, N'Update setting success', CAST(0x0000A39600EFC70D AS DateTime), CAST(0x0000A39600EFC70D AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1111, 0, 2, 59, N'Update access right', CAST(0x0000A39900C40C00 AS DateTime), CAST(0x0000A39900C40C00 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1112, 0, 2, 59, N'Update access right', CAST(0x0000A39900C544F4 AS DateTime), CAST(0x0000A39900C544F4 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1113, 0, 2, 59, N'Update access right', CAST(0x0000A39900C56960 AS DateTime), CAST(0x0000A39900C56960 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1114, 0, 2, 59, N'Update access right', CAST(0x0000A39900C5822B AS DateTime), CAST(0x0000A39900C5822B AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1115, 0, 2, 59, N'Update access right', CAST(0x0000A39900C59E0F AS DateTime), CAST(0x0000A39900C59E0F AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1116, 0, 2, 59, N'Update access right', CAST(0x0000A39900C5AEA6 AS DateTime), CAST(0x0000A39900C5AEA6 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1117, 0, 2, 59, N'Update access right', CAST(0x0000A39900C5C159 AS DateTime), CAST(0x0000A39900C5C159 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1118, 0, 2, 59, N'Update access right', CAST(0x0000A39900C65EF6 AS DateTime), CAST(0x0000A39900C65EF6 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1119, 0, 2, 59, N'Update access right', CAST(0x0000A39900C67B12 AS DateTime), CAST(0x0000A39900C67B12 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1120, 0, 2, 59, N'Update access right', CAST(0x0000A39900C6A284 AS DateTime), CAST(0x0000A39900C6A284 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1121, 0, 2, 59, N'Update access right', CAST(0x0000A39900C6BA18 AS DateTime), CAST(0x0000A39900C6BA18 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1122, 0, 2, 59, N'Update access right', CAST(0x0000A39900C6CC39 AS DateTime), CAST(0x0000A39900C6CC39 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1123, 10174, 2, 1, N'Update access right', CAST(0x0000A39900C74EB9 AS DateTime), CAST(0x0000A39900C74EB9 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1124, 10174, 2, 1, N'Update access right', CAST(0x0000A39900C83A17 AS DateTime), CAST(0x0000A39900C83A17 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1125, 10174, 2, 1, N'Update access right', CAST(0x0000A39900C8CD14 AS DateTime), CAST(0x0000A39900C8CD14 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1126, 0, 2, 59, N'Update access right', CAST(0x0000A39900D682B1 AS DateTime), CAST(0x0000A39900D682B1 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1127, 0, 1, 59, N'Created new tenant', CAST(0x0000A39B009D81D0 AS DateTime), CAST(0x0000A39B009D81D0 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1128, 10189, 2, 59, N'Assigned user for tenant', CAST(0x0000A39B009D8394 AS DateTime), CAST(0x0000A39B009D8394 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1129, 10189, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A39B009D83A8 AS DateTime), CAST(0x0000A39B009D83A8 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1130, 10189, 2, 59, N'Update profile', CAST(0x0000A39B009D83BE AS DateTime), CAST(0x0000A39B009D83BE AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1131, 10189, 2, 59, N'Update profiles tenant', CAST(0x0000A39B00A8E424 AS DateTime), CAST(0x0000A39B00A8E424 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1132, 10189, 2, 59, N'Update person contact', CAST(0x0000A39B00A8E448 AS DateTime), CAST(0x0000A39B00A8E448 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1133, 10162, 1, 2, N'Insert new customer', CAST(0x0000A39B00FCE487 AS DateTime), CAST(0x0000A39B00FCE487 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1134, 0, 2, 59, N'update user success:', CAST(0x0000A39C009A8477 AS DateTime), CAST(0x0000A39C009A8477 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1135, 0, 2, 59, N'update user success:', CAST(0x0000A39C009AA039 AS DateTime), CAST(0x0000A39C009AA039 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1136, 0, 2, 59, N'update user success:', CAST(0x0000A39C009AC410 AS DateTime), CAST(0x0000A39C009AC410 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1137, 0, 2, 59, N'update user success:', CAST(0x0000A39C009B5710 AS DateTime), CAST(0x0000A39C009B5710 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1138, 0, 2, 59, N'update user success:', CAST(0x0000A39C009C7953 AS DateTime), CAST(0x0000A39C009C7953 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1139, 0, 2, 59, N'Update setting success', CAST(0x0000A39C00A4023A AS DateTime), CAST(0x0000A39C00A4023A AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1140, 0, 2, 59, N'Update setting success', CAST(0x0000A39C00A48945 AS DateTime), CAST(0x0000A39C00A48945 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1141, 0, 2, 59, N'Update setting success', CAST(0x0000A39C00A82747 AS DateTime), CAST(0x0000A39C00A82747 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1142, 0, 1, 59, N'Created new tenant', CAST(0x0000A39C00B2BD3A AS DateTime), CAST(0x0000A39C00B2BD3A AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1146, 0, 2, 59, N'Update setting success', CAST(0x0000A39C00B4C7A3 AS DateTime), CAST(0x0000A39C00B4C7A4 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1147, 0, 2, 59, N'Update setting success', CAST(0x0000A39C00B4D3E5 AS DateTime), CAST(0x0000A39C00B4D3E5 AS DateTime), N'Chrome', N'::1', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1151, 0, 2, 59, N'Update setting success', CAST(0x0000A39C00F84B00 AS DateTime), CAST(0x0000A39C00F84B00 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1152, 0, 2, 59, N'Update setting success', CAST(0x0000A39C00F900A5 AS DateTime), CAST(0x0000A39C00F900A5 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1153, 0, 2, 59, N'Update setting success', CAST(0x0000A39C00FA8551 AS DateTime), CAST(0x0000A39C00FA8551 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1154, 0, 2, 59, N'Update setting success', CAST(0x0000A39C00FB7B06 AS DateTime), CAST(0x0000A39C00FB7B06 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1155, 0, 2, 59, N'Update setting success', CAST(0x0000A39C00FB8E59 AS DateTime), CAST(0x0000A39C00FB8E59 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1156, 0, 2, 59, N'Update setting success', CAST(0x0000A39C00FD12EA AS DateTime), CAST(0x0000A39C00FD12EA AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1157, 0, 2, 59, N'Update setting success', CAST(0x0000A39C0101CF1C AS DateTime), CAST(0x0000A39C0101CF1C AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1158, 0, 2, 59, N'Update setting success', CAST(0x0000A39C0103FBEC AS DateTime), CAST(0x0000A39C0103FBEC AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1159, 0, 2, 59, N'Update setting success', CAST(0x0000A39C0113E767 AS DateTime), CAST(0x0000A39C0113E767 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1160, 0, 2, 59, N'Update setting success', CAST(0x0000A39C01141B06 AS DateTime), CAST(0x0000A39C01141B06 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1161, 0, 2, 59, N'Update setting success', CAST(0x0000A39C011540B6 AS DateTime), CAST(0x0000A39C011540B6 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1162, 0, 2, 59, N'Update setting success', CAST(0x0000A39C01143AD3 AS DateTime), CAST(0x0000A39C01143AD3 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1163, 0, 2, 59, N'Update setting success', CAST(0x0000A39C011448EF AS DateTime), CAST(0x0000A39C011448EF AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1164, 0, 2, 59, N'Update setting success', CAST(0x0000A39C01145723 AS DateTime), CAST(0x0000A39C01145723 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1165, 0, 2, 59, N'Update setting success', CAST(0x0000A39C011D00FB AS DateTime), CAST(0x0000A39C011D00FB AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
GO
print 'Processed 1100 total records'
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1166, 0, 2, 59, N'Update tenant', CAST(0x0000A39D00BBCD82 AS DateTime), CAST(0x0000A39D00BBCD82 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1167, 0, 2, 59, N'Update setting success', CAST(0x0000A39D00D599C9 AS DateTime), CAST(0x0000A39D00D599C9 AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1168, 0, 2, 59, N'Update setting success', CAST(0x0000A39D00EE43B5 AS DateTime), CAST(0x0000A39D00EE43B5 AS DateTime), N'Chrome', N'192.168.1.50', N'sun.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1169, 0, 2, 59, N'Update setting success', CAST(0x0000A39D00EE4CA4 AS DateTime), CAST(0x0000A39D00EE4CA4 AS DateTime), N'Chrome', N'192.168.1.50', N'sun.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1170, 0, 2, 59, N'Update setting success', CAST(0x0000A39D00EF43CC AS DateTime), CAST(0x0000A39D00EF43CC AS DateTime), N'Chrome', N'192.168.1.50', N'sun.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1171, 0, 2, 59, N'Update setting success', CAST(0x0000A39D00F19696 AS DateTime), CAST(0x0000A39D00F19696 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1172, 10173, 1, 1, N'Create contact', CAST(0x0000A39D0105EC53 AS DateTime), CAST(0x0000A39D0105EC53 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1173, 10174, 1, 1, N'Save avatar image.', CAST(0x0000A39D01083C10 AS DateTime), CAST(0x0000A39D01083C10 AS DateTime), N'Chrome', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1174, 10174, 1, 1, N'Create contact', CAST(0x0000A39D01088346 AS DateTime), CAST(0x0000A39D01088346 AS DateTime), N'Chrome', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1175, 10173, 2, 1, N'Edit contact', CAST(0x0000A39D0108267A AS DateTime), CAST(0x0000A39D0108267A AS DateTime), N'Chrome', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1176, 0, 2, 59, N'Update setting success', CAST(0x0000A3A000B6CDBF AS DateTime), CAST(0x0000A3A000B6CDBF AS DateTime), N'Firefox', N'192.168.1.55', N'dao-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1177, 0, 2, 59, N'Update setting success', CAST(0x0000A3A000B9C1A6 AS DateTime), CAST(0x0000A3A000B9C1A6 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1178, 0, 2, 59, N'Update setting success', CAST(0x0000A3A000B9CF09 AS DateTime), CAST(0x0000A3A000B9CF09 AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1179, 0, 2, 59, N'Update setting success', CAST(0x0000A3A000BAEEC1 AS DateTime), CAST(0x0000A3A000BAEEC1 AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1180, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A000BB529D AS DateTime), CAST(0x0000A3A000BB529D AS DateTime), N'Firefox', N'::1', N'dao-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1184, 0, 2, 59, N'Update setting success', CAST(0x0000A3A000E1D821 AS DateTime), CAST(0x0000A3A000E1D821 AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1185, 0, 2, 59, N'Update setting success', CAST(0x0000A3A000EE2080 AS DateTime), CAST(0x0000A3A000EE2080 AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1187, 10173, 1, 1, N'Create contact', CAST(0x0000A3A00103974D AS DateTime), CAST(0x0000A3A00103974D AS DateTime), N'Chrome', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1188, 10173, 2, 1, N'Edit contact', CAST(0x0000A3A00105582C AS DateTime), CAST(0x0000A3A00105582C AS DateTime), N'Chrome', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1189, 10173, 2, 1, N'Edit contact', CAST(0x0000A3A0010BEBA2 AS DateTime), CAST(0x0000A3A0010BEBA2 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1190, 10173, 2, 1, N'Edit contact', CAST(0x0000A3A0010C3CEB AS DateTime), CAST(0x0000A3A0010C3CEB AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1191, 0, 2, 59, N'Update setting success', CAST(0x0000A3A0010DAE78 AS DateTime), CAST(0x0000A3A0010DAE78 AS DateTime), N'Chrome', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1193, 0, 2, 59, N'Update setting success', CAST(0x0000A3A10095792F AS DateTime), CAST(0x0000A3A10095792F AS DateTime), N'Chrome', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1194, 0, 2, 59, N'Update setting success', CAST(0x0000A3A100964647 AS DateTime), CAST(0x0000A3A100964647 AS DateTime), N'Chrome', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1195, 0, 2, 59, N'Update setting success', CAST(0x0000A3A100A68BD9 AS DateTime), CAST(0x0000A3A100A68BD9 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1200, 0, 2, 59, N'Update setting success', CAST(0x0000A3A100A5F611 AS DateTime), CAST(0x0000A3A100A5F611 AS DateTime), N'Chrome', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1207, 0, 1, 59, N'Insert new user success', CAST(0x0000A3A100AA3942 AS DateTime), CAST(0x0000A3A100AA3942 AS DateTime), N'Chrome', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1209, 0, 2, 59, N'Update access right', CAST(0x0000A3A100B222D6 AS DateTime), CAST(0x0000A3A100B222D6 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1210, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A100B27946 AS DateTime), CAST(0x0000A3A100B27946 AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1211, 10205, 2, 59, N'Assigned user for tenant', CAST(0x0000A3A100B27AB9 AS DateTime), CAST(0x0000A3A100B27AB9 AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1212, 10205, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A3A100B27ADA AS DateTime), CAST(0x0000A3A100B27ADA AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1213, 10205, 2, 59, N'Update profile', CAST(0x0000A3A100B27AFB AS DateTime), CAST(0x0000A3A100B27AFB AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1214, 0, 2, 59, N'Update setting success', CAST(0x0000A3A100B2A06C AS DateTime), CAST(0x0000A3A100B2A06C AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1215, 0, 2, 59, N'Update setting success', CAST(0x0000A3A100B2AF54 AS DateTime), CAST(0x0000A3A100B2AF54 AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1216, 0, 2, 59, N'Update setting success', CAST(0x0000A3A100B2B6F7 AS DateTime), CAST(0x0000A3A100B2B6F7 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1221, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A100B58B58 AS DateTime), CAST(0x0000A3A100B58B58 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1222, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A100B59F99 AS DateTime), CAST(0x0000A3A100B59F99 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1223, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A100B5C96E AS DateTime), CAST(0x0000A3A100B5C96E AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1224, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A100BA333F AS DateTime), CAST(0x0000A3A100BA333F AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1225, 0, 2, 59, N'change password succes.', CAST(0x0000A3A100BDE38F AS DateTime), CAST(0x0000A3A100BDE38F AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1226, 0, 2, 59, N'change password succes.', CAST(0x0000A3A100BDF9E2 AS DateTime), CAST(0x0000A3A100BDF9E2 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1227, 0, 2, 59, N'update user success:', CAST(0x0000A3A100BE12FE AS DateTime), CAST(0x0000A3A100BE12FE AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1228, 0, 2, 59, N'update user success:', CAST(0x0000A3A100D6EEBC AS DateTime), CAST(0x0000A3A100D6EEBC AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1229, 0, 2, 59, N'update avatar of user success', CAST(0x0000A3A100D6F261 AS DateTime), CAST(0x0000A3A100D6F261 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1230, 0, 2, 59, N'Update setting success', CAST(0x0000A3A100D84318 AS DateTime), CAST(0x0000A3A100D84318 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1231, 0, 2, 59, N'Update setting success', CAST(0x0000A3A100D89F73 AS DateTime), CAST(0x0000A3A100D89F73 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1232, 0, 2, 59, N'Update setting success', CAST(0x0000A3A100D8D722 AS DateTime), CAST(0x0000A3A100D8D722 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1233, 0, 2, 59, N'Update setting success', CAST(0x0000A3A100D9E5BC AS DateTime), CAST(0x0000A3A100D9E5BC AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1234, 0, 2, 59, N'Update setting success', CAST(0x0000A3A100DAEFE0 AS DateTime), CAST(0x0000A3A100DAEFE0 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1235, 0, 2, 59, N'Update setting success', CAST(0x0000A3A100DC05A7 AS DateTime), CAST(0x0000A3A100DC05A7 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1239, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A100DEA5DD AS DateTime), CAST(0x0000A3A100DEA5DD AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1241, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A100DF9860 AS DateTime), CAST(0x0000A3A100DF9860 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1242, 0, 2, 59, N'Update setting success', CAST(0x0000A3A100E18DCF AS DateTime), CAST(0x0000A3A100E18DCF AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1243, 0, 2, 59, N'Update setting success', CAST(0x0000A3A100E1FFB4 AS DateTime), CAST(0x0000A3A100E1FFB4 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1244, 0, 2, 59, N'Update setting success', CAST(0x0000A3A100E2F5AD AS DateTime), CAST(0x0000A3A100E2F5AD AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1245, 0, 2, 59, N'Update setting success', CAST(0x0000A3A100E3A84E AS DateTime), CAST(0x0000A3A100E3A84E AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1246, 0, 2, 59, N'Update setting success', CAST(0x0000A3A100E3C0D7 AS DateTime), CAST(0x0000A3A100E3C0D7 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1252, 0, 2, 59, N'Update setting success', CAST(0x0000A3A100E86732 AS DateTime), CAST(0x0000A3A100E86732 AS DateTime), N'Chrome', N'192.168.1.50', N'sun.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1253, 0, 2, 59, N'Update setting success', CAST(0x0000A3A100E87161 AS DateTime), CAST(0x0000A3A100E87161 AS DateTime), N'Chrome', N'192.168.1.50', N'sun.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1254, 0, 2, 59, N'Update setting success', CAST(0x0000A3A100E8D724 AS DateTime), CAST(0x0000A3A100E8D724 AS DateTime), N'Chrome', N'192.168.1.50', N'sun.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1256, 0, 2, 59, N'Update setting success', CAST(0x0000A3A100E90D6F AS DateTime), CAST(0x0000A3A100E90D6F AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1260, 10174, 2, 59, N'Update profiles tenant', CAST(0x0000A3A100EA11A4 AS DateTime), CAST(0x0000A3A100EA11A4 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1264, 0, 2, 59, N'update user success:', CAST(0x0000A3A100F0C17E AS DateTime), CAST(0x0000A3A100F0C17E AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1265, 0, 2, 59, N'update avatar of user success', CAST(0x0000A3A100F0C399 AS DateTime), CAST(0x0000A3A100F0C399 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1273, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A100F763A8 AS DateTime), CAST(0x0000A3A100F763A8 AS DateTime), N'Chrome', N'192.168.1.56', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1274, 10222, 2, 59, N'Assigned user for tenant', CAST(0x0000A3A100F764BA AS DateTime), CAST(0x0000A3A100F764BA AS DateTime), N'Chrome', N'192.168.1.56', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1275, 10222, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A3A100F764DD AS DateTime), CAST(0x0000A3A100F764DD AS DateTime), N'Chrome', N'192.168.1.56', N'HungPV-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1276, 10222, 2, 59, N'Update profile', CAST(0x0000A3A100F764F2 AS DateTime), CAST(0x0000A3A100F764F2 AS DateTime), N'Chrome', N'192.168.1.56', N'HungPV-PC', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1279, 10222, 2, 59, N'Update profiles tenant', CAST(0x0000A3A101120697 AS DateTime), CAST(0x0000A3A101120697 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1280, 10221, 2, 59, N'Update profiles tenant', CAST(0x0000A3A101130220 AS DateTime), CAST(0x0000A3A101130220 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1281, 10174, 2, 1, N'Update access right', CAST(0x0000A3A10114403D AS DateTime), CAST(0x0000A3A10114403D AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1282, 0, 2, 59, N'Update access right', CAST(0x0000A3A1011546FB AS DateTime), CAST(0x0000A3A1011546FB AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Access right', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1283, 10171, 2, 59, N'Update profiles tenant', CAST(0x0000A3A101167E93 AS DateTime), CAST(0x0000A3A101167E93 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1284, 0, 2, 59, N'Update setting success', CAST(0x0000A3A1011A24CC AS DateTime), CAST(0x0000A3A1011A24CC AS DateTime), N'Chrome', N'192.168.1.56', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1285, 10222, 1, 1, N'Insert new customer', CAST(0x0000A3A1011CF8C0 AS DateTime), CAST(0x0000A3A1011CF8C0 AS DateTime), N'Chrome', N'192.168.1.56', N'HungPV-PC', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1286, 10222, 3, 1, N'Delete customer.', CAST(0x0000A3A1011D6DA8 AS DateTime), CAST(0x0000A3A1011D6DA8 AS DateTime), N'Chrome', N'192.168.1.56', N'HungPV-PC', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1287, 0, 2, 59, N'Update setting success', CAST(0x0000A3A20093136B AS DateTime), CAST(0x0000A3A20093136B AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1288, 0, 2, 59, N'Update setting success', CAST(0x0000A3A2009416C6 AS DateTime), CAST(0x0000A3A2009416C6 AS DateTime), N'Chrome', N'192.168.1.56', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1290, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A2009921AC AS DateTime), CAST(0x0000A3A2009921AC AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1292, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A2009A00A2 AS DateTime), CAST(0x0000A3A2009A00A2 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1293, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A2009A93DE AS DateTime), CAST(0x0000A3A2009A93DE AS DateTime), N'Chrome', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1294, 0, 2, 59, N'Update setting success', CAST(0x0000A3A2009AB3C2 AS DateTime), CAST(0x0000A3A2009AB3C2 AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1296, 10222, 2, 59, N'Update profiles tenant', CAST(0x0000A3A200A1C671 AS DateTime), CAST(0x0000A3A200A1C671 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1297, 0, 2, 59, N'Update setting success', CAST(0x0000A3A200A91DB7 AS DateTime), CAST(0x0000A3A200A91DB7 AS DateTime), N'Chrome', N'192.168.1.56', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1298, 10222, 1, 1, N'Insert new customer', CAST(0x0000A3A200AB565D AS DateTime), CAST(0x0000A3A200AB565D AS DateTime), N'Chrome', N'192.168.1.56', N'HungPV-PC', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1299, 10222, 2, 1, N'Update customer', CAST(0x0000A3A200AC67A7 AS DateTime), CAST(0x0000A3A200AC67A7 AS DateTime), N'Chrome', N'192.168.1.56', N'HungPV-PC', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1300, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A200B46600 AS DateTime), CAST(0x0000A3A200B46600 AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1301, 10229, 2, 59, N'Assigned user for tenant', CAST(0x0000A3A200B49551 AS DateTime), CAST(0x0000A3A200B49551 AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1302, 10229, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A3A200B4A69B AS DateTime), CAST(0x0000A3A200B4A69B AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1303, 10229, 2, 59, N'Update profile', CAST(0x0000A3A200B4A7DE AS DateTime), CAST(0x0000A3A200B4A7DE AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1304, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A200B534A5 AS DateTime), CAST(0x0000A3A200B534A5 AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1305, 10230, 2, 59, N'Assigned user for tenant', CAST(0x0000A3A200B535A4 AS DateTime), CAST(0x0000A3A200B535A4 AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1306, 10230, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A3A200B535C0 AS DateTime), CAST(0x0000A3A200B535C0 AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1307, 10230, 2, 59, N'Update profile', CAST(0x0000A3A200B535C6 AS DateTime), CAST(0x0000A3A200B535C6 AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1308, 0, 2, 59, N'Update setting success', CAST(0x0000A3A200B54BD9 AS DateTime), CAST(0x0000A3A200B54BD9 AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1310, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A200B6D9CE AS DateTime), CAST(0x0000A3A200B6D9CE AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1311, 10231, 2, 59, N'Assigned user for tenant', CAST(0x0000A3A200B6DADE AS DateTime), CAST(0x0000A3A200B6DADE AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1312, 10231, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A3A200B6DAF7 AS DateTime), CAST(0x0000A3A200B6DAF7 AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1313, 10231, 2, 59, N'Update profile', CAST(0x0000A3A200B6DAFD AS DateTime), CAST(0x0000A3A200B6DAFD AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1315, 10231, 2, 59, N'Update profiles tenant', CAST(0x0000A3A200B83DEE AS DateTime), CAST(0x0000A3A200B83DEE AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1316, 10231, 2, 59, N'Update person contact', CAST(0x0000A3A200B83E02 AS DateTime), CAST(0x0000A3A200B83E02 AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'Tenants', 1)
GO
print 'Processed 1200 total records'
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1318, 0, 2, 59, N'Update setting success', CAST(0x0000A3A200B9E433 AS DateTime), CAST(0x0000A3A200B9E433 AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1319, 0, 2, 59, N'Update setting success', CAST(0x0000A3A200BBBE92 AS DateTime), CAST(0x0000A3A200BBBE93 AS DateTime), N'Chrome', N'192.168.1.56', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1320, 0, 2, 59, N'Update setting success', CAST(0x0000A3A200BB94BD AS DateTime), CAST(0x0000A3A200BB94BD AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1321, 0, 2, 59, N'Update setting success', CAST(0x0000A3A200BB9B38 AS DateTime), CAST(0x0000A3A200BB9B38 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1322, 0, 2, 59, N'Update setting success', CAST(0x0000A3A200BBB6B6 AS DateTime), CAST(0x0000A3A200BBB6B6 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1323, 0, 2, 59, N'Update setting success', CAST(0x0000A3A200BBCAF7 AS DateTime), CAST(0x0000A3A200BBCAF7 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1324, 0, 2, 59, N'Update setting success', CAST(0x0000A3A200BB3DE5 AS DateTime), CAST(0x0000A3A200BB3DE5 AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1325, 0, 2, 59, N'Update setting success', CAST(0x0000A3A200BB5179 AS DateTime), CAST(0x0000A3A200BB5179 AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1326, 0, 2, 59, N'Update setting success', CAST(0x0000A3A200BB8CDA AS DateTime), CAST(0x0000A3A200BB8CDA AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1327, 0, 2, 59, N'Update setting success', CAST(0x0000A3A200BBAB93 AS DateTime), CAST(0x0000A3A200BBAB93 AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1328, 0, 2, 59, N'Update setting success', CAST(0x0000A3A200BBBE1A AS DateTime), CAST(0x0000A3A200BBBE1A AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1329, 10173, 2, 1, N'Edit contact', CAST(0x0000A3A200BD175A AS DateTime), CAST(0x0000A3A200BD175A AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1330, 10173, 2, 1, N'Edit contact', CAST(0x0000A3A200BFD651 AS DateTime), CAST(0x0000A3A200BFD651 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1331, 0, 2, 59, N'Update tenant', CAST(0x0000A3A200C5789E AS DateTime), CAST(0x0000A3A200C5789E AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1332, 10231, 2, 59, N'Update profiles tenant', CAST(0x0000A3A200C57ABB AS DateTime), CAST(0x0000A3A200C57ABB AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1333, 0, 2, 59, N'Update tenant', CAST(0x0000A3A200C5C9B3 AS DateTime), CAST(0x0000A3A200C5C9B3 AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1334, 10231, 2, 59, N'Update profiles tenant', CAST(0x0000A3A200C5D0E5 AS DateTime), CAST(0x0000A3A200C5D0E5 AS DateTime), N'Chrome', N'127.0.0.1', N'quynh-PC.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1335, 10231, 1, 1, N'Save avatar image.', CAST(0x0000A3A200D837C4 AS DateTime), CAST(0x0000A3A200D837C4 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1336, 10231, 1, 1, N'Insert new customer', CAST(0x0000A3A200D83F5E AS DateTime), CAST(0x0000A3A200D83F5E AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1337, 10231, 1, 1, N'Save avatar image.', CAST(0x0000A3A200D87965 AS DateTime), CAST(0x0000A3A200D87965 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1338, 10231, 1, 1, N'Save avatar image.', CAST(0x0000A3A200D88828 AS DateTime), CAST(0x0000A3A200D88828 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1339, 10231, 1, 1, N'Save avatar image.', CAST(0x0000A3A200D89230 AS DateTime), CAST(0x0000A3A200D89230 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1340, 0, 2, 59, N'Update setting success', CAST(0x0000A3A200D972B8 AS DateTime), CAST(0x0000A3A200D972B8 AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1341, 0, 2, 59, N'Update setting success', CAST(0x0000A3A200D98C2C AS DateTime), CAST(0x0000A3A200D98C2C AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1342, 10231, 1, 1, N'Insert new customer', CAST(0x0000A3A200D9F23D AS DateTime), CAST(0x0000A3A200D9F23D AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1343, 10231, 1, 1, N'Save avatar image.', CAST(0x0000A3A200DA130E AS DateTime), CAST(0x0000A3A200DA130E AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1344, 10231, 1, 1, N'Create contact', CAST(0x0000A3A200DA81C7 AS DateTime), CAST(0x0000A3A200DA81C7 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1345, 10231, 1, 1, N'Create contact', CAST(0x0000A3A200DAC554 AS DateTime), CAST(0x0000A3A200DAC554 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1346, 10231, 2, 1, N'Edit contact', CAST(0x0000A3A200DB01D7 AS DateTime), CAST(0x0000A3A200DB01D7 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1347, 10231, 2, 1, N'Edit contact', CAST(0x0000A3A200DB1E03 AS DateTime), CAST(0x0000A3A200DB1E03 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1348, 10231, 2, 1, N'Update customer', CAST(0x0000A3A200DCF549 AS DateTime), CAST(0x0000A3A200DCF549 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1349, 10231, 2, 1, N'Update customer', CAST(0x0000A3A200DD407A AS DateTime), CAST(0x0000A3A200DD407A AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1350, 10231, 2, 1, N'Update customer', CAST(0x0000A3A200DDA9D0 AS DateTime), CAST(0x0000A3A200DDA9D0 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1351, 10231, 1, 1, N'Save avatar image.', CAST(0x0000A3A200DDC69D AS DateTime), CAST(0x0000A3A200DDC69D AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1352, 10231, 1, 1, N'Save avatar image.', CAST(0x0000A3A200E06507 AS DateTime), CAST(0x0000A3A200E06507 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1353, 10231, 1, 1, N'Insert new customer', CAST(0x0000A3A200E06AC3 AS DateTime), CAST(0x0000A3A200E06AC3 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1354, 0, 2, 59, N'Update setting success', CAST(0x0000A3A200DEF474 AS DateTime), CAST(0x0000A3A200DEF474 AS DateTime), N'Chrome', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1355, 10231, 1, 1, N'Insert new customer', CAST(0x0000A3A200E12114 AS DateTime), CAST(0x0000A3A200E12114 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1356, 10231, 1, 1, N'Insert new customer', CAST(0x0000A3A200E1BC1A AS DateTime), CAST(0x0000A3A200E1BC1A AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1357, 10231, 2, 1, N'Update customer', CAST(0x0000A3A200E20010 AS DateTime), CAST(0x0000A3A200E20010 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1358, 10231, 2, 1, N'Update customer', CAST(0x0000A3A200E22AFB AS DateTime), CAST(0x0000A3A200E22AFB AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1359, 10231, 2, 1, N'Edit contact', CAST(0x0000A3A200E25A68 AS DateTime), CAST(0x0000A3A200E25A68 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1360, 10231, 2, 1, N'Update customer', CAST(0x0000A3A200E29BB5 AS DateTime), CAST(0x0000A3A200E29BB5 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1361, 0, 2, 59, N'Update setting success', CAST(0x0000A3A200E3E530 AS DateTime), CAST(0x0000A3A200E3E530 AS DateTime), N'Chrome', N'192.168.1.56', N'tholechi-pc.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1363, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A200E7E8BC AS DateTime), CAST(0x0000A3A200E7E8BC AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1364, 10232, 2, 59, N'Assigned user for tenant', CAST(0x0000A3A200E7E9FF AS DateTime), CAST(0x0000A3A200E7E9FF AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1365, 10232, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A3A200E7EA1C AS DateTime), CAST(0x0000A3A200E7EA1C AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1366, 10232, 2, 59, N'Update profile', CAST(0x0000A3A200E7EA38 AS DateTime), CAST(0x0000A3A200E7EA38 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1367, 10232, 1, 1, N'Insert new customer', CAST(0x0000A3A200E88E76 AS DateTime), CAST(0x0000A3A200E88E76 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1368, 10232, 1, 1, N'Insert new customer', CAST(0x0000A3A200E902D4 AS DateTime), CAST(0x0000A3A200E902D4 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1369, 10232, 1, 1, N'Insert new customer', CAST(0x0000A3A200EB6C46 AS DateTime), CAST(0x0000A3A200EB6C46 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1371, 10232, 2, 1, N'Update customer', CAST(0x0000A3A200ED2A06 AS DateTime), CAST(0x0000A3A200ED2A06 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1374, 10232, 2, 1, N'Update customer', CAST(0x0000A3A200ED42F5 AS DateTime), CAST(0x0000A3A200ED42F5 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1375, 10232, 2, 1, N'Update customer', CAST(0x0000A3A200ED587A AS DateTime), CAST(0x0000A3A200ED587A AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1379, 10232, 1, 1, N'Insert new customer', CAST(0x0000A3A200EF2E40 AS DateTime), CAST(0x0000A3A200EF2E40 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1382, 10232, 2, 1, N'Edit contact', CAST(0x0000A3A200F099ED AS DateTime), CAST(0x0000A3A200F099ED AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1383, 10232, 2, 1, N'Edit contact', CAST(0x0000A3A200F0BFFC AS DateTime), CAST(0x0000A3A200F0BFFC AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1384, 10232, 2, 1, N'Edit contact', CAST(0x0000A3A200F0E198 AS DateTime), CAST(0x0000A3A200F0E198 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1386, 10232, 2, 1, N'Edit contact', CAST(0x0000A3A200F0F726 AS DateTime), CAST(0x0000A3A200F0F726 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1388, 10232, 1, 1, N'Create contact', CAST(0x0000A3A200F2DF70 AS DateTime), CAST(0x0000A3A200F2DF70 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1392, 10232, 1, 1, N'Create contact', CAST(0x0000A3A200F6DC4F AS DateTime), CAST(0x0000A3A200F6DC4F AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1394, 10232, 1, 1, N'Create contact', CAST(0x0000A3A200F75BDF AS DateTime), CAST(0x0000A3A200F75BDF AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1395, 10232, 2, 1, N'Edit contact', CAST(0x0000A3A200F76E41 AS DateTime), CAST(0x0000A3A200F76E41 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1396, 0, 2, 59, N'Update setting success', CAST(0x0000A3A200F95942 AS DateTime), CAST(0x0000A3A200F95942 AS DateTime), N'Chrome', N'192.168.1.56', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1397, 10173, 2, 1, N'Edit contact', CAST(0x0000A3A200F8FEC1 AS DateTime), CAST(0x0000A3A200F8FEC1 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1398, 10173, 2, 1, N'Edit contact', CAST(0x0000A3A200F8FEF7 AS DateTime), CAST(0x0000A3A200F8FEF7 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1399, 10173, 2, 1, N'Edit contact', CAST(0x0000A3A200F90994 AS DateTime), CAST(0x0000A3A200F90994 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1400, 10173, 2, 1, N'Edit contact', CAST(0x0000A3A200F90A31 AS DateTime), CAST(0x0000A3A200F90A31 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1401, 10173, 2, 1, N'Edit contact', CAST(0x0000A3A200F937FD AS DateTime), CAST(0x0000A3A200F937FD AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1402, 10173, 2, 1, N'Edit contact', CAST(0x0000A3A200F9814B AS DateTime), CAST(0x0000A3A200F9814B AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1405, 10222, 1, 1, N'Create contact', CAST(0x0000A3A200FC898B AS DateTime), CAST(0x0000A3A200FC898B AS DateTime), N'Chrome', N'192.168.1.56', N'HungPV-PC', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1406, 10222, 2, 1, N'Edit contact', CAST(0x0000A3A200FCC522 AS DateTime), CAST(0x0000A3A200FCC522 AS DateTime), N'Chrome', N'192.168.1.56', N'HungPV-PC', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1408, 10232, 1, 1, N'Insert new customer', CAST(0x0000A3A201069DAC AS DateTime), CAST(0x0000A3A201069DAC AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1409, 10173, 2, 1, N'Edit contact', CAST(0x0000A3A20105D112 AS DateTime), CAST(0x0000A3A20105D112 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1410, 10232, 2, 1, N'Edit contact', CAST(0x0000A3A20107F932 AS DateTime), CAST(0x0000A3A20107F932 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1411, 10173, 2, 1, N'Edit contact', CAST(0x0000A3A201064ABD AS DateTime), CAST(0x0000A3A201064ABD AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1412, 10173, 2, 1, N'Edit contact', CAST(0x0000A3A20106BA25 AS DateTime), CAST(0x0000A3A20106BA25 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1413, 0, 2, 59, N'Update setting success', CAST(0x0000A3A20109DFA6 AS DateTime), CAST(0x0000A3A20109DFA6 AS DateTime), N'Chrome', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1414, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A2010D3F4F AS DateTime), CAST(0x0000A3A2010D3F4F AS DateTime), N'Chrome', N'192.168.1.56', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1415, 10233, 2, 59, N'Assigned user for tenant', CAST(0x0000A3A2010D40E5 AS DateTime), CAST(0x0000A3A2010D40E5 AS DateTime), N'Chrome', N'192.168.1.56', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1416, 10233, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A3A2010D410D AS DateTime), CAST(0x0000A3A2010D410D AS DateTime), N'Chrome', N'192.168.1.56', N'HungPV-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1417, 10233, 1, 59, N'Insert user tenant admin', CAST(0x0000A3A2010D424E AS DateTime), CAST(0x0000A3A2010D424E AS DateTime), N'Chrome', N'192.168.1.56', N'HungPV-PC', N'Desktop', N'Users', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1426, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A2010E5168 AS DateTime), CAST(0x0000A3A2010E5168 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1427, 10236, 2, 59, N'Assigned user for tenant', CAST(0x0000A3A2010E5288 AS DateTime), CAST(0x0000A3A2010E5288 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1428, 10236, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A3A2010E52A4 AS DateTime), CAST(0x0000A3A2010E52A4 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1429, 10236, 2, 59, N'Update profile', CAST(0x0000A3A2010E52B7 AS DateTime), CAST(0x0000A3A2010E52B7 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1430, 10236, 2, 59, N'Update profiles tenant', CAST(0x0000A3A2010EB921 AS DateTime), CAST(0x0000A3A2010EB921 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1436, 10236, 1, 1, N'Create contact', CAST(0x0000A3A2010FDFF7 AS DateTime), CAST(0x0000A3A2010FDFF7 AS DateTime), N'Chrome', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1441, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A20112FAB6 AS DateTime), CAST(0x0000A3A20112FAB6 AS DateTime), N'Chrome', N'192.168.1.56', N'HungPV-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1442, 10239, 2, 59, N'Assigned user for tenant', CAST(0x0000A3A20112FB8E AS DateTime), CAST(0x0000A3A20112FB8E AS DateTime), N'Chrome', N'192.168.1.56', N'HungPV-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1443, 10239, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A3A20112FBB7 AS DateTime), CAST(0x0000A3A20112FBB7 AS DateTime), N'Chrome', N'192.168.1.56', N'HungPV-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1444, 10239, 2, 59, N'Update profile', CAST(0x0000A3A20112FBC0 AS DateTime), CAST(0x0000A3A20112FBC0 AS DateTime), N'Chrome', N'192.168.1.56', N'HungPV-PC', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1446, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A2011626BB AS DateTime), CAST(0x0000A3A2011626BB AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1447, 10240, 2, 59, N'Assigned user for tenant', CAST(0x0000A3A2011627D8 AS DateTime), CAST(0x0000A3A2011627D8 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1448, 10240, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A3A2011627EB AS DateTime), CAST(0x0000A3A2011627EB AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1449, 10240, 2, 59, N'Update profile', CAST(0x0000A3A2011627F0 AS DateTime), CAST(0x0000A3A2011627F0 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1450, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A20119FE04 AS DateTime), CAST(0x0000A3A20119FE04 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1452, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A2011A34E7 AS DateTime), CAST(0x0000A3A2011A34E7 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1453, 10241, 2, 59, N'Assigned user for tenant', CAST(0x0000A3A2011A35D1 AS DateTime), CAST(0x0000A3A2011A35D1 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1454, 10241, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A3A2011A35DF AS DateTime), CAST(0x0000A3A2011A35DF AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1455, 10241, 2, 59, N'Update profile', CAST(0x0000A3A2011A35E4 AS DateTime), CAST(0x0000A3A2011A35E4 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Setting', 1)
GO
print 'Processed 1300 total records'
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1467, 10239, 1, 1, N'Create contact', CAST(0x0000A3A300BAC8A8 AS DateTime), CAST(0x0000A3A300BAC8A8 AS DateTime), N'Chrome', N'192.168.2.110', N'HungPV-PC', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1468, 10239, 1, 1, N'Insert new customer', CAST(0x0000A3A300BB01F7 AS DateTime), CAST(0x0000A3A300BB01F7 AS DateTime), N'Chrome', N'192.168.2.110', N'HungPV-PC', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1469, 10239, 2, 1, N'Edit contact', CAST(0x0000A3A300BB16AC AS DateTime), CAST(0x0000A3A300BB16AC AS DateTime), N'Chrome', N'192.168.2.110', N'HungPV-PC', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1470, 10236, 1, 1, N'Insert new customer', CAST(0x0000A3A300D91087 AS DateTime), CAST(0x0000A3A300D91087 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Customers', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1471, 10236, 1, 1, N'Insert new customer', CAST(0x0000A3A300D969F3 AS DateTime), CAST(0x0000A3A300D969F3 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Customers', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1472, 10236, 1, 1, N'Insert new customer', CAST(0x0000A3A300D98284 AS DateTime), CAST(0x0000A3A300D98284 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Customers', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1473, 10236, 1, 1, N'Insert new customer', CAST(0x0000A3A300D9CCC9 AS DateTime), CAST(0x0000A3A300D9CCC9 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Customers', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1474, 10236, 1, 1, N'Insert new customer', CAST(0x0000A3A300DA6F71 AS DateTime), CAST(0x0000A3A300DA6F71 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Customers', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1475, 10236, 1, 1, N'Insert new customer', CAST(0x0000A3A300DC6F4B AS DateTime), CAST(0x0000A3A300DC6F4B AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Customers', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1476, 10236, 2, 1, N'Edit contact', CAST(0x0000A3A300DCB8AE AS DateTime), CAST(0x0000A3A300DCB8AE AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1477, 10236, 2, 1, N'Edit contact', CAST(0x0000A3A300DD91B4 AS DateTime), CAST(0x0000A3A300DD91B4 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1478, 10236, 2, 1, N'Edit contact', CAST(0x0000A3A300DF09B8 AS DateTime), CAST(0x0000A3A300DF09B8 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1479, 10236, 2, 1, N'Edit contact', CAST(0x0000A3A300DF1A22 AS DateTime), CAST(0x0000A3A300DF1A22 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1480, 10236, 2, 1, N'Edit contact', CAST(0x0000A3A300E083BB AS DateTime), CAST(0x0000A3A300E083BB AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1482, 10236, 2, 1, N'Edit contact', CAST(0x0000A3A300E2EDA7 AS DateTime), CAST(0x0000A3A300E2EDA7 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'Contact', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1483, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A300F2DB38 AS DateTime), CAST(0x0000A3A300F2DB38 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1484, 10243, 2, 59, N'Assigned user for tenant', CAST(0x0000A3A300F2DD25 AS DateTime), CAST(0x0000A3A300F2DD25 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1485, 10243, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A3A300F2DD45 AS DateTime), CAST(0x0000A3A300F2DD45 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1486, 10243, 2, 59, N'Update profile', CAST(0x0000A3A300F2DD58 AS DateTime), CAST(0x0000A3A300F2DD58 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1487, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A300F48DDF AS DateTime), CAST(0x0000A3A300F48DDF AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1488, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A300F5BFA8 AS DateTime), CAST(0x0000A3A300F5BFA8 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1489, 0, 2, 59, N'Update setting success', CAST(0x0000A3A300F50E9F AS DateTime), CAST(0x0000A3A300F50E9F AS DateTime), N'Chrome', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1490, 0, 2, 59, N'Update setting success', CAST(0x0000A3A301091FE6 AS DateTime), CAST(0x0000A3A301091FE6 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1491, 0, 2, 59, N'Update setting success', CAST(0x0000A3A30109302F AS DateTime), CAST(0x0000A3A30109302F AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1492, 0, 2, 59, N'Update setting success', CAST(0x0000A3A301093F52 AS DateTime), CAST(0x0000A3A301093F52 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1493, 10243, 2, 59, N'Update profiles tenant', CAST(0x0000A3A3010E55E5 AS DateTime), CAST(0x0000A3A3010E55E5 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1494, 10241, 2, 59, N'Update profiles tenant', CAST(0x0000A3A3010F12A7 AS DateTime), CAST(0x0000A3A3010F12A7 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1495, 0, 1, 59, N'Insert new user success', CAST(0x0000A3A3010FB362 AS DateTime), CAST(0x0000A3A3010FB362 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1496, 0, 2, 59, N'change password succes.', CAST(0x0000A3A301100416 AS DateTime), CAST(0x0000A3A301100416 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1497, 0, 2, 59, N'change password succes.', CAST(0x0000A3A301108474 AS DateTime), CAST(0x0000A3A301108474 AS DateTime), N'Chrome', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1498, 0, 2, 59, N'change password succes.', CAST(0x0000A3A3011112A3 AS DateTime), CAST(0x0000A3A3011112A3 AS DateTime), N'Chrome', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1499, 0, 2, 59, N'change password succes.', CAST(0x0000A3A30111CAFB AS DateTime), CAST(0x0000A3A30111CAFB AS DateTime), N'Chrome', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1500, 10237, 1, 1, N'Save avatar image.', CAST(0x0000A3A301120D2E AS DateTime), CAST(0x0000A3A301120D2E AS DateTime), N'Firefox', N'192.168.1.55', N'dao-PC', N'Desktop', N'Customers', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1501, 10237, 1, 1, N'Save avatar image.', CAST(0x0000A3A301121E8C AS DateTime), CAST(0x0000A3A301121E8C AS DateTime), N'Firefox', N'192.168.1.55', N'dao-PC', N'Desktop', N'Customers', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1502, 10237, 1, 1, N'Save avatar image.', CAST(0x0000A3A301122930 AS DateTime), CAST(0x0000A3A301122930 AS DateTime), N'Firefox', N'192.168.1.55', N'dao-PC', N'Desktop', N'Customers', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1503, 10237, 1, 1, N'Save avatar image.', CAST(0x0000A3A3011233C0 AS DateTime), CAST(0x0000A3A3011233C0 AS DateTime), N'Firefox', N'192.168.1.55', N'dao-PC', N'Desktop', N'Customers', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1504, 10237, 1, 1, N'Save avatar image.', CAST(0x0000A3A3011264E2 AS DateTime), CAST(0x0000A3A3011264E2 AS DateTime), N'Firefox', N'192.168.1.55', N'dao-PC', N'Desktop', N'Customers', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1505, 10237, 1, 1, N'Save avatar image.', CAST(0x0000A3A301127E4C AS DateTime), CAST(0x0000A3A301127E4C AS DateTime), N'Firefox', N'192.168.1.55', N'dao-PC', N'Desktop', N'Customers', 0)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1506, 0, 1, 59, N'Created new tenant', CAST(0x0000A3A301133258 AS DateTime), CAST(0x0000A3A301133258 AS DateTime), N'Firefox', N'192.168.1.55', N'dao-PC', N'Desktop', N'Tenants', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1507, 10244, 2, 59, N'Assigned user for tenant', CAST(0x0000A3A30113335A AS DateTime), CAST(0x0000A3A30113335A AS DateTime), N'Firefox', N'192.168.1.55', N'dao-PC', N'Desktop', N'Tenant', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1508, 10244, 1, 59, N'Insert role tenant admin for user', CAST(0x0000A3A30113336E AS DateTime), CAST(0x0000A3A30113336E AS DateTime), N'Firefox', N'192.168.1.55', N'dao-PC', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1509, 10244, 2, 59, N'Update profile', CAST(0x0000A3A30113338A AS DateTime), CAST(0x0000A3A30113338A AS DateTime), N'Firefox', N'192.168.1.55', N'dao-PC', N'Desktop', N'Setting', 1)
INSERT [dbo].[crm_Logs] ([tk], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1510, 10244, 1, 1, N'Insert new customer', CAST(0x0000A3A301142745 AS DateTime), CAST(0x0000A3A301142745 AS DateTime), N'Firefox', N'192.168.1.55', N'dao-PC', N'Desktop', N'Customers', 1)
SET IDENTITY_INSERT [dbo].[crm_Logs] OFF
/****** Object:  Table [dbo].[crm_LogAction]    Script Date: 09/30/2014 16:33:11 ******/
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
/****** Object:  Table [dbo].[crm_EmailQueues]    Script Date: 09/30/2014 16:33:11 ******/
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
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (32, 0, N'ForGet Password', NULL, N'admin@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A3860096172E AS DateTime), CAST(0x0000A3860096172E AS DateTime), N'127.0.0.1', 59)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (34, 0, N'ForGet Password', NULL, N'admin@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A3860123E303 AS DateTime), CAST(0x0000A3860123E303 AS DateTime), N'127.0.0.1', 59)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (36, 0, N'ForGet Password', NULL, N'admin@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A3860126F173 AS DateTime), CAST(0x0000A3860126F173 AS DateTime), N'127.0.0.1', 59)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (37, 1, N'ForGet Password', NULL, N'admin@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A3860128523C AS DateTime), CAST(0x0000A3860128523D AS DateTime), N'127.0.0.1', 59)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (38, 1, N'ForGet Password', NULL, N'admin@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A38700E5A671 AS DateTime), CAST(0x0000A38700E5A671 AS DateTime), N'127.0.0.1', 59)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (39, 1, N'ForGet Password', NULL, N'admin@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A38700E6033E AS DateTime), CAST(0x0000A38700E603A2 AS DateTime), N'127.0.0.1', 59)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (40, 0, N'ForGet Password', NULL, N'admin@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A38700E66D88 AS DateTime), CAST(0x0000A38700E66D88 AS DateTime), N'127.0.0.1', 59)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (43, 0, N'ForGet Password', NULL, N'admin@cateno.no', NULL, N'quynhnd@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A38E00DBB6A3 AS DateTime), CAST(0x0000A38E00DBB6A3 AS DateTime), N'127.0.0.1', 78)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (44, 1, N'Contact Us', N'Quynhnd', N'quynhnd@cateno.no', NULL, N'quynhnd@cateno.no', N'quynhnd@cateno.no', N'quynhnd@cateno.no', NULL, 1, NULL, CAST(0x0000A38F00B038B2 AS DateTime), CAST(0x0000A38F00B038B2 AS DateTime), N'127.0.0.1', 0)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (45, 0, N'ForGet Password', NULL, N'admin@cateno.no', NULL, N'quynhnd@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A3A30121573F AS DateTime), CAST(0x0000A3A30121573F AS DateTime), N'192.168.1.68', 81)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (9, 0, N'ForGet Password', N'Hung', N'yourEmailid@gmail.com', NULL, N'hung@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', NULL, 1, NULL, CAST(0x0000A35E00FE0101 AS DateTime), CAST(0x0000A35E00FE0101 AS DateTime), N'127.0.0.1', 1)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (10, 0, N'ForGet Password', N'Hung', N'yourEmailid@gmail.com', NULL, N'hung@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', NULL, 1, NULL, CAST(0x0000A35E00FE021F AS DateTime), CAST(0x0000A35E00FE021F AS DateTime), N'127.0.0.1', 1)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (11, 1, N'ForGet Password', N'Hung', N'thinhnt@cateno.no', NULL, N'hungpv@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', N'thinhnt@cateno.no,hung@cateno.no', NULL, 1, NULL, CAST(0x0000A35E0101C987 AS DateTime), CAST(0x0000A35E0101C987 AS DateTime), N'127.0.0.1', 1)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (35, 0, N'ForGet Password', NULL, N'admin@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A3860125EA00 AS DateTime), CAST(0x0000A3860125EA00 AS DateTime), N'127.0.0.1', 59)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (41, 0, N'ForGet Password', NULL, N'admin@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A38700E89D64 AS DateTime), CAST(0x0000A38700E89D64 AS DateTime), N'127.0.0.1', 59)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (18, 0, N'ForGet Password', NULL, N'thinhnt@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A3770113C1C9 AS DateTime), CAST(0x0000A3770113C1C9 AS DateTime), N'127.0.0.1', 52)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (21, 1, N'ForGet Password', NULL, N'thinhnt@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A37800B097B6 AS DateTime), CAST(0x0000A37800B097B6 AS DateTime), N'127.0.0.1', 52)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (28, 1, N'ForGet Password', NULL, N'thinhnt@cateno.no', NULL, N'hungpv@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A37801143132 AS DateTime), CAST(0x0000A37801143132 AS DateTime), N'::1', 1)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (42, 0, N'ForGet Password', NULL, N'admin@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A38700E8CE27 AS DateTime), CAST(0x0000A38700E8CE27 AS DateTime), N'127.0.0.1', 59)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (23, 1, N'ForGet Password', NULL, N'thinhnt@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A37800CE2BB7 AS DateTime), CAST(0x0000A37800CE2BB7 AS DateTime), N'127.0.0.1', 52)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (29, 1, N'ForGet Password', NULL, N'admin@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A3780158B0BC AS DateTime), CAST(0x0000A3780158B0BC AS DateTime), N'127.0.0.1', 52)
INSERT [dbo].[crm_EmailQueues] ([ID], [Active], [EmailSubject], [DisplayNameFrom], [EmailFrom], [DisplayNameTo], [EmailTo], [EmailCc], [EmailBcc], [EmailBody], [IsHtmlContent], [Description], [CreatedDate], [UpdatedDate], [SenderIP], [SendBy]) VALUES (33, 0, N'ForGet Password', NULL, N'admin@cateno.no', NULL, N'thinhnt@cateno.no', N'', N'', NULL, 1, NULL, CAST(0x0000A386009853AB AS DateTime), CAST(0x0000A386009853AB AS DateTime), N'127.0.0.1', 59)
SET IDENTITY_INSERT [dbo].[crm_EmailQueues] OFF
/****** Object:  Table [dbo].[crm_DocumentTypes]    Script Date: 09/30/2014 16:33:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_DocumentTypes](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crm_Project_Permissions_Groups]    Script Date: 09/30/2014 16:33:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Project_Permissions_Groups](
	[GroupId] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crm_ProjectCategories]    Script Date: 09/30/2014 16:33:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_ProjectCategories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](200) NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crm_Customers]    Script Date: 09/30/2014 16:33:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[OrgNumber] [nvarchar](20) NOT NULL,
	[PostedAddress] [nvarchar](200) NULL,
	[VisitingAddress] [nvarchar](200) NULL,
	[Email] [nvarchar](100) NULL,
	[Fax] [nvarchar](20) NULL,
	[Street] [nvarchar](200) NULL,
	[Website] [nvarchar](200) NULL,
	[City] [nvarchar](200) NULL,
	[State] [int] NULL,
	[ZipCode] [nvarchar](50) NULL,
	[CountryId] [int] NULL,
	[Description] [text] NULL,
	[CustomerLogo] [nvarchar](200) NULL,
	[CustomerGroup] [nvarchar](100) NULL,
	[CustomerAdditionalInfo] [text] NULL,
	[LinkedURL] [nvarchar](200) NULL,
	[FacebookURL] [nvarchar](200) NULL,
	[TwitterURL] [nvarchar](200) NULL,
	[GoogleplusURL] [nvarchar](200) NULL,
	[CreatedBy] [int] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [int] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crm_Tenants]    Script Date: 09/30/2014 16:33:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Tenants](
	[TenantId] [int] IDENTITY(10000,1) NOT NULL,
	[AssignedUserId] [int] NULL,
	[TenantName] [nvarchar](200) NULL,
	[TenantNameAlias] [nvarchar](200) NULL,
	[OrgNumber] [nvarchar](20) NULL,
	[DbName] [nvarchar](50) NULL,
	[DbUsername] [nvarchar](50) NULL,
	[DbPassword] [nvarchar](50) NULL,
	[Phone] [nvarchar](25) NULL,
	[Email] [nvarchar](100) NULL,
	[Fax] [nvarchar](50) NULL,
	[Website] [nvarchar](200) NULL,
	[CountryId] [int] NULL,
	[CompanyLogo] [nvarchar](200) NULL,
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
	[PostedDistrict] [nvarchar](200) NULL,
	[PostedNumber] [nvarchar](200) NULL,
	[VisitingAddress] [nvarchar](200) NULL,
	[VisitingDistrict] [nvarchar](200) NULL,
	[VisitingNumber] [nvarchar](200) NULL,
	[ExpiryDate] [datetime] NULL,
	[NumberOfUsers] [int] NULL,
	[NumberOfProjects] [int] NULL,
	[NumberOfCustomers] [int] NULL,
	[PackageName] [nvarchar](100) NULL,
 CONSTRAINT [PK__crm_Tena__2E9B47E10AD2A005] PRIMARY KEY CLUSTERED 
(
	[TenantId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[crm_Tenants] ON
INSERT [dbo].[crm_Tenants] ([TenantId], [AssignedUserId], [TenantName], [TenantNameAlias], [OrgNumber], [DbName], [DbUsername], [DbPassword], [Phone], [Email], [Fax], [Website], [CountryId], [CompanyLogo], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Active], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Information], [PostedAddress], [PostedDistrict], [PostedNumber], [VisitingAddress], [VisitingDistrict], [VisitingNumber], [ExpiryDate], [NumberOfUsers], [NumberOfProjects], [NumberOfCustomers], [PackageName]) VALUES (10162, 3, N'Hoang Thuy', N'demo1506', N'1506', N'MultiOrg_demo1506', N'demo1506', N'demo1506', N'84933389128', N'demo1506@gmail.com', N'1234', N'multiorg.cateno.vn/demo1506/', 1, N'/tenants/demo1506/default.png', 59, CAST(0x0000A38C00F932A9 AS DateTime), 59, CAST(0x0000A3AB009FFDAD AS DateTime), 1, N'http://www.linkedIn.com/', N'http://www.facebook.com/', N'http://www.twitter.com/1234444', N'https://www.google.com.vn/', N'INFO', N'231/23 Duong Ba Trac, P.1, Q.8', N'SANDVIKA', N'1337', N'123', N'SNARØYA', N'1335', CAST(0x0000A3B600000000 AS DateTime), 3, 3, 3, N'AAA')
INSERT [dbo].[crm_Tenants] ([TenantId], [AssignedUserId], [TenantName], [TenantNameAlias], [OrgNumber], [DbName], [DbUsername], [DbPassword], [Phone], [Email], [Fax], [Website], [CountryId], [CompanyLogo], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Active], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Information], [PostedAddress], [PostedDistrict], [PostedNumber], [VisitingAddress], [VisitingDistrict], [VisitingNumber], [ExpiryDate], [NumberOfUsers], [NumberOfProjects], [NumberOfCustomers], [PackageName]) VALUES (10261, 1, N'Quynh0922', N'Quynh0922', N'0922', N'CRM_Quynh0922', N'Quynh0922', N'Quynh0922', N'0987656565', N'quynhnd@cateno.no', N'0922', N'Quynh0922', 1, N'/tenants/Quynh0922/default.png', 59, CAST(0x0000A3B000A2A79F AS DateTime), 59, CAST(0x0000A3B000FC0BB4 AS DateTime), 1, NULL, NULL, NULL, NULL, N'Information', N'Etown1, 364 Cong Hoa Street, Tan Binh District, Ho Chi Minh City', N'Tan Binh District', N'23232', N'Etown1, 364 Cong Hoa Street, Tan Binh District, Ho Chi Minh City', N'Tan Binh District', N'2323', CAST(0x0000A7F900000000 AS DateTime), 301, 101, 201, N'Package.PackageName.Standard')
INSERT [dbo].[crm_Tenants] ([TenantId], [AssignedUserId], [TenantName], [TenantNameAlias], [OrgNumber], [DbName], [DbUsername], [DbPassword], [Phone], [Email], [Fax], [Website], [CountryId], [CompanyLogo], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Active], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Information], [PostedAddress], [PostedDistrict], [PostedNumber], [VisitingAddress], [VisitingDistrict], [VisitingNumber], [ExpiryDate], [NumberOfUsers], [NumberOfProjects], [NumberOfCustomers], [PackageName]) VALUES (10262, 1, N'TestCRM', N'TestCRM', N'132412341', N'CRM_TestCRM', N'TestCRM', N'TestCRM', NULL, N'TestCRM@yahoo.com', NULL, N'TestCRM', 4, N'/tenants/TestCRM/default.png', 59, CAST(0x0000A3B201240704 AS DateTime), 59, CAST(0x0000A3B201240704 AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, N'1337', N'SANDVIKA', N'1337', NULL, NULL, NULL, CAST(0x0000A7FA00000000 AS DateTime), 5, 5, 5, N'Package.PackageName.Basic')
INSERT [dbo].[crm_Tenants] ([TenantId], [AssignedUserId], [TenantName], [TenantNameAlias], [OrgNumber], [DbName], [DbUsername], [DbPassword], [Phone], [Email], [Fax], [Website], [CountryId], [CompanyLogo], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Active], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Information], [PostedAddress], [PostedDistrict], [PostedNumber], [VisitingAddress], [VisitingDistrict], [VisitingNumber], [ExpiryDate], [NumberOfUsers], [NumberOfProjects], [NumberOfCustomers], [PackageName]) VALUES (10263, 1, N'Do Hoang Thinh', N'dohoangthinh', N'333222', N'CRM_dohoangthinh', N'dohoangthinh', N'dohoangthinh', N'08433332222', N'dohoangthinh@gmail.com', N'3322', N'dohoangthinh', 1, N'/tenants/dohoangthinh/10149387_278270892339632_1149065227_n.jpg', 59, CAST(0x0000A3B500A0E306 AS DateTime), 59, CAST(0x0000A3B500A0E306 AS DateTime), 1, N'http://www.linkedIn.com/', N'http://www.facebook.com/', N'http://www.twitter.com/', N'http://www.google.com/', N'Information', N'ETown1, 364 Cong Hoa Street, Tan Binh District, Ho Chi Minh City, Vietnam', N'Tan Binh District', N'3322', N'ETown1, 364 Cong Hoa Street, Tan Binh District, Ho Chi Minh City, Vietnam', N'Tan Binh District', N'3322', CAST(0x0000A7FD00000000 AS DateTime), 301, 101, 201, N'Package.PackageName.Standard')
INSERT [dbo].[crm_Tenants] ([TenantId], [AssignedUserId], [TenantName], [TenantNameAlias], [OrgNumber], [DbName], [DbUsername], [DbPassword], [Phone], [Email], [Fax], [Website], [CountryId], [CompanyLogo], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Active], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Information], [PostedAddress], [PostedDistrict], [PostedNumber], [VisitingAddress], [VisitingDistrict], [VisitingNumber], [ExpiryDate], [NumberOfUsers], [NumberOfProjects], [NumberOfCustomers], [PackageName]) VALUES (10264, 1, N'Quynh0911', N'Quynhnd0911', N'0911', N'CRM_Quynhnd0911', N'Quynhnd0911', N'Quynhnd0911', N'0937565656', N'Quynhnd@cateno.no', N'0937', N'Quynhnd0911', 1, N'/tenants/Quynhnd0911/10149387_278270892339632_1149065227_n.jpg', 59, CAST(0x0000A3B500A7C9B4 AS DateTime), 59, CAST(0x0000A3B500AC07C8 AS DateTime), 1, N'http://www.linkedIn.com/', N'http://www.facebook.com/', N'http://www.twitter.com/', N'http://www.google.com/', N'Information', N'ETown1, 364 Cong Hoa Street, Tan Binh District, Ho Chi Minh City, Vietnam', N'Tan Binh District', N'0937', N'ETown1, 364 Cong Hoa Street, Tan Binh District, Ho Chi Minh City, Vietnam', N'Tan Binh District', N'0937', CAST(0x0000A7FD00000000 AS DateTime), 6, 6, 6, N'Package.PackageName.Basic')
INSERT [dbo].[crm_Tenants] ([TenantId], [AssignedUserId], [TenantName], [TenantNameAlias], [OrgNumber], [DbName], [DbUsername], [DbPassword], [Phone], [Email], [Fax], [Website], [CountryId], [CompanyLogo], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Active], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Information], [PostedAddress], [PostedDistrict], [PostedNumber], [VisitingAddress], [VisitingDistrict], [VisitingNumber], [ExpiryDate], [NumberOfUsers], [NumberOfProjects], [NumberOfCustomers], [PackageName]) VALUES (10265, 1, N'IBM2508', N'IBM2508', N'2508', N'CRM_IBM2508', N'IBM2508', N'IBM2508', N'0987654321', N'IBM2508@cateno.no', N'2508', N'IBM2508', 1, N'/tenants/IBM2508/10149387_278270892339632_1149065227_n.jpg', 59, CAST(0x0000A3B500B417CA AS DateTime), 59, CAST(0x0000A3B500B417CA AS DateTime), 1, N'http://www.linkedIn.com/', N'http://www.facebook.com/', N'http://www.twitter.com/', N'http://www.google.com/', N'Information', N'ETown1, 364 Cong Hoa Street, Tan Binh District, Ho Chi Minh City, Vietnam', N'Tan Binh District', N'2508', N'ETown1, 364 Cong Hoa Street, Tan Binh District, Ho Chi Minh City, Vietnam', N'Tan Binh District', N'2508', CAST(0x0000A7FD00000000 AS DateTime), 2, 2, 2, N'Package.PackageName.Standard')
INSERT [dbo].[crm_Tenants] ([TenantId], [AssignedUserId], [TenantName], [TenantNameAlias], [OrgNumber], [DbName], [DbUsername], [DbPassword], [Phone], [Email], [Fax], [Website], [CountryId], [CompanyLogo], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Active], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Information], [PostedAddress], [PostedDistrict], [PostedNumber], [VisitingAddress], [VisitingDistrict], [VisitingNumber], [ExpiryDate], [NumberOfUsers], [NumberOfProjects], [NumberOfCustomers], [PackageName]) VALUES (10266, 1, N'IBM2909', N'IBM2909', N'2909', N'CRM_IBM2909', N'IBM2909', N'IBM2909', N'0911111113', N'IBM2909@cateno.no', N'2909', N'IBM2909', 1, N'/tenants/IBM2909/10149387_278270892339632_1149065227_n.jpg', 59, CAST(0x0000A3B500B63744 AS DateTime), 59, CAST(0x0000A3B6009C767C AS DateTime), 1, N'http://www.linkedIn.com/', N'http://www.facebook.com/', N'http://www.twitter.com/', N'http://www.google.com/', N'Information', N'ETown1, 364 Cong Hoa Street, Tan Binh District, Ho Chi Minh City, Vietnam', N'Tan Binh District', N'2909', N'ETown1, 364 Cong Hoa Street, Tan Binh District, Ho Chi Minh City, Vietnam', N'Tan Binh District', N'2909', CAST(0x0000A7FD00000000 AS DateTime), 3, 3, 3, N'Package.PackageName.Basic')
INSERT [dbo].[crm_Tenants] ([TenantId], [AssignedUserId], [TenantName], [TenantNameAlias], [OrgNumber], [DbName], [DbUsername], [DbPassword], [Phone], [Email], [Fax], [Website], [CountryId], [CompanyLogo], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Active], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Information], [PostedAddress], [PostedDistrict], [PostedNumber], [VisitingAddress], [VisitingDistrict], [VisitingNumber], [ExpiryDate], [NumberOfUsers], [NumberOfProjects], [NumberOfCustomers], [PackageName]) VALUES (10267, 1, N'IBM3009', N'IBM3009', N'3009', N'CRM_IBM3009', N'IBM3009', N'IBM3009', N'08328382333', N'IBM3009@cateno.no', N'3009', N'IBM3009', 1, N'/tenants/IBM3009/1509535_278267982339923_645153063_o.jpg', 59, CAST(0x0000A3B600A29075 AS DateTime), 59, CAST(0x0000A3B600A29075 AS DateTime), 1, N'http://www.linkedIn.com/', N'http://www.facebook.com/', N'http://www.twitter.com/', N'http://www.google.com/', N'Information', N'ETown1, 364 Cong Hoa Street, Tan Binh District, Ho Chi Minh City, Vietnam', N'Tan Binh District', N'3009', N'ETown1, 364 Cong Hoa Street, Tan Binh District, Ho Chi Minh City, Vietnam', N'Tan Binh District', N'3009', CAST(0x0000A7FE00000000 AS DateTime), 301, 101, 201, N'Package.PackageName.Standard')
INSERT [dbo].[crm_Tenants] ([TenantId], [AssignedUserId], [TenantName], [TenantNameAlias], [OrgNumber], [DbName], [DbUsername], [DbPassword], [Phone], [Email], [Fax], [Website], [CountryId], [CompanyLogo], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Active], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Information], [PostedAddress], [PostedDistrict], [PostedNumber], [VisitingAddress], [VisitingDistrict], [VisitingNumber], [ExpiryDate], [NumberOfUsers], [NumberOfProjects], [NumberOfCustomers], [PackageName]) VALUES (10268, 1, N'IBMM3009', N'IBMM3009', N'1234124234', N'CRM_IBMM3009', N'IBMM3009', N'IBMM3009', NULL, N'IBMM3009@yahoo.com', NULL, N'IBMM3009', 4, N'/tenants/IBMM3009/default.png', 2, CAST(0x0000A3B600F0A4C3 AS DateTime), 2, CAST(0x0000A3B600F0A4C3 AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A7FE00000000 AS DateTime), 2, 2, 2, N'Package.PackageName.Basic')
INSERT [dbo].[crm_Tenants] ([TenantId], [AssignedUserId], [TenantName], [TenantNameAlias], [OrgNumber], [DbName], [DbUsername], [DbPassword], [Phone], [Email], [Fax], [Website], [CountryId], [CompanyLogo], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Active], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Information], [PostedAddress], [PostedDistrict], [PostedNumber], [VisitingAddress], [VisitingDistrict], [VisitingNumber], [ExpiryDate], [NumberOfUsers], [NumberOfProjects], [NumberOfCustomers], [PackageName]) VALUES (10269, 1, N'demo1453', N'demo1453', N'1453', N'CRM_demo1453', N'demo1453', N'demo1453', NULL, N'demo1453@gmail.com', NULL, N'demo1453', 4, N'/tenants/demo1453/default.png', 59, CAST(0x0000A3B600F58529 AS DateTime), 59, CAST(0x0000A3B600F58529 AS DateTime), 1, N'http://www.linkedIn.com/', N'http://www.facebook.com/', N'http://www.twitter.com/1234444', N'https://www.google.com.vn/', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A7FE00000000 AS DateTime), 2, 2, 2, N'Package.PackageName.Basic')
INSERT [dbo].[crm_Tenants] ([TenantId], [AssignedUserId], [TenantName], [TenantNameAlias], [OrgNumber], [DbName], [DbUsername], [DbPassword], [Phone], [Email], [Fax], [Website], [CountryId], [CompanyLogo], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Active], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Information], [PostedAddress], [PostedDistrict], [PostedNumber], [VisitingAddress], [VisitingDistrict], [VisitingNumber], [ExpiryDate], [NumberOfUsers], [NumberOfProjects], [NumberOfCustomers], [PackageName]) VALUES (10270, 1, N'demo1503', N'demo1503', N'1503', N'CRM_demo1503', N'demo1503', N'demo1503', NULL, N'demo1503@gmail.com', NULL, N'demo1503', 4, N'/tenants/demo1503/default.png', 59, CAST(0x0000A3B600F829BC AS DateTime), 59, CAST(0x0000A3B600F829BC AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A7FE00000000 AS DateTime), 2, 2, 2, N'Package.PackageName.Basic')
INSERT [dbo].[crm_Tenants] ([TenantId], [AssignedUserId], [TenantName], [TenantNameAlias], [OrgNumber], [DbName], [DbUsername], [DbPassword], [Phone], [Email], [Fax], [Website], [CountryId], [CompanyLogo], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [Active], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Information], [PostedAddress], [PostedDistrict], [PostedNumber], [VisitingAddress], [VisitingDistrict], [VisitingNumber], [ExpiryDate], [NumberOfUsers], [NumberOfProjects], [NumberOfCustomers], [PackageName]) VALUES (10271, 1, N'IBC3009', N'IBC3009', N'13241', N'CRM_IBC3009', N'IBC3009', N'IBC3009', NULL, N'IBC3009@yahoo.com', NULL, N'IBC3009', 4, N'/tenants/IBC3009/default.png', 59, CAST(0x0000A3B600FD6768 AS DateTime), 59, CAST(0x0000A3B600FD6768 AS DateTime), 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(0x0000A7FE00000000 AS DateTime), 2, 2, 2, N'Package.PackageName.Basic')
SET IDENTITY_INSERT [dbo].[crm_Tenants] OFF
/****** Object:  StoredProcedure [dbo].[CreateNewDB]    Script Date: 09/30/2014 16:33:14 ******/
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
	[Content] [nvarchar](MAX) NULL,
	[LoginDate] [datetime] NULL,
	[LogoutDate] [datetime] NULL,
	[AccessBrowser] [nvarchar](100) NULL,
	[DetectedIp] [nvarchar](100) NULL,
	[ComputerName] [nvarchar](100) NULL,
	[Platform] [nvarchar](100) NULL,
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
	[Value] [ntext] NULL)
'
--Because @query=4000 we need to seperate to many pieces
print @query
exec (@query)
set @query=''
set @query ='use [' + @DBName + ']' + 
' 

CREATE TABLE [dbo].[crm_Tenant_EmailQueues](
	[ID] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
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
	[SendBy] [int] NULL)		

CREATE TABLE [dbo].[crm_Profiles](	
	[Id]  [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[TenantId] [int] NULL,
	[AssignedUserId] [int] NULL,
	[TenantNameAlias] [nvarchar](200) NULL,
	[TenantName] [nvarchar](200) NULL,
	[Phone] [nvarchar](25) NULL,
	[Email] [nvarchar](100) NULL,	
	[Fax] [nvarchar](50) NULL,
	[OrgNumber] [nvarchar](20) NULL,
	[Website] [nvarchar](200) NULL,	
	[CountryId] [int] NULL,
	[CompanyLogo] [nvarchar](200) NULL,	
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
	[PostedDistrict] [nvarchar](200) NULL,
	[PostedNumber] [nvarchar](200) NULL,
	[VisitingAddress] [nvarchar](200) NULL,
	[VisitingDistrict] [nvarchar](200) NULL,
	[VisitingNumber] [nvarchar](200) NULL,
	[NumberOfUsers] [int] NULL,
	[NumberOfProjects] [int] NULL,
	[NumberOfCustomers] [int] NULL,
	[ExpiryDate] [datetime] NULL,
	[PackageName] [nvarchar](100) NULL)
	
CREATE TABLE [dbo].[crm_Customers](
	[CustomerId] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[OrgNumber] [nvarchar](20) NOT NULL,
	[PostedAddress] [nvarchar](200) NULL,
	[PostedDistrict] [nvarchar](200) NULL,
	[PostedNumber] [nvarchar](200) NULL,
	[VisitingAddress] [nvarchar](200) NULL,
	[VisitingDistrict] [nvarchar](200) NULL,
	[VisitingNumber] [nvarchar](200) NULL,
	[Email] [nvarchar](100) NULL,
	[Fax] [varchar](20) NULL,	
	[Website] [nvarchar](200) NULL,
	[CountryId] [int] NULL,
	[Description] [text] NULL,
	[CustomerLogo] [varchar](200) NULL,
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

'


print @query
exec (@query)
set @query=''
set @query ='use [' + @DBName + ']' + 
' 
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
	[ModifiedDate] [datetime] NULL,
	[IsActive] [bit] NULL)

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

---------- Module  project-----------
set @query ='use [' + @DBName + ']' + 
' 
CREATE TABLE [dbo].[crm_Status](
	[StatusId] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[StatusName] [nvarchar] (200) NULL,
	[StatusType] [nvarchar] (20) NULL)

  Insert Into [dbo].[crm_Status] values(N''New'', 1)
  Insert Into [dbo].[crm_Status] values(N''Pending'', 1)
  Insert Into [dbo].[crm_Status] values(N''In-progress'', 1)
  Insert Into [dbo].[crm_Status] values(N''Completed'', 1)
  Insert Into [dbo].[crm_Status] values(N''Cancelled'', 1)
	
CREATE TABLE [dbo].[crm_Resolutions](
	[ResolutionId] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[ResolutionName] [nvarchar] (200) NULL,
	[ResolutionType] [nvarchar] (20) NULL)
	
CREATE TABLE [dbo].[crm_AttachFiles](
	[Id] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[FileName] [nvarchar] (250) NULL,
	[FilePath] [nvarchar] (500) NULL,
	[ProjectId] [int] NULL,
	[AttachId] [int] NULL,
	[Type] [nvarchar] (20) NULL)

CREATE TABLE [dbo].[crm_Project_Permissions](
	[PermissionId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[UserId] [int] NOT NULL)

CREATE TABLE [dbo].[crm_ProjectCategories](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](200) NULL,
	[Description] [text] NULL)

CREATE TABLE [dbo].[crm_DocumentTypes](
	[TypeId] [int] IDENTITY(1,1) NOT NULL,
	[TypeName] [nvarchar](200) NULL)

'
----------- End --------------------

print @query
exec (@query)
---
END
GO
/****** Object:  Table [dbo].[crm_Users]    Script Date: 09/30/2014 16:33:14 ******/
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
INSERT [dbo].[crm_Users] ([ID], [Username], [Password], [PasswordSalt], [Email], [DisplayName], [FullName], [Active], [CreatedDate], [UpdatedDate], [TenantId], [Image], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Phone], [Mobile], [ForgotPassWord], [Position]) VALUES (2, N'admin', N'Q0ecyvOA4eOt5nAhb6zzq9wFdgo=', N'62TjTLfXlycJHXzM1g+Exw==', N'hung1@cateno.no', NULL, N'hung', 1, NULL, CAST(0x0000A3A30120D819 AS DateTime), 0, N'/images/avatar//deactive.png', N'dsfdfdgfdgf', N'cat 333', N'www.abc.com', N'fsdfdsfdsfdsfgfdgfdgfdg', NULL, NULL, NULL, NULL)
INSERT [dbo].[crm_Users] ([ID], [Username], [Password], [PasswordSalt], [Email], [DisplayName], [FullName], [Active], [CreatedDate], [UpdatedDate], [TenantId], [Image], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Phone], [Mobile], [ForgotPassWord], [Position]) VALUES (59, N'sa', N'Bd/FSbCeefiIZN5rM0q5bJdbqF4=', N'eWlKTyRQ/bd74DC+GjyAVQ==', N'hung@cateno.no', NULL, N'Phạm V Hung', 1, NULL, CAST(0x0000A3B600DFAC40 AS DateTime), 0, N'/images/avatar/Banner 2.jpg', N'http://www.linkedIn.com/', N'http://www.facebook.com/', N'http://www.twitter.com/', N'http://www.google.com/', N'0937565656', N'0937565656', N'bcf3c26c-1c8a-449e-9d78-c03c19354c83                                                                                                                                                                    ', N'Scrum Master')
INSERT [dbo].[crm_Users] ([ID], [Username], [Password], [PasswordSalt], [Email], [DisplayName], [FullName], [Active], [CreatedDate], [UpdatedDate], [TenantId], [Image], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Phone], [Mobile], [ForgotPassWord], [Position]) VALUES (81, N'Quynhnd', N'cAwnR+GALYR8noNyAfve0MHH+tQ=', N'nDfqu7DdRTKBJNpAkAFvEw==', N'quynhnd@cateno.no', NULL, N'Nguyen Duy Quynh', 1, CAST(0x0000A39500E111B1 AS DateTime), CAST(0x0000A3A100F0C394 AS DateTime), 0, N'/images/avatar//10149387_278270892339632_1149065227_n.jpg', N'http://www.linkedIn.com/', N'http://www.facebook.com/', N'http://www.twitter.com/', N'http://www.google.com/', N'0937565656', N'0937562626', N'2dae6b08-edb7-40b3-b284-b08271d43bbe                                                                                                                                                                    ', N'TW')
INSERT [dbo].[crm_Users] ([ID], [Username], [Password], [PasswordSalt], [Email], [DisplayName], [FullName], [Active], [CreatedDate], [UpdatedDate], [TenantId], [Image], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Phone], [Mobile], [ForgotPassWord], [Position]) VALUES (82, N'linhad', N'8fElA26BIv3Iua7R5WOhHmEUiuM=', N'qC7ml7hlWv8dPkvjRFizig==', N'linhltd@cateno.no', NULL, N'Le Thai Duy Linh', 1, CAST(0x0000A39D00A88C97 AS DateTime), NULL, 0, N'/images/avatar//002.jpg', NULL, N'lethaiduylinh', NULL, NULL, N'0907500020', NULL, NULL, N'Giam Doc Eo Dam Lam')
INSERT [dbo].[crm_Users] ([ID], [Username], [Password], [PasswordSalt], [Email], [DisplayName], [FullName], [Active], [CreatedDate], [UpdatedDate], [TenantId], [Image], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Phone], [Mobile], [ForgotPassWord], [Position]) VALUES (83, N'Quynhnd0909', N'eSmKw0IToFmycMfts14pOtzzVCI=', N'dhRSINUDdptwVkxUjMuRAQ==', N'nguyenduyquynh@gmail.com', NULL, N'Nguyen Duy Quynh', 1, CAST(0x0000A3A100AA3926 AS DateTime), CAST(0x0000A3A100BE12FA AS DateTime), 0, N'/images/avatar/default.png', N'http://www.linkedIn.com/', N'http://www.facebook.com/', N'http://www.twitter.com/', N'http://www.google.com/', N'0937562627', N'0937562627', NULL, N'TW')
INSERT [dbo].[crm_Users] ([ID], [Username], [Password], [PasswordSalt], [Email], [DisplayName], [FullName], [Active], [CreatedDate], [UpdatedDate], [TenantId], [Image], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Phone], [Mobile], [ForgotPassWord], [Position]) VALUES (84, N'luunghiepcuong', N'fqTxKGotucZrLdG/aa4cHXmQQOc=', N'8TsxaZFEl8l18jAb/Ggf0Q==', N'luunghiepcuong@yahoo.com', NULL, N'Luu Nghiep Cuong', 1, CAST(0x0000A3A3010FB354 AS DateTime), NULL, 0, N'/images/avatar//10151628_278271762339545_906190862_n.jpg', NULL, N'http://www.facebook.com/', N'http://www.twitter.com/', NULL, N'0937565656', N'0937562626', NULL, N'TW')
INSERT [dbo].[crm_Users] ([ID], [Username], [Password], [PasswordSalt], [Email], [DisplayName], [FullName], [Active], [CreatedDate], [UpdatedDate], [TenantId], [Image], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Phone], [Mobile], [ForgotPassWord], [Position]) VALUES (85, N'test', N'CkiSW8QV5GFl0YfN34R2tdkW5kc=', N'ToO9U4z+Jqfc/7XYh2giNQ==', N'dao@dao.vn', NULL, N'test', 1, CAST(0x0000A3A3011DE4D4 AS DateTime), NULL, 0, N'/images/avatar//chó.jpg', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[crm_Users] ([ID], [Username], [Password], [PasswordSalt], [Email], [DisplayName], [FullName], [Active], [CreatedDate], [UpdatedDate], [TenantId], [Image], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Phone], [Mobile], [ForgotPassWord], [Position]) VALUES (86, N'letrankiet', N'9q2M8sQDvBu/YfiPrQbNxmmHm/8=', N'lE4NmahAMCbr/dWZ956crg==', N'letrankiet@gmail.com', NULL, N'Le Tran Kiet', 1, CAST(0x0000A3A400D78F01 AS DateTime), NULL, 0, N'/images/avatar//10149387_278270892339632_1149065227_n.jpg', N'http://www.linkedIn.com/', N'http://www.facebook.com/', N'http://www.twitter.com/', N'http://www.google.com/', N'0937565656', N'0937565656', NULL, N'TW')
INSERT [dbo].[crm_Users] ([ID], [Username], [Password], [PasswordSalt], [Email], [DisplayName], [FullName], [Active], [CreatedDate], [UpdatedDate], [TenantId], [Image], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Phone], [Mobile], [ForgotPassWord], [Position]) VALUES (87, N'operator', N'9op0DOn7c+UQTbcRGkxV5Xix2uw=', N'bpiJj6s/zlpJyufzVtfDXQ==', N'operator@yahoo.com', NULL, N'operator ', 1, CAST(0x0000A3A400DF68BC AS DateTime), NULL, 0, N'/images/avatar//Koala1.jpg', NULL, NULL, NULL, NULL, N'32141234', N'13241234', NULL, N'1324 edrqwerqwe')
SET IDENTITY_INSERT [dbo].[crm_Users] OFF
/****** Object:  Table [dbo].[crm_UserRoles]    Script Date: 09/30/2014 16:33:14 ******/
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
INSERT [dbo].[crm_UserRoles] ([ID], [UserID], [RoleID]) VALUES (4, 2, 7)
INSERT [dbo].[crm_UserRoles] ([ID], [UserID], [RoleID]) VALUES (55, 59, 2)
INSERT [dbo].[crm_UserRoles] ([ID], [UserID], [RoleID]) VALUES (77, 81, 7)
INSERT [dbo].[crm_UserRoles] ([ID], [UserID], [RoleID]) VALUES (78, 82, 7)
INSERT [dbo].[crm_UserRoles] ([ID], [UserID], [RoleID]) VALUES (79, 83, 7)
INSERT [dbo].[crm_UserRoles] ([ID], [UserID], [RoleID]) VALUES (80, 84, 7)
INSERT [dbo].[crm_UserRoles] ([ID], [UserID], [RoleID]) VALUES (81, 85, 7)
INSERT [dbo].[crm_UserRoles] ([ID], [UserID], [RoleID]) VALUES (82, 86, 7)
INSERT [dbo].[crm_UserRoles] ([ID], [UserID], [RoleID]) VALUES (83, 87, 7)
SET IDENTITY_INSERT [dbo].[crm_UserRoles] OFF
/****** Object:  Table [dbo].[crm_Contacts]    Script Date: 09/30/2014 16:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Contacts](
	[ContactId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[ContactPhone] [nvarchar](20) NULL,
	[MobilePhone] [nvarchar](20) NULL,
	[Address] [nvarchar](200) NULL,
	[Active] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[IsDefault] [bit] NULL,
	[CustomerId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crm_Project_Permissions_GroupUsers]    Script Date: 09/30/2014 16:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Project_Permissions_GroupUsers](
	[GroupUserId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[GroupUserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crm_Projects]    Script Date: 09/30/2014 16:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Projects](
	[ProjectId] [int] IDENTITY(1,1) NOT NULL,
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
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetUsers]    Script Date: 09/30/2014 16:33:14 ******/
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
/****** Object:  Table [dbo].[crm_Tasks]    Script Date: 09/30/2014 16:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Tasks](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[Name] [nvarchar](200) NULL,
	[StatusId] [int] NOT NULL,
	[ResolutionId] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[CompleteDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[AssignTo] [int] NOT NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crm_Tickets]    Script Date: 09/30/2014 16:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Tickets](
	[TicketId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[TicketNumber] [nvarchar](20) NULL,
	[TicketName] [nvarchar](200) NULL,
	[StatusId] [int] NOT NULL,
	[ResolutionId] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[CompleteDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[AssignTo] [int] NOT NULL,
	[AttachFile] [nvarchar](250) NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crm_Project_Permissions]    Script Date: 09/30/2014 16:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Project_Permissions](
	[PermissionId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PermissionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crm_Bugs]    Script Date: 09/30/2014 16:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Bugs](
	[BugId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[Name] [nvarchar](200) NULL,
	[StatusId] [int] NOT NULL,
	[ResolutionId] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[CompleteDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[AssignTo] [int] NOT NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[BugId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crm_AttachFiles]    Script Date: 09/30/2014 16:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_AttachFiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FilePath] [nvarchar](250) NULL,
	[ProjectId] [int] NULL,
	[AttachId] [int] NULL,
	[Type] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crm_Documents]    Script Date: 09/30/2014 16:33:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Documents](
	[DocumentId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[DocumentName] [nvarchar](200) NULL,
	[AttachFile] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[Comment] [text] NULL,
	[Owner] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[DocumentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Default [DF_crm_Package_UserNumber]    Script Date: 09/30/2014 16:33:11 ******/
ALTER TABLE [dbo].[crm_Packages] ADD  CONSTRAINT [DF_crm_Package_UserNumber]  DEFAULT ((0)) FOR [NumberOfUsers]
GO
/****** Object:  Default [DF_crm_Package_ProjectNumber]    Script Date: 09/30/2014 16:33:11 ******/
ALTER TABLE [dbo].[crm_Packages] ADD  CONSTRAINT [DF_crm_Package_ProjectNumber]  DEFAULT ((0)) FOR [NumberOfProjects]
GO
/****** Object:  Default [DF_crm_Package_CustomerNumber]    Script Date: 09/30/2014 16:33:11 ******/
ALTER TABLE [dbo].[crm_Packages] ADD  CONSTRAINT [DF_crm_Package_CustomerNumber]  DEFAULT ((0)) FOR [NumberOfCustomers]
GO
/****** Object:  Default [DF_crm_Logs_LoginDate]    Script Date: 09/30/2014 16:33:11 ******/
ALTER TABLE [dbo].[crm_Logs] ADD  CONSTRAINT [DF_crm_Logs_LoginDate]  DEFAULT (getdate()) FOR [LoginDate]
GO
/****** Object:  Default [DF_crm_Logs_Success]    Script Date: 09/30/2014 16:33:11 ******/
ALTER TABLE [dbo].[crm_Logs] ADD  CONSTRAINT [DF_crm_Logs_Success]  DEFAULT ((1)) FOR [IsSuccess]
GO
/****** Object:  Default [DF_crm_Tenants_Active]    Script Date: 09/30/2014 16:33:11 ******/
ALTER TABLE [dbo].[crm_Tenants] ADD  CONSTRAINT [DF_crm_Tenants_Active]  DEFAULT ((1)) FOR [Active]
GO
/****** Object:  ForeignKey [FK_crm_UserRoles_crm_Users]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_UserRoles]  WITH CHECK ADD  CONSTRAINT [FK_crm_UserRoles_crm_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[crm_Users] ([ID])
GO
ALTER TABLE [dbo].[crm_UserRoles] CHECK CONSTRAINT [FK_crm_UserRoles_crm_Users]
GO
/****** Object:  ForeignKey [FK_crm_Contacts_crm_Customers]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_Contacts]  WITH CHECK ADD  CONSTRAINT [FK_crm_Contacts_crm_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[crm_Customers] ([CustomerId])
GO
ALTER TABLE [dbo].[crm_Contacts] CHECK CONSTRAINT [FK_crm_Contacts_crm_Customers]
GO
/****** Object:  ForeignKey [FK_crm_Project_Permissions_GroupUsers_crm_Groups]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_Project_Permissions_GroupUsers]  WITH CHECK ADD  CONSTRAINT [FK_crm_Project_Permissions_GroupUsers_crm_Groups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[crm_Project_Permissions_Groups] ([GroupId])
GO
ALTER TABLE [dbo].[crm_Project_Permissions_GroupUsers] CHECK CONSTRAINT [FK_crm_Project_Permissions_GroupUsers_crm_Groups]
GO
/****** Object:  ForeignKey [FK_crm_Project_Permissions_GroupUsers_crm_Users]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_Project_Permissions_GroupUsers]  WITH CHECK ADD  CONSTRAINT [FK_crm_Project_Permissions_GroupUsers_crm_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[crm_Users] ([ID])
GO
ALTER TABLE [dbo].[crm_Project_Permissions_GroupUsers] CHECK CONSTRAINT [FK_crm_Project_Permissions_GroupUsers_crm_Users]
GO
/****** Object:  ForeignKey [FK_crm_Projects_crm_Contacts]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_Projects]  WITH CHECK ADD  CONSTRAINT [FK_crm_Projects_crm_Contacts] FOREIGN KEY([ContactId])
REFERENCES [dbo].[crm_Contacts] ([ContactId])
GO
ALTER TABLE [dbo].[crm_Projects] CHECK CONSTRAINT [FK_crm_Projects_crm_Contacts]
GO
/****** Object:  ForeignKey [FK_crm_Projects_crm_ProjectCategories]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_Projects]  WITH CHECK ADD  CONSTRAINT [FK_crm_Projects_crm_ProjectCategories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[crm_ProjectCategories] ([CategoryId])
GO
ALTER TABLE [dbo].[crm_Projects] CHECK CONSTRAINT [FK_crm_Projects_crm_ProjectCategories]
GO
/****** Object:  ForeignKey [FK_crm_Projects_crm_Status]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_Projects]  WITH CHECK ADD  CONSTRAINT [FK_crm_Projects_crm_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[crm_Status] ([StatusId])
GO
ALTER TABLE [dbo].[crm_Projects] CHECK CONSTRAINT [FK_crm_Projects_crm_Status]
GO
/****** Object:  ForeignKey [FK_crm_Projects_crm_Users]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_Projects]  WITH CHECK ADD  CONSTRAINT [FK_crm_Projects_crm_Users] FOREIGN KEY([ProjectLeadId])
REFERENCES [dbo].[crm_Users] ([ID])
GO
ALTER TABLE [dbo].[crm_Projects] CHECK CONSTRAINT [FK_crm_Projects_crm_Users]
GO
/****** Object:  ForeignKey [FK_crm_Tasks_crm_Projects]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_Tasks]  WITH CHECK ADD  CONSTRAINT [FK_crm_Tasks_crm_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[crm_Projects] ([ProjectId])
GO
ALTER TABLE [dbo].[crm_Tasks] CHECK CONSTRAINT [FK_crm_Tasks_crm_Projects]
GO
/****** Object:  ForeignKey [FK_crm_Tasks_crm_Resolutions]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_Tasks]  WITH CHECK ADD  CONSTRAINT [FK_crm_Tasks_crm_Resolutions] FOREIGN KEY([ResolutionId])
REFERENCES [dbo].[crm_Resolutions] ([ResolutionId])
GO
ALTER TABLE [dbo].[crm_Tasks] CHECK CONSTRAINT [FK_crm_Tasks_crm_Resolutions]
GO
/****** Object:  ForeignKey [FK_crm_Tasks_crm_Status]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_Tasks]  WITH CHECK ADD  CONSTRAINT [FK_crm_Tasks_crm_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[crm_Status] ([StatusId])
GO
ALTER TABLE [dbo].[crm_Tasks] CHECK CONSTRAINT [FK_crm_Tasks_crm_Status]
GO
/****** Object:  ForeignKey [FK_crm_Tasks_crm_Users]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_Tasks]  WITH CHECK ADD  CONSTRAINT [FK_crm_Tasks_crm_Users] FOREIGN KEY([AssignTo])
REFERENCES [dbo].[crm_Users] ([ID])
GO
ALTER TABLE [dbo].[crm_Tasks] CHECK CONSTRAINT [FK_crm_Tasks_crm_Users]
GO
/****** Object:  ForeignKey [FK_crm_Tickets_crm_Projects]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_Tickets]  WITH CHECK ADD  CONSTRAINT [FK_crm_Tickets_crm_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[crm_Projects] ([ProjectId])
GO
ALTER TABLE [dbo].[crm_Tickets] CHECK CONSTRAINT [FK_crm_Tickets_crm_Projects]
GO
/****** Object:  ForeignKey [FK_crm_Tickets_crm_Resolutions]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_Tickets]  WITH CHECK ADD  CONSTRAINT [FK_crm_Tickets_crm_Resolutions] FOREIGN KEY([ResolutionId])
REFERENCES [dbo].[crm_Resolutions] ([ResolutionId])
GO
ALTER TABLE [dbo].[crm_Tickets] CHECK CONSTRAINT [FK_crm_Tickets_crm_Resolutions]
GO
/****** Object:  ForeignKey [FK_crm_Tickets_crm_Status]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_Tickets]  WITH CHECK ADD  CONSTRAINT [FK_crm_Tickets_crm_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[crm_Status] ([StatusId])
GO
ALTER TABLE [dbo].[crm_Tickets] CHECK CONSTRAINT [FK_crm_Tickets_crm_Status]
GO
/****** Object:  ForeignKey [FK_crm_Tickets_crm_Users]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_Tickets]  WITH CHECK ADD  CONSTRAINT [FK_crm_Tickets_crm_Users] FOREIGN KEY([AssignTo])
REFERENCES [dbo].[crm_Users] ([ID])
GO
ALTER TABLE [dbo].[crm_Tickets] CHECK CONSTRAINT [FK_crm_Tickets_crm_Users]
GO
/****** Object:  ForeignKey [FK_crm_Project_Permissions_crm_Projects]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_Project_Permissions]  WITH CHECK ADD  CONSTRAINT [FK_crm_Project_Permissions_crm_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[crm_Projects] ([ProjectId])
GO
ALTER TABLE [dbo].[crm_Project_Permissions] CHECK CONSTRAINT [FK_crm_Project_Permissions_crm_Projects]
GO
/****** Object:  ForeignKey [FK_crm_Project_Permissions_crm_Users]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_Project_Permissions]  WITH CHECK ADD  CONSTRAINT [FK_crm_Project_Permissions_crm_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[crm_Users] ([ID])
GO
ALTER TABLE [dbo].[crm_Project_Permissions] CHECK CONSTRAINT [FK_crm_Project_Permissions_crm_Users]
GO
/****** Object:  ForeignKey [FK_crm_Bugs_crm_Projects]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_Bugs]  WITH CHECK ADD  CONSTRAINT [FK_crm_Bugs_crm_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[crm_Projects] ([ProjectId])
GO
ALTER TABLE [dbo].[crm_Bugs] CHECK CONSTRAINT [FK_crm_Bugs_crm_Projects]
GO
/****** Object:  ForeignKey [FK_crm_Bugs_crm_Resolutions]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_Bugs]  WITH CHECK ADD  CONSTRAINT [FK_crm_Bugs_crm_Resolutions] FOREIGN KEY([ResolutionId])
REFERENCES [dbo].[crm_Resolutions] ([ResolutionId])
GO
ALTER TABLE [dbo].[crm_Bugs] CHECK CONSTRAINT [FK_crm_Bugs_crm_Resolutions]
GO
/****** Object:  ForeignKey [FK_crm_Bugs_crm_Status]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_Bugs]  WITH CHECK ADD  CONSTRAINT [FK_crm_Bugs_crm_Status] FOREIGN KEY([StatusId])
REFERENCES [dbo].[crm_Status] ([StatusId])
GO
ALTER TABLE [dbo].[crm_Bugs] CHECK CONSTRAINT [FK_crm_Bugs_crm_Status]
GO
/****** Object:  ForeignKey [FK_crm_Bugs_crm_Users]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_Bugs]  WITH CHECK ADD  CONSTRAINT [FK_crm_Bugs_crm_Users] FOREIGN KEY([AssignTo])
REFERENCES [dbo].[crm_Users] ([ID])
GO
ALTER TABLE [dbo].[crm_Bugs] CHECK CONSTRAINT [FK_crm_Bugs_crm_Users]
GO
/****** Object:  ForeignKey [FK_crm_AttachFiles_crm_Projects]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_AttachFiles]  WITH CHECK ADD  CONSTRAINT [FK_crm_AttachFiles_crm_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[crm_Projects] ([ProjectId])
GO
ALTER TABLE [dbo].[crm_AttachFiles] CHECK CONSTRAINT [FK_crm_AttachFiles_crm_Projects]
GO
/****** Object:  ForeignKey [FK_crm_Documents_crm_Projects]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_Documents]  WITH CHECK ADD  CONSTRAINT [FK_crm_Documents_crm_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[crm_Projects] ([ProjectId])
GO
ALTER TABLE [dbo].[crm_Documents] CHECK CONSTRAINT [FK_crm_Documents_crm_Projects]
GO
/****** Object:  ForeignKey [FK_crm_Documents_crm_Users]    Script Date: 09/30/2014 16:33:14 ******/
ALTER TABLE [dbo].[crm_Documents]  WITH CHECK ADD  CONSTRAINT [FK_crm_Documents_crm_Users] FOREIGN KEY([Owner])
REFERENCES [dbo].[crm_Users] ([ID])
GO
ALTER TABLE [dbo].[crm_Documents] CHECK CONSTRAINT [FK_crm_Documents_crm_Users]
GO
