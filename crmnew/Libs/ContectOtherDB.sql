USE [master]
GO
/****** Object:  Database [MultiOrg_DEMO0953]    Script Date: 08/07/2014 10:05:10 ******/
CREATE DATABASE [MultiOrg_DEMO0953] ON  PRIMARY 
( NAME = N'MultiOrg_DEMO0953', FILENAME = N'D:\Data\MSSQL2008\Data\MultiOrg_DEMO0953.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MultiOrg_DEMO0953_log', FILENAME = N'D:\Data\MSSQL2008\Logs\MultiOrg_DEMO0953_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MultiOrg_DEMO0953].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET ANSI_NULLS OFF
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET ANSI_PADDING OFF
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET ARITHABORT OFF
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET  ENABLE_BROKER
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET  READ_WRITE
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET RECOVERY FULL
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET  MULTI_USER
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [MultiOrg_DEMO0953] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'MultiOrg_DEMO0953', N'ON'
GO
USE [MultiOrg_DEMO0953]
GO
/****** Object:  Table [dbo].[crm_Tickets]    Script Date: 08/07/2014 10:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Tickets](
	[TicketId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[TicketNumber] [nvarchar](20) NULL,
	[StatusId] [int] NOT NULL,
	[ResolutionId] [int] NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Summary] [nvarchar](200) NULL,
	[PriorityId] [int] NOT NULL,
	[Comment] [text] NULL,
	[StartDate] [datetime] NULL,
	[CompleteDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedDate] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TicketId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crm_Tenant_Users]    Script Date: 08/07/2014 10:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[crm_Tenant_Users] ON
INSERT [dbo].[crm_Tenant_Users] ([ID], [Username], [Password], [PasswordSalt], [Email], [DisplayName], [FullName], [Active], [CreatedDate], [UpdatedDate], [TenantId], [Image], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Phone], [Mobile], [ForgotPassWord], [Position]) VALUES (1, N'DEMO0953', N'oBoLpIn+dwRmLaHAIJlDf20JSiY=', N'fGN/kr6b3FvtBjOoCZsDwQ==', N'DEMO0953@gmail.com', N'DEMO0953', N'DEMO0953', 1, CAST(0x0000A37F00A326CC AS DateTime), NULL, 10097, N'/tenants/DEMO0953/default.png', NULL, N'831012426918470', NULL, NULL, NULL, NULL, NULL, NULL)
SET IDENTITY_INSERT [dbo].[crm_Tenant_Users] OFF
/****** Object:  Table [dbo].[crm_Tenant_UserRoles]    Script Date: 08/07/2014 10:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Tenant_UserRoles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[RoleID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[crm_Tenant_UserRoles] ON
INSERT [dbo].[crm_Tenant_UserRoles] ([ID], [UserID], [RoleID]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [dbo].[crm_Tenant_UserRoles] OFF
/****** Object:  Table [dbo].[crm_Tenant_Setting]    Script Date: 08/07/2014 10:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Tenant_Setting](
	[SettingId] [int] IDENTITY(1,1) NOT NULL,
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
PRIMARY KEY CLUSTERED 
(
	[SettingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crm_Tenant_Roles]    Script Date: 08/07/2014 10:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[crm_Tenant_Roles] ON
INSERT [dbo].[crm_Tenant_Roles] ([ID], [RoleName], [Description], [Active], [MaskPermission], [TenantId], [PermissionType]) VALUES (1, N'Administrator', NULL, 1, 527, 10097, 512)
INSERT [dbo].[crm_Tenant_Roles] ([ID], [RoleName], [Description], [Active], [MaskPermission], [TenantId], [PermissionType]) VALUES (2, N'Manager', NULL, 1, 271, 10097, 256)
INSERT [dbo].[crm_Tenant_Roles] ([ID], [RoleName], [Description], [Active], [MaskPermission], [TenantId], [PermissionType]) VALUES (3, N'Support', NULL, 1, 143, 10097, 128)
INSERT [dbo].[crm_Tenant_Roles] ([ID], [RoleName], [Description], [Active], [MaskPermission], [TenantId], [PermissionType]) VALUES (4, N'Marketing', NULL, 1, 79, 10097, 64)
INSERT [dbo].[crm_Tenant_Roles] ([ID], [RoleName], [Description], [Active], [MaskPermission], [TenantId], [PermissionType]) VALUES (5, N'Sales', NULL, 1, 47, 10097, 32)
INSERT [dbo].[crm_Tenant_Roles] ([ID], [RoleName], [Description], [Active], [MaskPermission], [TenantId], [PermissionType]) VALUES (6, N'NormalUser', N'abc', 1, 31, 10097, 16)
SET IDENTITY_INSERT [dbo].[crm_Tenant_Roles] OFF
/****** Object:  Table [dbo].[crm_Tenant_Logs]    Script Date: 08/07/2014 10:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[crm_Tenant_LogAction]    Script Date: 08/07/2014 10:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Tenant_LogAction](
	[LogActionId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[LogActionId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crm_Tasks]    Script Date: 08/07/2014 10:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Tasks](
	[TaskId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[Name] [nvarchar](200) NULL,
	[StartDate] [datetime] NULL,
	[CompleteDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[StatusId] [int] NOT NULL,
	[ResolutionId] [int] NOT NULL,
	[AssignTo] [int] NOT NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[TaskId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crm_Projects]    Script Date: 08/07/2014 10:05:12 ******/
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
/****** Object:  Table [dbo].[crm_Documents]    Script Date: 08/07/2014 10:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Documents](
	[DocumentId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[DocumentName] [nvarchar](200) NULL,
	[TypeId] [int] NOT NULL,
	[Datetime] [datetime] NULL,
	[Comment] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[DocumentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crm_Customers]    Script Date: 08/07/2014 10:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[crm_Contacts]    Script Date: 08/07/2014 10:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
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
	[Gender] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[crm_Bugs]    Script Date: 08/07/2014 10:05:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Bugs](
	[BugId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[StatusId] [int] NOT NULL,
	[ResolutionId] [int] NOT NULL,
	[StartDate] [datetime] NULL,
	[CompleteDate] [datetime] NULL,
	[DueDate] [datetime] NULL,
	[Name] [nvarchar](200) NULL,
	[AssignTo] [int] NOT NULL,
	[Description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[BugId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
