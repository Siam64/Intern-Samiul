USE [master]
GO
/****** Object:  Database [CMSS]    Script Date: 9/11/2024 10:41:30 AM ******/
CREATE DATABASE [CMSS]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CMSS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CMSS.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CMSS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CMSS_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CMSS] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CMSS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CMSS] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CMSS] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CMSS] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CMSS] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CMSS] SET ARITHABORT OFF 
GO
ALTER DATABASE [CMSS] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CMSS] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CMSS] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CMSS] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CMSS] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CMSS] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CMSS] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CMSS] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CMSS] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CMSS] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CMSS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CMSS] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CMSS] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CMSS] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CMSS] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CMSS] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [CMSS] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CMSS] SET RECOVERY FULL 
GO
ALTER DATABASE [CMSS] SET  MULTI_USER 
GO
ALTER DATABASE [CMSS] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CMSS] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CMSS] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CMSS] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CMSS] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CMSS] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CMSS', N'ON'
GO
ALTER DATABASE [CMSS] SET QUERY_STORE = ON
GO
ALTER DATABASE [CMSS] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CMSS]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 9/11/2024 10:41:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 9/11/2024 10:41:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 9/11/2024 10:41:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 9/11/2024 10:41:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 9/11/2024 10:41:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 9/11/2024 10:41:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 9/11/2024 10:41:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[FirstName] [nvarchar](255) NOT NULL,
	[LastName] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 9/11/2024 10:41:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](128) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerInfo]    Script Date: 9/11/2024 10:41:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Number] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
	[Note] [nvarchar](max) NOT NULL,
	[city] [nvarchar](max) NOT NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[CreateBy] [uniqueidentifier] NOT NULL,
	[UpdateAt] [datetime2](7) NOT NULL,
	[UpdateBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_CustomerInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[lookup]    Script Date: 9/11/2024 10:41:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lookup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Serial] [int] NOT NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[CreateBy] [uniqueidentifier] NOT NULL,
	[UpdateAt] [datetime2](7) NOT NULL,
	[UpdateBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_lookup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ParcelInfo]    Script Date: 9/11/2024 10:41:31 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ParcelInfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParcelID] [uniqueidentifier] NOT NULL,
	[ParcelType] [nvarchar](max) NOT NULL,
	[Weight] [float] NOT NULL,
	[Price] [float] NOT NULL,
	[Note] [nvarchar](max) NOT NULL,
	[DelivaryDate] [datetime2](7) NOT NULL,
	[SenderID] [uniqueidentifier] NOT NULL,
	[ReceiverID] [uniqueidentifier] NOT NULL,
	[CreateAt] [datetime2](7) NOT NULL,
	[CreateBy] [uniqueidentifier] NOT NULL,
	[UpdateAt] [datetime2](7) NOT NULL,
	[UpdateBy] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ParcelInfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240903050050_create db', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240904135130_Add', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240905162057_createParcelInfoAndCustomerInfo', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240909091019_CreateParcelInfo', N'8.0.8')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20240910151006_Createlookup', N'8.0.8')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'13f5b2b6-51e4-4e48-ad7e-4616db4f8a12', N'md@gmail.com', N'MD@GMAIL.COM', N'md@gmail.com', N'MD@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEAfWpBHbQSyH0Bf/oSROqTGAbw+ZumMRjaCM2RutNo8PwPusSLRrzmAPvJ1eZ7IeKg==', N'JBDMUSILN67JRXXGYCQULGNBJABFEF2L', N'fc63bd5d-5724-4fa1-a87b-1266f7be9837', NULL, 0, 0, NULL, 1, 0, N'Md', N'Hasan')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'2f6908d9-a37c-48dc-963e-341bc8e1fae9', N'xyz@gmail.com', N'XYZ@GMAIL.COM', N'xyz@gmail.com', N'XYZ@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAENbaxIkjFC5NL8zQF6UEY3hTsPJ0+hfEOYwGGlG1mWC21J3u823pq42uCkZd61jE3A==', N'4ZJJFE6AANIAMSIIDWPLN47LUQFAPYV6', N'ee38536f-9068-46ca-ac91-6f838f574ea9', NULL, 0, 0, NULL, 1, 0, N'Samiul', N'Alim')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'411c4a0f-efdb-4422-bf52-f2243855dcbf', N'sami@gmail.com', N'SAMI@GMAIL.COM', N'sami@gmail.com', N'SAMI@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEFCO5ultnzmK5vJm6Nml8broU9gFxllzC/P6EdSJwXM/2oDVmRJdXDfp3ApCcZky6Q==', N'5Z433B26THAYU4PFZBLXL2NJGQM4DZR6', N'a14f5a4b-f180-45ae-bad2-6b8790a8b6fe', NULL, 0, 0, NULL, 1, 0, N'', N'')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'76157c19-46fe-4273-97c0-c7033b2e442b', N'abc@gmail.com', N'ABC@GMAIL.COM', N'abc@gmail.com', N'ABC@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEILtVuaePZXQlsRkERn49EiQPWRuFpJG+EF0dWT7ynPPa8Ac/WfCXSfTassI8AuV/Q==', N'YZQMT77EDFSWT43MA4SLSRI3BTMS2456', N'6efa0611-683b-406e-baed-c18f9441686a', NULL, 0, 0, NULL, 1, 0, N'', N'')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'9d05235a-66fc-4f81-92b2-7d134219cb21', N'siam@gmail.com', N'SIAM@GMAIL.COM', N'siam@gmail.com', N'SIAM@GMAIL.COM', 1, N'AQAAAAIAAYagAAAAEPTArUnK0iFkps5VMmn1SoIguC/zzah0GrmzeIDNxAU7EfctRFe0zGC7usvPPEYxjw==', N'WTIGGTJY3B5TJTKGYF5V7CYXT4MQEFVC', N'd6919395-19d0-4a67-b292-5542b51f2637', NULL, 0, 0, NULL, 1, 0, N'', N'')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'9f900e9f-b3f1-4633-a66c-9982fb636a7d', N'samiul@gmail.com', N'SAMIUL@GMAIL.COM', N'samiul@gmail.com', N'SAMIUL@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAEFm4u/L+S9VeyjXdGUJQS+dohNs5PPC5rpDB1C6uMdFOA/ozbm7InLZuViXLKIwC2w==', N'FLJE54MTKGLRSOM7PQGBHUGZQUQH3KKU', N'75fdcf22-060d-47dc-b34a-2e506437efcb', NULL, 0, 0, NULL, 1, 0, N'', N'')
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [FirstName], [LastName]) VALUES (N'd95385d3-76fc-4d67-961c-325a6af9032f', N'roni@gmail.com', N'RONI@GMAIL.COM', N'roni@gmail.com', N'RONI@GMAIL.COM', 0, N'AQAAAAIAAYagAAAAECMvG30b7EzQbb1ChT8gkjf5dk5xcJRieoxkQSRGwJyjsyOQwUGq9mqMFbRtKRke9g==', N'CLSTOAATUDWY3EMNJEPOYGSE4ML2AQJG', N'e8b2f5b7-dd94-4551-852c-de6f83069c83', NULL, 0, 0, NULL, 1, 0, N'md', N'roni')
GO
SET IDENTITY_INSERT [dbo].[CustomerInfo] ON 

