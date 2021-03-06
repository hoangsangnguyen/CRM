USE [master]
GO
/****** Object:  Database [MultiOrg_demo1506]    Script Date: 09/30/2014 16:35:18 ******/
CREATE DATABASE [MultiOrg_demo1506] ON  PRIMARY 
( NAME = N'MultiOrg_demo1506', FILENAME = N'D:\Data\MSSQL2008\Data\MultiOrg_demo1506.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'MultiOrg_demo1506_log', FILENAME = N'D:\Data\MSSQL2008\Logs\MultiOrg_demo1506_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [MultiOrg_demo1506] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MultiOrg_demo1506].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MultiOrg_demo1506] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [MultiOrg_demo1506] SET ANSI_NULLS OFF
GO
ALTER DATABASE [MultiOrg_demo1506] SET ANSI_PADDING OFF
GO
ALTER DATABASE [MultiOrg_demo1506] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [MultiOrg_demo1506] SET ARITHABORT OFF
GO
ALTER DATABASE [MultiOrg_demo1506] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [MultiOrg_demo1506] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [MultiOrg_demo1506] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [MultiOrg_demo1506] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [MultiOrg_demo1506] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [MultiOrg_demo1506] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [MultiOrg_demo1506] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [MultiOrg_demo1506] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [MultiOrg_demo1506] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [MultiOrg_demo1506] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [MultiOrg_demo1506] SET  ENABLE_BROKER
GO
ALTER DATABASE [MultiOrg_demo1506] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [MultiOrg_demo1506] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [MultiOrg_demo1506] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [MultiOrg_demo1506] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [MultiOrg_demo1506] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [MultiOrg_demo1506] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [MultiOrg_demo1506] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [MultiOrg_demo1506] SET  READ_WRITE
GO
ALTER DATABASE [MultiOrg_demo1506] SET RECOVERY FULL
GO
ALTER DATABASE [MultiOrg_demo1506] SET  MULTI_USER
GO
ALTER DATABASE [MultiOrg_demo1506] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [MultiOrg_demo1506] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'MultiOrg_demo1506', N'ON'
GO
USE [MultiOrg_demo1506]
GO
/****** Object:  Table [dbo].[crm_Tickets]    Script Date: 09/30/2014 16:35:20 ******/
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
SET IDENTITY_INSERT [dbo].[crm_Tickets] ON
INSERT [dbo].[crm_Tickets] ([TicketId], [ProjectId], [TicketNumber], [StatusId], [ResolutionId], [Title], [Summary], [PriorityId], [Comment], [StartDate], [CompleteDate], [DueDate], [CreatedDate], [ModifiedDate]) VALUES (12, 22, N'test1', 6, 2, N'Test 1', NULL, 2, N'aaa', CAST(0x0000A3BE00000000 AS DateTime), CAST(0x0000A3BE00000000 AS DateTime), CAST(0x0000A3C500000000 AS DateTime), CAST(0x0000A3A9011A2C86 AS DateTime), CAST(0x0000A3A9011A559E AS DateTime))
SET IDENTITY_INSERT [dbo].[crm_Tickets] OFF
/****** Object:  Table [dbo].[crm_Tenant_Users]    Script Date: 09/30/2014 16:35:20 ******/
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
	[TenantId] [int] NULL,
	[Image] [varchar](200) NULL,
	[LinkedURL] [varchar](200) NULL,
	[FacebookURL] [varchar](200) NULL,
	[TwitterURL] [varchar](200) NULL,
	[GoogleplusURL] [varchar](200) NULL,
	[Phone] [nvarchar](25) NULL,
	[Mobile] [nvarchar](25) NULL,
	[ForgotPassWord] [nchar](200) NULL,
	[Position] [nvarchar](50) NULL,
 CONSTRAINT [PK__crm_Tena__3214EC270519C6AF] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[crm_Tenant_Users] ON
INSERT [dbo].[crm_Tenant_Users] ([ID], [Username], [Password], [PasswordSalt], [Email], [DisplayName], [FullName], [Active], [CreatedDate], [UpdatedDate], [TenantId], [Image], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Phone], [Mobile], [ForgotPassWord], [Position]) VALUES (2, N'admin', N'oO87Ns+W8TnA60qhpprGqSP6aXs=', N'55CiqHgoXgVn9USrg4dPgw==', N'quynhnd@cateno.no', NULL, N'khanh ri1', 1, CAST(0x0000A3930114E24C AS DateTime), CAST(0x0000A3A301183E13 AS DateTime), 10162, N'/images/avatar/default.png', NULL, NULL, NULL, NULL, N'8493338943535', N'849333891', NULL, N'MAB')
INSERT [dbo].[crm_Tenant_Users] ([ID], [Username], [Password], [PasswordSalt], [Email], [DisplayName], [FullName], [Active], [CreatedDate], [UpdatedDate], [TenantId], [Image], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Phone], [Mobile], [ForgotPassWord], [Position]) VALUES (3, N'khacthuy', N'dbpaU1wJWhReZJooiqZjIUy1rZs=', N'Nk7knyd3cR+Y2mHWjweOFw==', N'khacthuy.3k@gmail.com', NULL, N'Hoang Thuy', 1, CAST(0x0000A39C00ECBCDF AS DateTime), CAST(0x0000A3A30102B23F AS DateTime), 10162, N'/images/avatar/default.png', NULL, NULL, NULL, NULL, N'84933389128', N'84933389128', NULL, N'MAB1')
INSERT [dbo].[crm_Tenant_Users] ([ID], [Username], [Password], [PasswordSalt], [Email], [DisplayName], [FullName], [Active], [CreatedDate], [UpdatedDate], [TenantId], [Image], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Phone], [Mobile], [ForgotPassWord], [Position]) VALUES (4, N'testEnd', N'T321H0esDYPTpm5QDoMxpH8Qo9c=', N'7pmX0Ps0xoY7TgtxgqIeOw==', N'testEnd@gmail.com', NULL, N'testEnd', 1, CAST(0x0000A3B500ED16B1 AS DateTime), NULL, 10162, N'/images/avatar/default.png', NULL, NULL, NULL, NULL, N'aa', N'aa', NULL, N'aa')
SET IDENTITY_INSERT [dbo].[crm_Tenant_Users] OFF
/****** Object:  Table [dbo].[crm_Tenant_UserRoles]    Script Date: 09/30/2014 16:35:20 ******/
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
INSERT [dbo].[crm_Tenant_UserRoles] ([ID], [UserID], [RoleID]) VALUES (2, 2, 1)
INSERT [dbo].[crm_Tenant_UserRoles] ([ID], [UserID], [RoleID]) VALUES (3, 3, 2)
INSERT [dbo].[crm_Tenant_UserRoles] ([ID], [UserID], [RoleID]) VALUES (4, 4, 2)
SET IDENTITY_INSERT [dbo].[crm_Tenant_UserRoles] OFF
/****** Object:  Table [dbo].[crm_Tenant_Setting]    Script Date: 09/30/2014 16:35:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Tenant_Setting](
	[SettingId] [int] IDENTITY(1,1) NOT NULL,
	[Value] [ntext] NULL,
PRIMARY KEY CLUSTERED 
(
	[SettingId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[crm_Tenant_Setting] ON
INSERT [dbo].[crm_Tenant_Setting] ([SettingId], [Value]) VALUES (1, N'<?xml version="1.0"?><AppSettingsTenant xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"><TimeZone>Samoa Standard Time</TimeZone><DateFormat>MM/dd/yyyy</DateFormat><TimeFormat>h:mm:ss</TimeFormat><Country>SA</Country><LanguageCode>nb-NO</LanguageCode><Currency>NOk</Currency><Decimal>.</Decimal><NumberDecimal>2</NumberDecimal></AppSettingsTenant>')
SET IDENTITY_INSERT [dbo].[crm_Tenant_Setting] OFF
/****** Object:  Table [dbo].[crm_Tenant_Roles]    Script Date: 09/30/2014 16:35:20 ******/
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
INSERT [dbo].[crm_Tenant_Roles] ([ID], [RoleName], [Description], [Active], [MaskPermission], [TenantId], [PermissionType]) VALUES (1, N'Administrator', NULL, 1, 527, 10162, 512)
INSERT [dbo].[crm_Tenant_Roles] ([ID], [RoleName], [Description], [Active], [MaskPermission], [TenantId], [PermissionType]) VALUES (2, N'Manager', N'aaaaff', 1, 256, 10162, 256)
INSERT [dbo].[crm_Tenant_Roles] ([ID], [RoleName], [Description], [Active], [MaskPermission], [TenantId], [PermissionType]) VALUES (3, N'Support', NULL, 1, 143, 10162, 128)
INSERT [dbo].[crm_Tenant_Roles] ([ID], [RoleName], [Description], [Active], [MaskPermission], [TenantId], [PermissionType]) VALUES (4, N'Marketing', NULL, 1, 79, 10162, 64)
INSERT [dbo].[crm_Tenant_Roles] ([ID], [RoleName], [Description], [Active], [MaskPermission], [TenantId], [PermissionType]) VALUES (5, N'Sales', NULL, 1, 47, 10162, 32)
SET IDENTITY_INSERT [dbo].[crm_Tenant_Roles] OFF
/****** Object:  Table [dbo].[crm_Tenant_Logs]    Script Date: 09/30/2014 16:35:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Tenant_Logs](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
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
 CONSTRAINT [PK_crm_Tenant_Logs] PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[crm_Tenant_Logs] ON
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (1, 10162, 2, 2, N'Update company profiles', CAST(0x0000A38C01022EED AS DateTime), CAST(0x0000A38C01022EED AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Info', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (2, 10162, 2, 2, N'Update person contact', CAST(0x0000A38C01022F12 AS DateTime), CAST(0x0000A38C01022F12 AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'Info', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (3, 10162, 2, 2, N'Update setting success', CAST(0x0000A38E011951EC AS DateTime), CAST(0x0000A38E011951EC AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (4, 0, 2, 2, N'update user success:', CAST(0x0000A39300A24A86 AS DateTime), CAST(0x0000A39300A24A86 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (5, 0, 2, 2, N'update user success:', CAST(0x0000A39300A29F50 AS DateTime), CAST(0x0000A39300A29F50 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (6, 0, 2, 2, N'update user success:', CAST(0x0000A39300A2B762 AS DateTime), CAST(0x0000A39300A2B762 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (7, 0, 2, 2, N'update user success:', CAST(0x0000A39300A3EB0F AS DateTime), CAST(0x0000A39300A3EB0F AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (8, 0, 2, 2, N'update user success:', CAST(0x0000A39300A5FF1F AS DateTime), CAST(0x0000A39300A5FF1F AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (9, 0, 2, 2, N'update user success:', CAST(0x0000A39300AFE214 AS DateTime), CAST(0x0000A39300AFE214 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (10, 0, 2, 2, N'update user success:', CAST(0x0000A39300AFF29D AS DateTime), CAST(0x0000A39300AFF29D AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (11, 0, 2, 2, N'update user success:', CAST(0x0000A39300B03E97 AS DateTime), CAST(0x0000A39300B03E97 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (12, 0, 2, 2, N'update user success:', CAST(0x0000A39300B15F68 AS DateTime), CAST(0x0000A39300B15F68 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (13, 10162, 2, 2, N'Update setting success', CAST(0x0000A39300F9B636 AS DateTime), CAST(0x0000A39300F9B636 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (14, 0, 2, 2, N'update user success:', CAST(0x0000A393010200AC AS DateTime), CAST(0x0000A393010200AC AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (15, 0, 1, 2, N'Insert new user success', CAST(0x0000A3930114E27F AS DateTime), CAST(0x0000A3930114E27F AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (16, 0, 2, 2, N'update user success:', CAST(0x0000A3930120951C AS DateTime), CAST(0x0000A3930120951C AS DateTime), N'Chrome', N'192.168.1.50', N'sun.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (17, 10162, 2, 2, N'Update setting success', CAST(0x0000A39301218E07 AS DateTime), CAST(0x0000A39301218E07 AS DateTime), N'Chrome', N'192.168.1.50', N'sun.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (18, 0, 3, 2, N'Delete user success.', CAST(0x0000A39500BF87A8 AS DateTime), CAST(0x0000A39500BF87A8 AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (19, 0, 2, 2, N'update user success:', CAST(0x0000A39500FF4B1D AS DateTime), CAST(0x0000A39500FF4B1D AS DateTime), N'Firefox', N'192.168.1.68', N'trang-laptop.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (20, 10162, 2, 2, N'change password succes.', CAST(0x0000A39B00B498FA AS DateTime), CAST(0x0000A39B00B498FA AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (21, 10162, 2, 2, N'change password succes.', CAST(0x0000A39B00B4A4CC AS DateTime), CAST(0x0000A39B00B4A4CC AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (22, 10162, 1, 2, N'Insert new user success', CAST(0x0000A39C00ECBD3F AS DateTime), CAST(0x0000A39C00ECBD3F AS DateTime), N'Chrome', N'::1', N'Thuy-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (23, 0, 2, 59, N'update user success:', CAST(0x0000A39D00A720EF AS DateTime), CAST(0x0000A39D00A720EF AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (24, 0, 2, 59, N'change password succes.', CAST(0x0000A3A000A154CC AS DateTime), CAST(0x0000A3A000A154CC AS DateTime), N'Chrome', N'192.168.1.50', N'sun.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (27, 10162, 1, 2, N'Insert Tickets success', CAST(0x0000A3A000F4CF53 AS DateTime), CAST(0x0000A3A000F4CF53 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (28, 10162, 2, 2, N'Update setting success', CAST(0x0000A3A000F67DC2 AS DateTime), CAST(0x0000A3A000F67DC2 AS DateTime), N'Chrome', N'::1', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (48, 10162, 2, 2, N'Update setting success', CAST(0x0000A3A300AF9559 AS DateTime), CAST(0x0000A3A300AF9559 AS DateTime), N'Chrome', N'192.168.2.110', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (49, 10162, 2, 2, N'Update setting success', CAST(0x0000A3A300B601FB AS DateTime), CAST(0x0000A3A300B601FB AS DateTime), N'Chrome', N'192.168.2.110', N'HungPV-PC', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (50, 10162, 2, 2, N'Update company profiles', CAST(0x0000A3A30117A8B3 AS DateTime), CAST(0x0000A3A30117A922 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.57%11', N'Thuy-PC.cateno.vn', N'Desktop', N'Info', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (51, 10162, 2, 2, N'Update person contact', CAST(0x0000A3A301181CA1 AS DateTime), CAST(0x0000A3A301181CA1 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.57%11', N'Thuy-PC.cateno.vn', N'Desktop', N'Info', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (52, 10162, 2, 2, N'Update company profiles', CAST(0x0000A3A3011839A9 AS DateTime), CAST(0x0000A3A3011839E9 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.57%11', N'Thuy-PC.cateno.vn', N'Desktop', N'Info', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (53, 10162, 2, 2, N'Update person contact', CAST(0x0000A3A301184171 AS DateTime), CAST(0x0000A3A301184171 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.57%11', N'Thuy-PC.cateno.vn', N'Desktop', N'Info', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (54, 10162, 2, 2, N'Update setting success', CAST(0x0000A3A400F625C1 AS DateTime), CAST(0x0000A3A400F625C1 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (55, 10162, 2, 2, N'Update setting success', CAST(0x0000A3A401104F7D AS DateTime), CAST(0x0000A3A401104F7D AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.57%11', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (56, 10162, 2, 2, N'Update setting success', CAST(0x0000A3A40112C533 AS DateTime), CAST(0x0000A3A40112C533 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.57%11', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (57, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A40117011C AS DateTime), CAST(0x0000A3A40117011C AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (58, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A40117332F AS DateTime), CAST(0x0000A3A40117332F AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (59, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A40117A032 AS DateTime), CAST(0x0000A3A40117A032 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (60, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A401180019 AS DateTime), CAST(0x0000A3A401180019 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (61, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A401180EF4 AS DateTime), CAST(0x0000A3A401180EF4 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (62, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A401180F7A AS DateTime), CAST(0x0000A3A401180F7A AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (63, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A401180FE1 AS DateTime), CAST(0x0000A3A401180FE1 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (64, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A40118103A AS DateTime), CAST(0x0000A3A40118103A AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (65, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A401198786 AS DateTime), CAST(0x0000A3A401198786 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (66, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A4011A4F23 AS DateTime), CAST(0x0000A3A4011A4F23 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (67, 10162, 1, 2, N'Insert Tickets success', CAST(0x0000A3A7010C54AD AS DateTime), CAST(0x0000A3A7010C54AD AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (68, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A7010E9386 AS DateTime), CAST(0x0000A3A7010E9386 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (69, 10162, 1, 2, N'Insert Tickets success', CAST(0x0000A3A7011516D6 AS DateTime), CAST(0x0000A3A7011516D6 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (70, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A701152F7F AS DateTime), CAST(0x0000A3A701152F7F AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (71, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A701154D57 AS DateTime), CAST(0x0000A3A701154D57 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (72, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A70115D3A1 AS DateTime), CAST(0x0000A3A70115D3A1 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (73, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A70115E39C AS DateTime), CAST(0x0000A3A70115E39C AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (74, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A701163EB2 AS DateTime), CAST(0x0000A3A701163EB2 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (75, 10162, 2, 2, N'Update setting success', CAST(0x0000A3A701166FBE AS DateTime), CAST(0x0000A3A701166FBE AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (76, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A70116DFCC AS DateTime), CAST(0x0000A3A70116DFCC AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (77, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A701188D1F AS DateTime), CAST(0x0000A3A701188D1F AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (78, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A70118E75A AS DateTime), CAST(0x0000A3A70118E75A AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (79, 10162, 2, 2, N'Update setting success', CAST(0x0000A3A70119D7FD AS DateTime), CAST(0x0000A3A70119D7FD AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (80, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A7011A0195 AS DateTime), CAST(0x0000A3A7011A0195 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (81, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A7011BADB6 AS DateTime), CAST(0x0000A3A7011BADB6 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (82, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A800979A8C AS DateTime), CAST(0x0000A3A800979A8C AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (83, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A8009A9344 AS DateTime), CAST(0x0000A3A8009A9344 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (84, 10162, 1, 2, N'Insert Tickets success', CAST(0x0000A3A800B5BA01 AS DateTime), CAST(0x0000A3A800B5BA02 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (85, 10162, 2, 2, N'Update setting success', CAST(0x0000A3A800B96EAF AS DateTime), CAST(0x0000A3A800B96EAF AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (86, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A800E5D619 AS DateTime), CAST(0x0000A3A800E5D619 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (87, 10162, 2, 2, N'Update setting success', CAST(0x0000A3A800E76EAA AS DateTime), CAST(0x0000A3A800E76EAA AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (88, 10162, 2, 2, N'Update setting success', CAST(0x0000A3A800E91957 AS DateTime), CAST(0x0000A3A800E91957 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (89, 10162, 2, 2, N'Update setting success', CAST(0x0000A3A800E932C1 AS DateTime), CAST(0x0000A3A800E932C1 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (90, 10162, 2, 2, N'Update setting success', CAST(0x0000A3A800E96448 AS DateTime), CAST(0x0000A3A800E96448 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (91, 10162, 2, 2, N'Update setting success', CAST(0x0000A3A800E97E7B AS DateTime), CAST(0x0000A3A800E97E7B AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (92, 10162, 2, 2, N'Update setting success', CAST(0x0000A3A800E997F8 AS DateTime), CAST(0x0000A3A800E997F8 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (93, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A800EAC133 AS DateTime), CAST(0x0000A3A800EAC133 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (94, 10162, 2, 2, N'Update setting success', CAST(0x0000A3A800F379A0 AS DateTime), CAST(0x0000A3A800F379A0 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.57%11', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (95, 10162, 1, 2, N'Insert Tickets success', CAST(0x0000A3A800F33778 AS DateTime), CAST(0x0000A3A800F33778 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (96, 10162, 2, 2, N'Update setting success', CAST(0x0000A3A8011CF76D AS DateTime), CAST(0x0000A3A8011CF76D AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (97, 10162, 2, 2, N'Update setting success', CAST(0x0000A3A900997D1B AS DateTime), CAST(0x0000A3A900997D1B AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (98, 10162, 3, 2, N'Delete ticket success.', CAST(0x0000A3A900FD0F29 AS DateTime), CAST(0x0000A3A900FD0F29 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (99, 10162, 1, 2, N'Insert Tickets success', CAST(0x0000A3A9011A2D01 AS DateTime), CAST(0x0000A3A9011A2D01 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'User Role', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (100, 10162, 2, 2, N'Update Tickets', CAST(0x0000A3A9011A55A6 AS DateTime), CAST(0x0000A3A9011A55A6 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Ticketss', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (101, 10162, 2, 2, N'Update company profiles', CAST(0x0000A3AA009E6957 AS DateTime), CAST(0x0000A3AA009E6957 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.57%11', N'Thuy-PC.cateno.vn', N'Desktop', N'Info', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (102, 10162, 2, 2, N'Update company profiles', CAST(0x0000A3AA009EA958 AS DateTime), CAST(0x0000A3AA009EA958 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.57%11', N'Thuy-PC.cateno.vn', N'Desktop', N'Info', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (103, 10162, 3, 2, N'Delete ticket success.', CAST(0x0000A3AA010D22C8 AS DateTime), CAST(0x0000A3AA010D22C8 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (104, 10162, 2, 2, N'Update setting success', CAST(0x0000A3AE00AD998C AS DateTime), CAST(0x0000A3AE00AD998C AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.57%11', N'Thuy-PC.cateno.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (105, 10162, 1, 2, N'Insert Bugs success', CAST(0x0000A3B5009EDFCB AS DateTime), CAST(0x0000A3B5009EDFCB AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'project bugs', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (106, 10162, 2, 2, N'Update Bugs', CAST(0x0000A3B5009F218B AS DateTime), CAST(0x0000A3B5009F218B AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Projects Bug', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (107, 10162, 2, 2, N'Update Bugs', CAST(0x0000A3B5009F3E12 AS DateTime), CAST(0x0000A3B5009F3E12 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Projects Bug', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (108, 10162, 1, 2, N'Insert Bugs success', CAST(0x0000A3B500E4A543 AS DateTime), CAST(0x0000A3B500E4A543 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'project bugs', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (109, 10162, 3, 2, N'Delete Bug success.', CAST(0x0000A3B500E89A65 AS DateTime), CAST(0x0000A3B500E89A65 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Projects bug', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (110, 10162, 1, 2, N'Insert new user success', CAST(0x0000A3B500ED178E AS DateTime), CAST(0x0000A3B500ED178E AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (111, 10162, 3, 2, N'Delete ticket success.', CAST(0x0000A3B50114E70E AS DateTime), CAST(0x0000A3B50114E70E AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (112, 10162, 2, 2, N'Update setting success', CAST(0x0000A3B50114F809 AS DateTime), CAST(0x0000A3B50114F809 AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'setting', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (113, 10162, 1, 2, N'Insert Tasks success', CAST(0x0000A3B5011A8541 AS DateTime), CAST(0x0000A3B5011A8541 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'project Tasks', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (114, 10162, 3, 2, N'Delete ticket success.', CAST(0x0000A3B5011938EC AS DateTime), CAST(0x0000A3B5011938EC AS DateTime), N'Firefox', N'127.0.0.1', N'32278.localhost.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (115, 10162, 2, 2, N'Update Tasks', CAST(0x0000A3B5011B0BD8 AS DateTime), CAST(0x0000A3B5011B0BD8 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Projects Task', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (116, 10162, 1, 2, N'Insert Tasks success', CAST(0x0000A3B5011B2E1C AS DateTime), CAST(0x0000A3B5011B2E1C AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'project Tasks', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (117, 10162, 3, 2, N'Delete Task success.', CAST(0x0000A3B5011B36F4 AS DateTime), CAST(0x0000A3B5011B36F4 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Projects Task', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (118, 10162, 3, 2, N'Delete Bug success.', CAST(0x0000A3B501252F34 AS DateTime), CAST(0x0000A3B501252F34 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Projects bug', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (119, 10162, 3, 2, N'Delete Task success.', CAST(0x0000A3B5012547E2 AS DateTime), CAST(0x0000A3B5012547E2 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'Projects Task', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (120, 10162, 3, 2, N'Delete ticket success.', CAST(0x0000A3B50128E13A AS DateTime), CAST(0x0000A3B50128E13A AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (121, 10162, 3, 2, N'Delete ticket success.', CAST(0x0000A3B50129005A AS DateTime), CAST(0x0000A3B50129005A AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (122, 10162, 3, 2, N'Delete ticket success.', CAST(0x0000A3B5012906F2 AS DateTime), CAST(0x0000A3B5012906F2 AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (123, 10162, 3, 2, N'Delete ticket success.', CAST(0x0000A3B5012936BF AS DateTime), CAST(0x0000A3B5012936BF AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (124, 10162, 3, 2, N'Delete ticket success.', CAST(0x0000A3B501293CDC AS DateTime), CAST(0x0000A3B501293CDC AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
INSERT [dbo].[crm_Tenant_Logs] ([LogId], [TenantId], [LogTypeActionId], [UserId], [Content], [LoginDate], [LogoutDate], [AccessBrowser], [DetectedIp], [ComputerName], [Platform], [Component], [IsSuccess]) VALUES (125, 10162, 3, 2, N'Delete ticket success.', CAST(0x0000A3B50129402C AS DateTime), CAST(0x0000A3B50129402C AS DateTime), N'Chrome', N'fe80::5efe:192.168.1.50%11', N'HP-PC.cateno.vn', N'Desktop', N'User', 1)
SET IDENTITY_INSERT [dbo].[crm_Tenant_Logs] OFF
/****** Object:  Table [dbo].[crm_Tenant_LogAction]    Script Date: 09/30/2014 16:35:20 ******/
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
/****** Object:  Table [dbo].[crm_Tenant_EmailQueues]    Script Date: 09/30/2014 16:35:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Tenant_EmailQueues](
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
	[SendBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[crm_Tasks]    Script Date: 09/30/2014 16:35:20 ******/
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
/****** Object:  Table [dbo].[crm_Status]    Script Date: 09/30/2014 16:35:20 ******/
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
INSERT [dbo].[crm_Status] ([StatusId], [StatusName], [StatusType]) VALUES (6, N'New', N'ticket')
INSERT [dbo].[crm_Status] ([StatusId], [StatusName], [StatusType]) VALUES (7, N'In progress', N'ticket')
INSERT [dbo].[crm_Status] ([StatusId], [StatusName], [StatusType]) VALUES (8, N'Complete', N'ticket')
INSERT [dbo].[crm_Status] ([StatusId], [StatusName], [StatusType]) VALUES (9, N'New', N'bug')
INSERT [dbo].[crm_Status] ([StatusId], [StatusName], [StatusType]) VALUES (10, N'In progress', N'bug')
INSERT [dbo].[crm_Status] ([StatusId], [StatusName], [StatusType]) VALUES (11, N'Complete', N'bug')
INSERT [dbo].[crm_Status] ([StatusId], [StatusName], [StatusType]) VALUES (12, N'New', N'task')
INSERT [dbo].[crm_Status] ([StatusId], [StatusName], [StatusType]) VALUES (13, N'In progress', N'task')
INSERT [dbo].[crm_Status] ([StatusId], [StatusName], [StatusType]) VALUES (14, N'Complete', N'task')
SET IDENTITY_INSERT [dbo].[crm_Status] OFF
/****** Object:  Table [dbo].[crm_Resolutions]    Script Date: 09/30/2014 16:35:20 ******/
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
SET IDENTITY_INSERT [dbo].[crm_Resolutions] ON
INSERT [dbo].[crm_Resolutions] ([ResolutionId], [ResolutionName], [ResolutionType]) VALUES (1, N'Fix', N'ticket')
INSERT [dbo].[crm_Resolutions] ([ResolutionId], [ResolutionName], [ResolutionType]) VALUES (2, N'None', N'ticket')
INSERT [dbo].[crm_Resolutions] ([ResolutionId], [ResolutionName], [ResolutionType]) VALUES (3, N'Next', N'ticket')
INSERT [dbo].[crm_Resolutions] ([ResolutionId], [ResolutionName], [ResolutionType]) VALUES (4, N'Fix', N'bug')
INSERT [dbo].[crm_Resolutions] ([ResolutionId], [ResolutionName], [ResolutionType]) VALUES (5, N'None', N'bug')
INSERT [dbo].[crm_Resolutions] ([ResolutionId], [ResolutionName], [ResolutionType]) VALUES (6, N'Next', N'bug')
INSERT [dbo].[crm_Resolutions] ([ResolutionId], [ResolutionName], [ResolutionType]) VALUES (7, N'Fix', N'task')
INSERT [dbo].[crm_Resolutions] ([ResolutionId], [ResolutionName], [ResolutionType]) VALUES (8, N'None', N'task')
INSERT [dbo].[crm_Resolutions] ([ResolutionId], [ResolutionName], [ResolutionType]) VALUES (9, N'Next', N'task')
SET IDENTITY_INSERT [dbo].[crm_Resolutions] OFF
/****** Object:  Table [dbo].[crm_Projects]    Script Date: 09/30/2014 16:35:20 ******/
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
	[IsActive] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ProjectId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[crm_Projects] ON