INSERT [dbo].[CustomerInfo] ([ID], [CustomerID], [Name], [Number], [Email], [Address], [Note], [city], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (3, N'00000000-0000-0000-0000-000000000000', N'Samiul', N'01644077454', N'siam@gmail.com', N'gazipur sadar', N'handle with care', N'Gazipur', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[CustomerInfo] ([ID], [CustomerID], [Name], [Number], [Email], [Address], [Note], [city], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (4, N'00000000-0000-0000-0000-000000000000', N'sam', N'017577451', N'sam@sam.com', N'uttara', N'handle with care', N'dhaka', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[CustomerInfo] ([ID], [CustomerID], [Name], [Number], [Email], [Address], [Note], [city], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (1003, N'00000000-0000-0000-0000-000000000000', N'abc', N'0154426', N'abc@abc.com', N'kushtia', N'handle with care', N'Kushtia', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[CustomerInfo] ([ID], [CustomerID], [Name], [Number], [Email], [Address], [Note], [city], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (1004, N'00000000-0000-0000-0000-000000000000', N'rahim', N'0215565', N'rahim@ra.com', N'feni', N'handle with care', N'feni', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000')
INSERT [dbo].[CustomerInfo] ([ID], [CustomerID], [Name], [Number], [Email], [Address], [Note], [city], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (2005, N'00000000-0000-0000-0000-000000000000', N'hasan', N'05656562', N'abc@abc.com', N'barishal', N'handle', N'Barisal', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'00000000-0000-0000-0000-000000000000')
SET IDENTITY_INSERT [dbo].[CustomerInfo] OFF
GO
SET IDENTITY_INSERT [dbo].[lookup] ON 

INSERT [dbo].[lookup] ([Id], [Type], [Value], [Name], [IsActive], [Serial], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (1, N'City', N'-1', N'Select City', 1, 0, CAST(N'2024-09-10T21:16:58.2200000' AS DateTime2), N'0ab8b49a-b84d-483c-b673-cb5462209329', CAST(N'2024-09-10T21:16:58.2200000' AS DateTime2), N'c22d5a9d-9328-4880-86ee-3d4373b25dcf')
INSERT [dbo].[lookup] ([Id], [Type], [Value], [Name], [IsActive], [Serial], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (2, N'City', N'Dhaka', N'Dhaka', 1, 1, CAST(N'2024-09-10T21:16:58.2200000' AS DateTime2), N'7942a227-36e1-430f-a48e-6b8a5cb00ae0', CAST(N'2024-09-10T21:16:58.2200000' AS DateTime2), N'a3388e2c-4a73-4b26-9a89-723faf0139d5')
INSERT [dbo].[lookup] ([Id], [Type], [Value], [Name], [IsActive], [Serial], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (3, N'City', N'Chittagong', N'Chittagong', 1, 2, CAST(N'2024-09-10T21:16:58.2200000' AS DateTime2), N'b7bf6a67-7f8c-4532-845f-e097eb8485dc', CAST(N'2024-09-10T21:16:58.2200000' AS DateTime2), N'1e76499f-cc8b-41d9-8b0e-dd7e1982419e')
INSERT [dbo].[lookup] ([Id], [Type], [Value], [Name], [IsActive], [Serial], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (4, N'City', N'Khulna', N'Khulna', 1, 3, CAST(N'2024-09-10T21:16:58.2200000' AS DateTime2), N'593f2129-4229-47d1-b496-2e7272be7821', CAST(N'2024-09-10T21:16:58.2200000' AS DateTime2), N'43936632-d0a7-450e-8b10-4bcea844e41e')
INSERT [dbo].[lookup] ([Id], [Type], [Value], [Name], [IsActive], [Serial], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (5, N'City', N'Rajshahi', N'Rajshahi', 1, 4, CAST(N'2024-09-10T21:16:58.2200000' AS DateTime2), N'ca3d8a29-dd95-4a4f-b082-35cab58f1ed1', CAST(N'2024-09-10T21:16:58.2200000' AS DateTime2), N'2a20fbc8-2149-4fd2-898b-a71aa1cd46a6')
INSERT [dbo].[lookup] ([Id], [Type], [Value], [Name], [IsActive], [Serial], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (6, N'City', N'Sylhet', N'Sylhet', 1, 5, CAST(N'2024-09-10T21:16:58.2200000' AS DateTime2), N'fdeeb2f2-2e15-4ad2-886e-0e6bdbd5cd7e', CAST(N'2024-09-10T21:16:58.2200000' AS DateTime2), N'98202ddf-ef2a-4d6a-b6a4-dd395e4b16c5')
INSERT [dbo].[lookup] ([Id], [Type], [Value], [Name], [IsActive], [Serial], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (7, N'City', N'Barisal', N'Barisal', 1, 6, CAST(N'2024-09-10T21:16:58.2200000' AS DateTime2), N'24340c18-df57-4d99-a298-f16a4177083e', CAST(N'2024-09-10T21:16:58.2200000' AS DateTime2), N'5a6ebde7-b5ec-4c8e-adfc-f2a4fcf16705')
INSERT [dbo].[lookup] ([Id], [Type], [Value], [Name], [IsActive], [Serial], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (8, N'City', N'Rangpur', N'Rangpur', 1, 7, CAST(N'2024-09-10T21:16:58.2200000' AS DateTime2), N'c1ad40bd-6e91-42f5-8588-6863464ad866', CAST(N'2024-09-10T21:16:58.2200000' AS DateTime2), N'bb651afe-87e0-437a-8887-6238f487e66b')
INSERT [dbo].[lookup] ([Id], [Type], [Value], [Name], [IsActive], [Serial], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (9, N'City', N'Mymensingh', N'Mymensingh', 1, 8, CAST(N'2024-09-10T21:16:58.2200000' AS DateTime2), N'cba718d3-6c7b-4b82-ab32-c897900fd2a2', CAST(N'2024-09-10T21:16:58.2200000' AS DateTime2), N'c5b35587-c100-4b66-bd03-333cf778935f')
INSERT [dbo].[lookup] ([Id], [Type], [Value], [Name], [IsActive], [Serial], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (10, N'ParcelType', N'-1', N'Select a type', 1, 0, CAST(N'2024-09-11T09:14:21.6066667' AS DateTime2), N'97abd83f-3497-4389-8a3d-806325bcb47b', CAST(N'2024-09-11T09:14:21.6066667' AS DateTime2), N'7fdc912a-cdb8-4b3d-8a18-bbaad0a845f3')
INSERT [dbo].[lookup] ([Id], [Type], [Value], [Name], [IsActive], [Serial], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (11, N'ParcelType', N'Paper', N'Paper', 1, 1, CAST(N'2024-09-11T09:14:21.6066667' AS DateTime2), N'3064a10e-393d-4e72-94fb-134c27fccbba', CAST(N'2024-09-11T09:14:21.6066667' AS DateTime2), N'34c93917-c336-489e-b848-f8f93cbff6fa')
INSERT [dbo].[lookup] ([Id], [Type], [Value], [Name], [IsActive], [Serial], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (12, N'ParcelType', N'Glass', N'Glass', 1, 2, CAST(N'2024-09-11T09:14:21.6066667' AS DateTime2), N'86207f40-2952-4772-be62-2da2b84744dd', CAST(N'2024-09-11T09:14:21.6066667' AS DateTime2), N'a4978591-4523-43a1-8810-589a3a86e16c')
INSERT [dbo].[lookup] ([Id], [Type], [Value], [Name], [IsActive], [Serial], [CreateAt], [CreateBy], [UpdateAt], [UpdateBy]) VALUES (13, N'ParcelType', N'Electronics', N'Electronics', 1, 3, CAST(N'2024-09-11T09:14:21.6066667' AS DateTime2), N'3a2a3bca-59ad-42c2-a67c-8763b3748a18', CAST(N'2024-09-11T09:14:21.6066667' AS DateTime2), N'ed120db0-d5fc-43b6-86b1-a997f8311199')
SET IDENTITY_INSERT [dbo].[lookup] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 9/11/2024 10:41:31 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 9/11/2024 10:41:31 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 9/11/2024 10:41:31 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 9/11/2024 10:41:31 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 9/11/2024 10:41:31 AM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 9/11/2024 10:41:31 AM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 9/11/2024 10:41:31 AM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [FirstName]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (N'') FOR [LastName]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
USE [master]
GO
ALTER DATABASE [CMSS] SET  READ_WRITE 
GO