INSERT [dbo].[crm_Projects] ([ProjectId], [ProjectName], [ProjectCode], [Description], [CategoryId], [ProjectLeadId], [StatusId], [StartedDate], [CompletedDate], [ContactId], [CreatedDate], [ModifiedDate], [IsActive]) VALUES (23, N'project', N'avbD', N'description', 1, 2, 1, CAST(0x0000A3AA00000000 AS DateTime), CAST(0x0000A40D00000000 AS DateTime), 1, CAST(0x0000A3AA00DE812F AS DateTime), CAST(0x0000A3AA00DE812F AS DateTime), 1)
INSERT [dbo].[crm_Projects] ([ProjectId], [ProjectName], [ProjectCode], [Description], [CategoryId], [ProjectLeadId], [StatusId], [StartedDate], [CompletedDate], [ContactId], [CreatedDate], [ModifiedDate], [IsActive]) VALUES (24, N'project 1234', N'1234', N'description', 1, 2, 1, CAST(0x0000A3B000000000 AS DateTime), CAST(0x0000A40D00000000 AS DateTime), 1, CAST(0x0000A3B000E1E2B9 AS DateTime), CAST(0x0000A3B000E1E2B9 AS DateTime), 0)
INSERT [dbo].[crm_Projects] ([ProjectId], [ProjectName], [ProjectCode], [Description], [CategoryId], [ProjectLeadId], [StatusId], [StartedDate], [CompletedDate], [ContactId], [CreatedDate], [ModifiedDate], [IsActive]) VALUES (25, N'qqqq', N'qqqq', NULL, 25, 2, 1, CAST(0x0000A3B500000000 AS DateTime), CAST(0x0000A40D00000000 AS DateTime), 0, CAST(0x0000A3B501182CC6 AS DateTime), CAST(0x0000A3B501182CC6 AS DateTime), 0)
INSERT [dbo].[crm_Projects] ([ProjectId], [ProjectName], [ProjectCode], [Description], [CategoryId], [ProjectLeadId], [StatusId], [StartedDate], [CompletedDate], [ContactId], [CreatedDate], [ModifiedDate], [IsActive]) VALUES (26, N'1245', N'1245', NULL, 1, 2, 1, CAST(0x0000A3B500000000 AS DateTime), CAST(0x0000A40D00000000 AS DateTime), 0, CAST(0x0000A3B5011D15F2 AS DateTime), CAST(0x0000A3B5011D15F2 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[crm_Projects] OFF
/****** Object:  Table [dbo].[crm_ProjectCategories]    Script Date: 09/30/2014 16:35:20 ******/
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
SET IDENTITY_INSERT [dbo].[crm_ProjectCategories] ON
INSERT [dbo].[crm_ProjectCategories] ([CategoryId], [CategoryName], [Description]) VALUES (1, N'TEST 1', N'TEST')
INSERT [dbo].[crm_ProjectCategories] ([CategoryId], [CategoryName], [Description]) VALUES (2, N'TEST 20', NULL)
INSERT [dbo].[crm_ProjectCategories] ([CategoryId], [CategoryName], [Description]) VALUES (4, N'TEST 30', NULL)
INSERT [dbo].[crm_ProjectCategories] ([CategoryId], [CategoryName], [Description]) VALUES (5, N'TEST 40', NULL)
INSERT [dbo].[crm_ProjectCategories] ([CategoryId], [CategoryName], [Description]) VALUES (6, N'TEST 5', NULL)
INSERT [dbo].[crm_ProjectCategories] ([CategoryId], [CategoryName], [Description]) VALUES (7, N'TEST 6', NULL)
INSERT [dbo].[crm_ProjectCategories] ([CategoryId], [CategoryName], [Description]) VALUES (8, N'TEST 7', NULL)
INSERT [dbo].[crm_ProjectCategories] ([CategoryId], [CategoryName], [Description]) VALUES (9, N'test 10', NULL)
INSERT [dbo].[crm_ProjectCategories] ([CategoryId], [CategoryName], [Description]) VALUES (10, N'TEST 8', NULL)
INSERT [dbo].[crm_ProjectCategories] ([CategoryId], [CategoryName], [Description]) VALUES (12, N'TEST 9', NULL)
INSERT [dbo].[crm_ProjectCategories] ([CategoryId], [CategoryName], [Description]) VALUES (17, N'TEST 11', NULL)
INSERT [dbo].[crm_ProjectCategories] ([CategoryId], [CategoryName], [Description]) VALUES (21, N'TEST 01', NULL)
INSERT [dbo].[crm_ProjectCategories] ([CategoryId], [CategoryName], [Description]) VALUES (22, N'C#', N'C#')
INSERT [dbo].[crm_ProjectCategories] ([CategoryId], [CategoryName], [Description]) VALUES (23, N'MVC', N'MVC')
INSERT [dbo].[crm_ProjectCategories] ([CategoryId], [CategoryName], [Description]) VALUES (24, N'SQL', N'SQL')
INSERT [dbo].[crm_ProjectCategories] ([CategoryId], [CategoryName], [Description]) VALUES (25, N'MNX', N'MNX')
SET IDENTITY_INSERT [dbo].[crm_ProjectCategories] OFF
/****** Object:  Table [dbo].[crm_Project_Permissions]    Script Date: 09/30/2014 16:35:20 ******/
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
SET IDENTITY_INSERT [dbo].[crm_Project_Permissions] ON
INSERT [dbo].[crm_Project_Permissions] ([PermissionId], [ProjectId], [UserId]) VALUES (27, 23, 2)
INSERT [dbo].[crm_Project_Permissions] ([PermissionId], [ProjectId], [UserId]) VALUES (29, 23, 3)
INSERT [dbo].[crm_Project_Permissions] ([PermissionId], [ProjectId], [UserId]) VALUES (30, 24, 2)
INSERT [dbo].[crm_Project_Permissions] ([PermissionId], [ProjectId], [UserId]) VALUES (33, 25, 3)
SET IDENTITY_INSERT [dbo].[crm_Project_Permissions] OFF
/****** Object:  Table [dbo].[crm_Profiles]    Script Date: 09/30/2014 16:35:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_Profiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NULL,
	[AssignedUserId] [int] NULL,
	[TenantNameAlias] [nvarchar](100) NULL,
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
	[PackageName] [nvarchar](10) NULL,
 CONSTRAINT [PK__crm_Prof__3214EC07182C9B23] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[crm_Profiles] ON
INSERT [dbo].[crm_Profiles] ([Id], [TenantId], [AssignedUserId], [TenantNameAlias], [TenantName], [Phone], [Email], [Fax], [OrgNumber], [Website], [CountryId], [CompanyLogo], [CreatedDate], [ModifiedBy], [ModifiedDate], [Active], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [Information], [PostedAddress], [PostedDistrict], [PostedNumber], [VisitingAddress], [VisitingDistrict], [VisitingNumber], [NumberOfUsers], [NumberOfProjects], [NumberOfCustomers], [ExpiryDate], [PackageName]) VALUES (1, 10162, 3, NULL, N'Hoang Thuy', N'84933389128', N'demo1506@gmail.com', N'1234', N'demo1506', N'http://multiorg.cateno.vn/demo1506/', 1, N'/tenants/demo1506/default.png', CAST(0x0000A38C00F932A9 AS DateTime), 2, CAST(0x0000A3AA009EA861 AS DateTime), 1, N'http://www.linkedIn.com/', N'http://www.facebook.com/', N'http://www.twitter.com/1234444', N'https://www.google.com.vn/', N'INFO', N'231/23 Duong Ba Trac, P.1, Q.8', N'SANDVIKA', N'1337', N'123', N'SNARØYA', N'1335', 3, 3, 3, CAST(0x0000A3B600000000 AS DateTime), N'A')
SET IDENTITY_INSERT [dbo].[crm_Profiles] OFF
/****** Object:  Table [dbo].[crm_DocumentTypes]    Script Date: 09/30/2014 16:35:20 ******/
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
/****** Object:  Table [dbo].[crm_Documents]    Script Date: 09/30/2014 16:35:20 ******/
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
SET IDENTITY_INSERT [dbo].[crm_Documents] ON
INSERT [dbo].[crm_Documents] ([DocumentId], [ProjectId], [DocumentName], [TypeId], [Datetime], [Comment]) VALUES (1, 12, N'ABC', 4, CAST(0x0000A3FF00000000 AS DateTime), N'Document 123 safsd afsd fasd fsd')
INSERT [dbo].[crm_Documents] ([DocumentId], [ProjectId], [DocumentName], [TypeId], [Datetime], [Comment]) VALUES (2, 12, N'sadas', 0, CAST(0x0000A3A8010DF3C3 AS DateTime), N'sdasd sdaf sad sdf sdf sdfasdf')
INSERT [dbo].[crm_Documents] ([DocumentId], [ProjectId], [DocumentName], [TypeId], [Datetime], [Comment]) VALUES (5, 12, N'213123', 0, CAST(0x0000A3AA010CE5D9 AS DateTime), N'asdasd asd adas')
INSERT [dbo].[crm_Documents] ([DocumentId], [ProjectId], [DocumentName], [TypeId], [Datetime], [Comment]) VALUES (6, 12, N'213123', 0, CAST(0x0000A3AA010CE679 AS DateTime), N'asdasd asd adas')
INSERT [dbo].[crm_Documents] ([DocumentId], [ProjectId], [DocumentName], [TypeId], [Datetime], [Comment]) VALUES (7, 12, N'sadas', 0, CAST(0x0000A3AF00BB19A6 AS DateTime), N'sdasd')
INSERT [dbo].[crm_Documents] ([DocumentId], [ProjectId], [DocumentName], [TypeId], [Datetime], [Comment]) VALUES (8, 12, N'sadas', 0, CAST(0x0000A3AF00BBF8FC AS DateTime), N'sdasd')
INSERT [dbo].[crm_Documents] ([DocumentId], [ProjectId], [DocumentName], [TypeId], [Datetime], [Comment]) VALUES (9, 12, N'sadas', 0, CAST(0x0000A3AF00BC14AB AS DateTime), N'sdasd sa sdf sdfasfsadfasdf sd')
INSERT [dbo].[crm_Documents] ([DocumentId], [ProjectId], [DocumentName], [TypeId], [Datetime], [Comment]) VALUES (10, 12, N'sadas', 0, CAST(0x0000A3AF00BCD0AD AS DateTime), N'sdasd')
INSERT [dbo].[crm_Documents] ([DocumentId], [ProjectId], [DocumentName], [TypeId], [Datetime], [Comment]) VALUES (12, 12, N'sadas', 0, CAST(0x0000A3B000A1A0A0 AS DateTime), N'sdasd  sad sdasasd')
INSERT [dbo].[crm_Documents] ([DocumentId], [ProjectId], [DocumentName], [TypeId], [Datetime], [Comment]) VALUES (14, 12, N'sadas', 0, CAST(0x0000A3B000A1C900 AS DateTime), N'sdasd  sad sdasasd')
INSERT [dbo].[crm_Documents] ([DocumentId], [ProjectId], [DocumentName], [TypeId], [Datetime], [Comment]) VALUES (15, 12, N'sadas', 0, CAST(0x0000A3B000A1D66A AS DateTime), N'sdasd  sad sdasasd')
INSERT [dbo].[crm_Documents] ([DocumentId], [ProjectId], [DocumentName], [TypeId], [Datetime], [Comment]) VALUES (16, 12, N'sdgdfg ', 0, CAST(0x0000A3B50114B8A4 AS DateTime), N'dfgsdfg dfgdf')
INSERT [dbo].[crm_Documents] ([DocumentId], [ProjectId], [DocumentName], [TypeId], [Datetime], [Comment]) VALUES (17, 12, N'adasdasdasd', 0, CAST(0x0000A3B501180BF0 AS DateTime), N'sadasdas')
SET IDENTITY_INSERT [dbo].[crm_Documents] OFF
/****** Object:  Table [dbo].[crm_Customers]    Script Date: 09/30/2014 16:35:20 ******/
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
	[PostedDistrict] [nvarchar](200) NULL,
	[PostedNumber] [nvarchar](200) NULL,
	[VisitingDistrict] [nvarchar](200) NULL,
	[VisitingNumber] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[crm_Customers] ON
INSERT [dbo].[crm_Customers] ([CustomerId], [CustomerName], [OrgNumber], [PostedAddress], [VisitingAddress], [Email], [Fax], [Street], [Website], [City], [State], [ZipCode], [CountryId], [Description], [CustomerLogo], [CustomerGroup], [CustomerAdditionalInfo], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [PostedDistrict], [PostedNumber], [VisitingDistrict], [VisitingNumber]) VALUES (1, N'Quynh0922', N'123456', N'43432', N'324324', N'Quynh0922@gmail.com', N'32423432', NULL, N'', NULL, NULL, NULL, 4, N'4332324', N'', NULL, NULL, N'', N'', N'', N'', 2, CAST(0x0000A3B000A07E85 AS DateTime), NULL, NULL, N'', N'', N'', N'')
INSERT [dbo].[crm_Customers] ([CustomerId], [CustomerName], [OrgNumber], [PostedAddress], [VisitingAddress], [Email], [Fax], [Street], [Website], [City], [State], [ZipCode], [CountryId], [Description], [CustomerLogo], [CustomerGroup], [CustomerAdditionalInfo], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [PostedDistrict], [PostedNumber], [VisitingDistrict], [VisitingNumber]) VALUES (3, N'thuyhk', N'123465', N'', N'', N'thuyhk@gmail.com', N'', NULL, N'', NULL, NULL, NULL, 4, N'', N'default.jpg', NULL, NULL, N'', N'', N'', N'', 2, CAST(0x0000A3B5011627FA AS DateTime), NULL, NULL, N'', N'', N'', N'')
INSERT [dbo].[crm_Customers] ([CustomerId], [CustomerName], [OrgNumber], [PostedAddress], [VisitingAddress], [Email], [Fax], [Street], [Website], [City], [State], [ZipCode], [CountryId], [Description], [CustomerLogo], [CustomerGroup], [CustomerAdditionalInfo], [LinkedURL], [FacebookURL], [TwitterURL], [GoogleplusURL], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [PostedDistrict], [PostedNumber], [VisitingDistrict], [VisitingNumber]) VALUES (4, N'CUS 1', N'123546', N'', N'', N'cus1@gmail.com', N'', NULL, N'', NULL, NULL, NULL, 4, N'', N'default.jpg', NULL, NULL, N'', N'', N'', N'', 2, CAST(0x0000A3B50117B64B AS DateTime), NULL, NULL, N'', N'', N'', N'')
SET IDENTITY_INSERT [dbo].[crm_Customers] OFF
/****** Object:  Table [dbo].[crm_Contacts]    Script Date: 09/30/2014 16:35:20 ******/
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
SET IDENTITY_INSERT [dbo].[crm_Contacts] ON
INSERT [dbo].[crm_Contacts] ([ContactId], [FirstName], [LastName], [ContactPhone], [MobilePhone], [Address], [Active], [CreatedDate], [Email], [IsDefault], [CustomerId], [Gender]) VALUES (1, N'CUS', N'1', NULL, N'0933389128', N'aaa', 1, NULL, N'thinh@gmail.com', NULL, 1, N'Male')
SET IDENTITY_INSERT [dbo].[crm_Contacts] OFF
/****** Object:  Table [dbo].[crm_Bugs]    Script Date: 09/30/2014 16:35:20 ******/
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
/****** Object:  Table [dbo].[crm_AttachFiles]    Script Date: 09/30/2014 16:35:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[crm_AttachFiles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FileName] [nvarchar](250) NULL,
	[FilePath] [nvarchar](500) NULL,
	[ProjectId] [int] NULL,
	[AttachId] [int] NULL,
	[Type] [nvarchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
