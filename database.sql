USE [master]
GO
/****** Object:  Database [ProjectASPApi]    Script Date: 29.6.2020. 14.27.54 ******/
CREATE DATABASE [ProjectASPApi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ProjectASPApi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ProjectASPApi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ProjectASPApi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\ProjectASPApi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ProjectASPApi] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ProjectASPApi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ProjectASPApi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ProjectASPApi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ProjectASPApi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ProjectASPApi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ProjectASPApi] SET ARITHABORT OFF 
GO
ALTER DATABASE [ProjectASPApi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ProjectASPApi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ProjectASPApi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ProjectASPApi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ProjectASPApi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ProjectASPApi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ProjectASPApi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ProjectASPApi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ProjectASPApi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ProjectASPApi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ProjectASPApi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ProjectASPApi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ProjectASPApi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ProjectASPApi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ProjectASPApi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ProjectASPApi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ProjectASPApi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ProjectASPApi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ProjectASPApi] SET  MULTI_USER 
GO
ALTER DATABASE [ProjectASPApi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ProjectASPApi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ProjectASPApi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ProjectASPApi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ProjectASPApi] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ProjectASPApi] SET QUERY_STORE = OFF
GO
USE [ProjectASPApi]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 29.6.2020. 14.27.55 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 29.6.2020. 14.27.55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Authors] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 29.6.2020. 14.27.56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[TitleId] [int] NOT NULL,
	[SerialNumber] [int] NOT NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 29.6.2020. 14.27.57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Issuances]    Script Date: 29.6.2020. 14.27.57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Issuances](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[ReturnedDate] [datetime2](7) NULL,
	[Status] [int] NOT NULL,
	[ExistRecompense] [bit] NULL,
	[BookId] [int] NOT NULL,
	[MemberId] [int] NOT NULL,
	[LibrarianReturnedId] [int] NULL,
	[LibrarianRentedId] [int] NOT NULL,
	[RentedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Issuances] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Members]    Script Date: 29.6.2020. 14.27.58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Members](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[MemberCardNumber] [int] NOT NULL,
 CONSTRAINT [PK_Members] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NumberAllowdDays]    Script Date: 29.6.2020. 14.27.58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NumberAllowdDays](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DateFrom] [datetime2](7) NOT NULL,
	[DateTo] [datetime2](7) NULL,
	[Value] [int] NOT NULL,
 CONSTRAINT [PK_NumberAllowdDays] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pricelists]    Script Date: 29.6.2020. 14.27.59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pricelists](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[DateFrom] [datetime2](7) NOT NULL,
	[DateTo] [datetime2](7) NULL,
	[Value] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Pricelists] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publishers]    Script Date: 29.6.2020. 14.27.59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publishers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Publishers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Recompenses]    Script Date: 29.6.2020. 14.27.59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Recompenses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[IssuanceId] [int] NOT NULL,
	[ExistTransgression] [bit] NOT NULL,
	[ExistDamage] [bit] NOT NULL,
	[TotalPrice] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Recompenses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 29.6.2020. 14.27.59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TitleAuthor]    Script Date: 29.6.2020. 14.27.59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TitleAuthor](
	[TitleId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL,
 CONSTRAINT [PK_TitleAuthor] PRIMARY KEY CLUSTERED 
(
	[TitleId] ASC,
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TitlePrice]    Script Date: 29.6.2020. 14.27.59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TitlePrice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[TitleId] [int] NOT NULL,
	[DateFrom] [datetime2](7) NOT NULL,
	[DateTo] [datetime2](7) NULL,
	[Price] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_TitlePrice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Titles]    Script Date: 29.6.2020. 14.27.59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Titles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[Name] [nvarchar](50) NOT NULL,
	[PublisherId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[IssueYear] [int] NOT NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLogs]    Script Date: 29.6.2020. 14.27.59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLogs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
	[ActorId] [int] NOT NULL,
 CONSTRAINT [PK_UseCaseLogs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 29.6.2020. 14.27.59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[UserName] [nvarchar](450) NOT NULL,
	[Password] [nvarchar](max) NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserUseCases]    Script Date: 29.6.2020. 14.27.59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserUseCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[UserId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
 CONSTRAINT [PK_UserUseCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200621095317_first-migration', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200621100854_modify alternative key in UserUseCase', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200625152209_add usecase in dbContext', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200625155236_remove alternatice key in userusecase', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200626142357_add price to titleprice', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200626142643_delete price from title class', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200627130542_update issuance class', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200627133249_update2 issuance class', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200627175839_usecaselog class add', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200627180240_usecaselog class add2', N'3.1.5')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200628113436_change type in allowed days', N'3.1.5')
SET IDENTITY_INSERT [dbo].[Authors] ON 

INSERT [dbo].[Authors] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [FirstName], [LastName]) VALUES (1, CAST(N'2020-06-29T12:02:25.5757730' AS DateTime2), CAST(N'2020-06-29T12:12:10.7295085' AS DateTime2), 1, 0, NULL, N'Dejan', N'Lucic')
INSERT [dbo].[Authors] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [FirstName], [LastName]) VALUES (2, CAST(N'2020-06-29T12:02:41.0562989' AS DateTime2), NULL, 1, 0, NULL, N'Milan', N'Vidojevic')
INSERT [dbo].[Authors] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [FirstName], [LastName]) VALUES (3, CAST(N'2020-06-29T12:03:16.1422668' AS DateTime2), NULL, 1, 0, NULL, N'Radovan', N'Damjanovic')
INSERT [dbo].[Authors] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [FirstName], [LastName]) VALUES (4, CAST(N'2020-06-29T12:03:30.0019183' AS DateTime2), NULL, 1, 0, NULL, N'Jovan', N'Jovanovic Zmaj')
INSERT [dbo].[Authors] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [FirstName], [LastName]) VALUES (5, CAST(N'2020-06-29T12:05:01.9476046' AS DateTime2), NULL, 1, 0, NULL, N'Milos', N'Crnjanski')
INSERT [dbo].[Authors] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [FirstName], [LastName]) VALUES (6, CAST(N'2020-06-29T12:05:33.8448189' AS DateTime2), NULL, 1, 0, NULL, N'Branko', N'Radicevic')
INSERT [dbo].[Authors] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [FirstName], [LastName]) VALUES (7, CAST(N'2020-06-29T12:06:21.7405440' AS DateTime2), NULL, 1, 0, NULL, N'Laza', N'Lazarevic')
INSERT [dbo].[Authors] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [FirstName], [LastName]) VALUES (8, CAST(N'2020-06-29T12:07:13.5077828' AS DateTime2), NULL, 1, 0, NULL, N'Simo', N'Matavulj')
INSERT [dbo].[Authors] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [FirstName], [LastName]) VALUES (9, CAST(N'2020-06-29T12:08:10.2006649' AS DateTime2), NULL, 1, 0, NULL, N'Branislav', N'Nusic')
INSERT [dbo].[Authors] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [FirstName], [LastName]) VALUES (10, CAST(N'2020-06-29T12:08:28.2063519' AS DateTime2), NULL, 1, 0, NULL, N'Jovan', N'Deretic')
INSERT [dbo].[Authors] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [FirstName], [LastName]) VALUES (11, CAST(N'2020-06-29T12:10:09.6695570' AS DateTime2), NULL, 1, 0, NULL, N'Lav', N'Tolstoj')
INSERT [dbo].[Authors] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [FirstName], [LastName]) VALUES (12, CAST(N'2020-06-29T12:10:35.9840993' AS DateTime2), NULL, 1, 0, NULL, N'Petar', N'Kocic')
SET IDENTITY_INSERT [dbo].[Authors] OFF
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (18, CAST(N'2020-06-29T12:50:40.6142740' AS DateTime2), NULL, 1, 0, NULL, 3, 1017)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (19, CAST(N'2020-06-29T12:50:43.8752233' AS DateTime2), NULL, 1, 0, NULL, 3, 1018)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (20, CAST(N'2020-06-29T12:50:50.7671844' AS DateTime2), NULL, 1, 0, NULL, 3, 1019)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (21, CAST(N'2020-06-29T12:50:58.3591507' AS DateTime2), NULL, 1, 0, NULL, 3, 1020)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (22, CAST(N'2020-06-29T12:51:08.2971431' AS DateTime2), NULL, 1, 0, NULL, 4, 1021)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (23, CAST(N'2020-06-29T12:51:20.9450186' AS DateTime2), NULL, 1, 0, NULL, 4, 1022)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (24, CAST(N'2020-06-29T12:51:24.8512633' AS DateTime2), NULL, 1, 0, NULL, 4, 1023)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (25, CAST(N'2020-06-29T12:51:28.9283381' AS DateTime2), NULL, 1, 0, NULL, 4, 1024)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (26, CAST(N'2020-06-29T12:51:32.4992597' AS DateTime2), NULL, 1, 0, NULL, 4, 1025)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (27, CAST(N'2020-06-29T12:51:44.5586742' AS DateTime2), NULL, 1, 0, NULL, 5, 1026)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (28, CAST(N'2020-06-29T12:51:48.9487024' AS DateTime2), NULL, 1, 0, NULL, 5, 1027)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (29, CAST(N'2020-06-29T12:51:52.9180379' AS DateTime2), NULL, 1, 0, NULL, 5, 1028)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (30, CAST(N'2020-06-29T12:51:56.0057953' AS DateTime2), NULL, 1, 0, NULL, 5, 1029)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (31, CAST(N'2020-06-29T12:52:02.5513105' AS DateTime2), NULL, 1, 0, NULL, 5, 1030)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (32, CAST(N'2020-06-29T12:52:10.5028891' AS DateTime2), NULL, 1, 0, NULL, 6, 1031)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (33, CAST(N'2020-06-29T12:52:13.8660615' AS DateTime2), NULL, 1, 0, NULL, 6, 1032)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (34, CAST(N'2020-06-29T12:52:17.5290796' AS DateTime2), NULL, 1, 0, NULL, 6, 1033)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (35, CAST(N'2020-06-29T12:52:21.2863291' AS DateTime2), NULL, 1, 0, NULL, 6, 1034)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (36, CAST(N'2020-06-29T12:52:28.2299745' AS DateTime2), NULL, 1, 0, NULL, 7, 1035)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (37, CAST(N'2020-06-29T12:52:31.7387048' AS DateTime2), NULL, 1, 0, NULL, 7, 1036)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (38, CAST(N'2020-06-29T12:52:35.5195195' AS DateTime2), NULL, 1, 0, NULL, 7, 1037)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (39, CAST(N'2020-06-29T12:52:40.0699909' AS DateTime2), NULL, 1, 0, NULL, 7, 1038)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (40, CAST(N'2020-06-29T13:11:25.7847490' AS DateTime2), NULL, 1, 0, NULL, 8, 1039)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (41, CAST(N'2020-06-29T13:11:32.1240976' AS DateTime2), NULL, 1, 0, NULL, 8, 1040)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (42, CAST(N'2020-06-29T13:11:35.9555023' AS DateTime2), NULL, 1, 0, NULL, 8, 1041)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (43, CAST(N'2020-06-29T13:11:40.3845562' AS DateTime2), NULL, 1, 0, NULL, 8, 1042)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (44, CAST(N'2020-06-29T13:11:43.8421451' AS DateTime2), NULL, 1, 0, NULL, 8, 1043)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (45, CAST(N'2020-06-29T13:11:50.0082266' AS DateTime2), NULL, 1, 0, NULL, 8, 1044)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (46, CAST(N'2020-06-29T13:11:52.9176102' AS DateTime2), NULL, 1, 0, NULL, 8, 1045)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (47, CAST(N'2020-06-29T13:17:50.9575480' AS DateTime2), NULL, 1, 0, NULL, 9, 1046)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (48, CAST(N'2020-06-29T13:17:56.2099467' AS DateTime2), NULL, 1, 0, NULL, 9, 1047)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (49, CAST(N'2020-06-29T13:17:58.9181726' AS DateTime2), NULL, 1, 0, NULL, 9, 1048)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (50, CAST(N'2020-06-29T13:18:01.9534543' AS DateTime2), NULL, 1, 0, NULL, 9, 1049)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (51, CAST(N'2020-06-29T13:18:05.4998257' AS DateTime2), NULL, 1, 0, NULL, 9, 1050)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (52, CAST(N'2020-06-29T13:18:08.6683019' AS DateTime2), NULL, 1, 0, NULL, 9, 1051)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (53, CAST(N'2020-06-29T13:18:11.8157906' AS DateTime2), NULL, 1, 0, NULL, 9, 1052)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (54, CAST(N'2020-06-29T13:18:15.6062434' AS DateTime2), NULL, 1, 0, NULL, 9, 1053)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (55, CAST(N'2020-06-29T13:18:19.1276883' AS DateTime2), NULL, 1, 0, NULL, 9, 1054)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (56, CAST(N'2020-06-29T13:18:22.1530061' AS DateTime2), NULL, 1, 0, NULL, 9, 1055)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (57, CAST(N'2020-06-29T13:18:44.2085573' AS DateTime2), NULL, 1, 0, NULL, 10, 1056)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (58, CAST(N'2020-06-29T13:18:47.8161337' AS DateTime2), NULL, 1, 0, NULL, 10, 1057)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (59, CAST(N'2020-06-29T13:18:52.7603405' AS DateTime2), NULL, 1, 0, NULL, 10, 1058)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (60, CAST(N'2020-06-29T13:18:55.8461599' AS DateTime2), NULL, 1, 0, NULL, 10, 1059)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (61, CAST(N'2020-06-29T13:18:59.7137792' AS DateTime2), NULL, 1, 0, NULL, 10, 1060)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (62, CAST(N'2020-06-29T13:19:02.9307641' AS DateTime2), NULL, 1, 0, NULL, 10, 1061)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (63, CAST(N'2020-06-29T13:19:05.5117365' AS DateTime2), NULL, 1, 0, NULL, 10, 1062)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (64, CAST(N'2020-06-29T13:19:08.3098968' AS DateTime2), NULL, 1, 0, NULL, 10, 1063)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (65, CAST(N'2020-06-29T13:19:11.4524998' AS DateTime2), NULL, 1, 0, NULL, 10, 1064)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (66, CAST(N'2020-06-29T13:19:15.3587021' AS DateTime2), NULL, 1, 0, NULL, 10, 1065)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (67, CAST(N'2020-06-29T13:19:18.2817647' AS DateTime2), NULL, 1, 0, NULL, 10, 1066)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (68, CAST(N'2020-06-29T13:19:20.6841208' AS DateTime2), NULL, 1, 0, NULL, 10, 1067)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (69, CAST(N'2020-06-29T13:19:37.1982699' AS DateTime2), NULL, 1, 0, NULL, 12, 1068)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (70, CAST(N'2020-06-29T13:19:39.8331088' AS DateTime2), NULL, 1, 0, NULL, 12, 1069)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (71, CAST(N'2020-06-29T13:19:42.7357172' AS DateTime2), NULL, 1, 0, NULL, 12, 1070)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (72, CAST(N'2020-06-29T13:19:45.5948405' AS DateTime2), NULL, 1, 0, NULL, 12, 1071)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (73, CAST(N'2020-06-29T13:19:50.2367665' AS DateTime2), NULL, 1, 0, NULL, 12, 1072)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (74, CAST(N'2020-06-29T13:19:52.8921643' AS DateTime2), NULL, 1, 0, NULL, 12, 1073)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (75, CAST(N'2020-06-29T13:19:55.6154614' AS DateTime2), NULL, 1, 0, NULL, 12, 1074)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (76, CAST(N'2020-06-29T13:19:58.4118923' AS DateTime2), NULL, 1, 0, NULL, 12, 1075)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (77, CAST(N'2020-06-29T13:20:01.0133159' AS DateTime2), NULL, 1, 0, NULL, 12, 1076)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (78, CAST(N'2020-06-29T13:20:03.6892937' AS DateTime2), NULL, 1, 0, NULL, 12, 1077)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (79, CAST(N'2020-06-29T13:20:06.5916814' AS DateTime2), NULL, 1, 0, NULL, 12, 1078)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (80, CAST(N'2020-06-29T13:20:08.9785328' AS DateTime2), NULL, 1, 0, NULL, 12, 1079)
INSERT [dbo].[Books] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [SerialNumber]) VALUES (81, CAST(N'2020-06-29T13:20:14.3637665' AS DateTime2), NULL, 1, 0, NULL, 12, 1080)
SET IDENTITY_INSERT [dbo].[Books] OFF
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (1, CAST(N'2020-06-29T12:12:41.0067911' AS DateTime2), NULL, 1, 0, NULL, N'Kategorija1')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (2, CAST(N'2020-06-29T12:12:45.5591466' AS DateTime2), NULL, 1, 0, NULL, N'Kategorija2')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (3, CAST(N'2020-06-29T12:12:48.5202937' AS DateTime2), NULL, 1, 0, NULL, N'Kategorija3')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (4, CAST(N'2020-06-29T12:12:53.6321241' AS DateTime2), NULL, 1, 0, NULL, N'Kategorija4')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (5, CAST(N'2020-06-29T12:13:00.1093566' AS DateTime2), NULL, 1, 0, NULL, N'Kategorija5')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (6, CAST(N'2020-06-29T12:13:04.7297053' AS DateTime2), NULL, 1, 0, NULL, N'Kategorija6')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (7, CAST(N'2020-06-29T12:13:08.0599296' AS DateTime2), NULL, 1, 0, NULL, N'Kategorija7')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (8, CAST(N'2020-06-29T12:13:12.0792491' AS DateTime2), NULL, 1, 0, NULL, N'Kategorija8')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (9, CAST(N'2020-06-29T12:13:15.0771932' AS DateTime2), NULL, 1, 0, NULL, N'Kategorija9')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (10, CAST(N'2020-06-29T12:13:18.2937305' AS DateTime2), NULL, 1, 0, NULL, N'Kategorija10')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (11, CAST(N'2020-06-29T12:13:21.1630263' AS DateTime2), NULL, 1, 0, NULL, N'Kategorija11')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (12, CAST(N'2020-06-29T12:13:24.4870254' AS DateTime2), NULL, 1, 0, NULL, N'Kategorija12')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (13, CAST(N'2020-06-29T12:13:27.6029225' AS DateTime2), NULL, 1, 0, NULL, N'Kategorija13')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (14, CAST(N'2020-06-29T12:13:30.9132979' AS DateTime2), NULL, 1, 0, NULL, N'Kategorija14')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (15, CAST(N'2020-06-29T12:13:35.1082096' AS DateTime2), CAST(N'2020-06-29T12:14:12.0478503' AS DateTime2), 0, 1, CAST(N'2020-06-29T12:14:12.0477089' AS DateTime2), N'Kategorija15')
INSERT [dbo].[Categories] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (16, CAST(N'2020-06-29T12:14:24.8269365' AS DateTime2), CAST(N'2020-06-29T12:15:11.1378561' AS DateTime2), 1, 0, NULL, N'Kategorija15')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Issuances] ON 

INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (1, CAST(N'2020-06-29T13:33:00.6746515' AS DateTime2), CAST(N'2020-06-29T13:35:18.1614668' AS DateTime2), 1, 0, NULL, CAST(N'2020-06-29T13:35:18.0025224' AS DateTime2), 2, 1, 18, 1, 2, 2, CAST(N'2020-06-29T13:33:00.6029478' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (2, CAST(N'2020-06-29T13:33:10.1958904' AS DateTime2), CAST(N'2020-06-29T13:35:28.2339301' AS DateTime2), 1, 0, NULL, CAST(N'2020-06-29T13:35:28.2306256' AS DateTime2), 2, 1, 19, 1, 2, 2, CAST(N'2020-06-29T13:33:10.1952681' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (3, CAST(N'2020-06-29T13:33:14.7907157' AS DateTime2), CAST(N'2020-06-29T13:35:39.0715057' AS DateTime2), 1, 0, NULL, CAST(N'2020-06-29T13:35:39.0675024' AS DateTime2), 2, 0, 20, 1, 2, 2, CAST(N'2020-06-29T13:33:14.7901671' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (4, CAST(N'2020-06-29T13:33:23.9783523' AS DateTime2), CAST(N'2020-06-29T13:35:44.4721873' AS DateTime2), 1, 0, NULL, CAST(N'2020-06-29T13:35:44.4706140' AS DateTime2), 2, 0, 21, 2, 2, 2, CAST(N'2020-06-29T13:33:23.9777093' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (5, CAST(N'2020-06-29T13:33:36.4537417' AS DateTime2), CAST(N'2020-06-29T13:35:52.5715032' AS DateTime2), 1, 0, NULL, CAST(N'2020-06-29T13:35:52.5634305' AS DateTime2), 2, 1, 22, 3, 2, 2, CAST(N'2020-06-29T13:33:36.4530756' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (6, CAST(N'2020-06-29T13:33:42.3928528' AS DateTime2), CAST(N'2020-06-29T13:35:59.5064081' AS DateTime2), 1, 0, NULL, CAST(N'2020-06-29T13:35:59.5046384' AS DateTime2), 2, 0, 23, 4, 2, 2, CAST(N'2020-06-29T13:33:42.3923307' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (7, CAST(N'2020-06-29T13:33:47.8878294' AS DateTime2), CAST(N'2020-06-29T13:36:41.1753546' AS DateTime2), 1, 0, NULL, CAST(N'2020-06-29T13:36:41.1712608' AS DateTime2), 2, 0, 24, 4, 2, 2, CAST(N'2020-06-29T13:33:47.8872882' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (8, CAST(N'2020-06-29T13:33:53.4902226' AS DateTime2), CAST(N'2020-06-29T13:36:51.1033664' AS DateTime2), 1, 0, NULL, CAST(N'2020-06-29T13:36:51.0919392' AS DateTime2), 2, 0, 26, 5, 2, 2, CAST(N'2020-06-29T13:33:53.4893779' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (9, CAST(N'2020-06-29T13:34:04.0128740' AS DateTime2), CAST(N'2020-06-29T13:36:54.8375062' AS DateTime2), 1, 0, NULL, CAST(N'2020-06-29T13:36:54.8342917' AS DateTime2), 2, 0, 27, 5, 2, 2, CAST(N'2020-06-29T13:34:04.0119570' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (10, CAST(N'2020-06-29T13:34:07.4626946' AS DateTime2), CAST(N'2020-06-29T13:37:02.6110454' AS DateTime2), 1, 0, NULL, CAST(N'2020-06-29T13:37:02.6028357' AS DateTime2), 2, 1, 29, 5, 2, 2, CAST(N'2020-06-29T13:34:07.4621548' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (11, CAST(N'2020-06-29T13:34:12.1018436' AS DateTime2), CAST(N'2020-06-29T13:37:10.9988438' AS DateTime2), 1, 0, NULL, CAST(N'2020-06-29T13:37:10.9874321' AS DateTime2), 2, 1, 28, 6, 2, 2, CAST(N'2020-06-29T13:34:12.1012630' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (12, CAST(N'2020-06-29T13:34:19.4839310' AS DateTime2), CAST(N'2020-06-29T13:37:18.0684016' AS DateTime2), 1, 0, NULL, CAST(N'2020-06-29T13:37:18.0600887' AS DateTime2), 2, 0, 30, 7, 2, 2, CAST(N'2020-06-29T13:34:19.4833247' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (13, CAST(N'2020-06-29T13:34:22.3493542' AS DateTime2), CAST(N'2020-06-29T13:37:23.5918768' AS DateTime2), 1, 0, NULL, CAST(N'2020-06-29T13:37:23.5903758' AS DateTime2), 2, 0, 31, 7, 2, 2, CAST(N'2020-06-29T13:34:22.3488122' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (14, CAST(N'2020-06-29T13:34:26.5551091' AS DateTime2), CAST(N'2020-06-29T13:37:43.4359023' AS DateTime2), 1, 0, NULL, CAST(N'2020-06-29T13:37:43.4279381' AS DateTime2), 2, 0, 32, 8, 2, 2, CAST(N'2020-06-29T13:34:26.5544803' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (15, CAST(N'2020-06-29T13:37:59.9952083' AS DateTime2), CAST(N'2020-06-29T13:50:12.4494162' AS DateTime2), 1, 0, NULL, CAST(N'2020-06-29T13:50:12.3030358' AS DateTime2), 2, 1, 32, 1, 2, 2, CAST(N'2020-06-29T13:37:59.9946840' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (16, CAST(N'2020-06-29T13:38:08.1036500' AS DateTime2), CAST(N'2020-06-29T13:39:07.5122533' AS DateTime2), 1, 0, NULL, CAST(N'2020-06-29T13:39:07.4988476' AS DateTime2), 2, 1, 22, 1, 2, 2, CAST(N'2020-06-29T13:38:08.1031120' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (17, CAST(N'2020-06-29T13:38:10.9220647' AS DateTime2), CAST(N'2020-06-29T13:39:13.8431994' AS DateTime2), 1, 0, NULL, CAST(N'2020-06-29T13:39:13.8412108' AS DateTime2), 2, 0, 55, 1, 2, 2, CAST(N'2020-06-29T13:38:10.9215994' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (18, CAST(N'2020-06-29T13:38:16.2984306' AS DateTime2), CAST(N'2020-06-29T13:39:17.1689340' AS DateTime2), 1, 0, NULL, CAST(N'2020-06-29T13:39:17.1673239' AS DateTime2), 2, 0, 44, 6, 2, 2, CAST(N'2020-06-29T13:38:16.2976772' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (19, CAST(N'2020-06-29T13:38:22.8697698' AS DateTime2), CAST(N'2020-06-29T13:39:23.7311000' AS DateTime2), 1, 0, NULL, CAST(N'2020-06-29T13:39:23.7158183' AS DateTime2), 2, 1, 65, 11, 2, 2, CAST(N'2020-06-29T13:38:22.8691830' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (20, CAST(N'2020-06-29T13:38:27.1808896' AS DateTime2), CAST(N'2020-06-29T13:39:40.0561456' AS DateTime2), 1, 0, NULL, CAST(N'2020-06-29T13:39:40.0522193' AS DateTime2), 2, 0, 77, 11, 2, 2, CAST(N'2020-06-29T13:38:27.1804057' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (21, CAST(N'2020-06-29T13:38:42.4574436' AS DateTime2), CAST(N'2020-06-29T13:39:43.7569901' AS DateTime2), 1, 0, NULL, CAST(N'2020-06-29T13:39:43.7555306' AS DateTime2), 2, 0, 29, 10, 2, 2, CAST(N'2020-06-29T13:38:42.4569357' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (22, CAST(N'2020-06-29T13:38:48.2288156' AS DateTime2), CAST(N'2020-06-29T13:39:49.2506123' AS DateTime2), 1, 0, NULL, CAST(N'2020-06-29T13:39:49.2435332' AS DateTime2), 2, 1, 56, 10, 2, 2, CAST(N'2020-06-29T13:38:48.2283148' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (23, CAST(N'2020-06-29T13:47:42.9336152' AS DateTime2), NULL, 1, 0, NULL, NULL, 1, NULL, 70, 5, NULL, 2, CAST(N'2020-06-29T13:47:42.8206174' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (24, CAST(N'2020-06-29T13:47:52.5634553' AS DateTime2), CAST(N'2020-06-29T13:48:29.0077515' AS DateTime2), 1, 0, NULL, CAST(N'2020-06-29T13:48:28.9532021' AS DateTime2), 2, 0, 53, 6, 2, 2, CAST(N'2020-06-29T13:47:52.5624710' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (25, CAST(N'2020-06-29T13:49:28.9822064' AS DateTime2), NULL, 1, 0, NULL, NULL, 1, NULL, 42, 9, NULL, 2, CAST(N'2020-06-29T13:49:28.9814738' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (26, CAST(N'2020-06-29T13:49:34.6854534' AS DateTime2), NULL, 1, 0, NULL, NULL, 1, NULL, 75, 9, NULL, 2, CAST(N'2020-06-29T13:49:34.6838074' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (27, CAST(N'2020-06-29T13:49:41.5296553' AS DateTime2), NULL, 1, 0, NULL, NULL, 1, NULL, 35, 7, NULL, 2, CAST(N'2020-06-29T13:49:41.5283580' AS DateTime2))
INSERT [dbo].[Issuances] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [ReturnedDate], [Status], [ExistRecompense], [BookId], [MemberId], [LibrarianReturnedId], [LibrarianRentedId], [RentedDate]) VALUES (28, CAST(N'2020-06-29T13:49:49.5539489' AS DateTime2), NULL, 1, 0, NULL, NULL, 1, NULL, 29, 2, NULL, 2, CAST(N'2020-06-29T13:49:49.5526898' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Issuances] OFF
SET IDENTITY_INSERT [dbo].[Members] ON 

INSERT [dbo].[Members] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Phone], [Email], [MemberCardNumber]) VALUES (1, CAST(N'2020-06-29T12:28:35.9449951' AS DateTime2), NULL, 1, 0, NULL, N'Pera', N'Peric', N'064-444-444-44', N'pera@gmail.com', 1000)
INSERT [dbo].[Members] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Phone], [Email], [MemberCardNumber]) VALUES (2, CAST(N'2020-06-29T12:28:55.3496108' AS DateTime2), NULL, 1, 0, NULL, N'Mika', N'Mikic', N'064-555-444-44', N'mika@gmail.com', 1001)
INSERT [dbo].[Members] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Phone], [Email], [MemberCardNumber]) VALUES (3, CAST(N'2020-06-29T12:29:15.0439312' AS DateTime2), NULL, 1, 0, NULL, N'Zarko', N'Zarkic', N'064-555-554-44', N'zarko@gmail.com', 1002)
INSERT [dbo].[Members] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Phone], [Email], [MemberCardNumber]) VALUES (4, CAST(N'2020-06-29T12:29:35.8286206' AS DateTime2), NULL, 1, 0, NULL, N'Laza', N'Lazic', N'064-555-554-56', N'laza@gmail.com', 1003)
INSERT [dbo].[Members] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Phone], [Email], [MemberCardNumber]) VALUES (5, CAST(N'2020-06-29T12:30:21.5582727' AS DateTime2), NULL, 1, 0, NULL, N'Vidoje', N'Lazic', N'064-523-554-56', N'vidoje@gmail.com', 1004)
INSERT [dbo].[Members] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Phone], [Email], [MemberCardNumber]) VALUES (6, CAST(N'2020-06-29T12:30:41.6214485' AS DateTime2), NULL, 1, 0, NULL, N'Stanoje', N'Vikic', N'064-523-854-56', N'stanoje@gmail.com', 1005)
INSERT [dbo].[Members] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Phone], [Email], [MemberCardNumber]) VALUES (7, CAST(N'2020-06-29T12:31:10.0536020' AS DateTime2), NULL, 1, 0, NULL, N'Kresimir', N'Kresaic', N'064-526-854-95', N'kresimir@gmail.com', 1006)
INSERT [dbo].[Members] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Phone], [Email], [MemberCardNumber]) VALUES (8, CAST(N'2020-06-29T12:32:18.7695834' AS DateTime2), NULL, 1, 0, NULL, N'Aleksa', N'Aleksic', N'064-526-856-95', N'aleksa@hotmail.com', 1007)
INSERT [dbo].[Members] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Phone], [Email], [MemberCardNumber]) VALUES (9, CAST(N'2020-06-29T12:32:37.8612671' AS DateTime2), NULL, 1, 0, NULL, N'Radivoje', N'Aleksic', N'064-546-856-45', N'radivoje@hotmail.com', 1008)
INSERT [dbo].[Members] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Phone], [Email], [MemberCardNumber]) VALUES (10, CAST(N'2020-06-29T12:33:00.4924891' AS DateTime2), NULL, 1, 0, NULL, N'Paja', N'Patak', N'064-768-545-54', N'pajapatak@hotmail.com', 1009)
INSERT [dbo].[Members] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [FirstName], [LastName], [Phone], [Email], [MemberCardNumber]) VALUES (11, CAST(N'2020-06-29T12:33:33.8834311' AS DateTime2), CAST(N'2020-06-29T12:34:19.7067337' AS DateTime2), 1, 0, NULL, N'Budimir', N'Budimirovic', N'065-768-545-54', N'budimir@hotmail.com', 1010)
SET IDENTITY_INSERT [dbo].[Members] OFF
SET IDENTITY_INSERT [dbo].[NumberAllowdDays] ON 

INSERT [dbo].[NumberAllowdDays] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [DateFrom], [DateTo], [Value]) VALUES (1, CAST(N'2020-06-29T12:15:39.3877480' AS DateTime2), CAST(N'2020-06-29T12:16:02.2754448' AS DateTime2), 0, 0, NULL, CAST(N'2020-06-29T12:15:39.3662355' AS DateTime2), CAST(N'2020-06-29T12:16:02.2691688' AS DateTime2), 5)
INSERT [dbo].[NumberAllowdDays] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [DateFrom], [DateTo], [Value]) VALUES (2, CAST(N'2020-06-29T12:16:02.2754364' AS DateTime2), NULL, 1, 0, NULL, CAST(N'2020-06-29T12:16:02.2691865' AS DateTime2), NULL, 6)
SET IDENTITY_INSERT [dbo].[NumberAllowdDays] OFF
SET IDENTITY_INSERT [dbo].[Pricelists] ON 

INSERT [dbo].[Pricelists] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [DateFrom], [DateTo], [Value]) VALUES (1, CAST(N'2020-06-29T12:16:30.8920299' AS DateTime2), NULL, 1, 0, NULL, CAST(N'2020-06-29T12:16:30.8633514' AS DateTime2), NULL, CAST(100.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Pricelists] OFF
SET IDENTITY_INSERT [dbo].[Publishers] ON 

INSERT [dbo].[Publishers] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (1, CAST(N'2020-06-29T12:17:04.2666217' AS DateTime2), NULL, 1, 0, NULL, N'Izdavac1')
INSERT [dbo].[Publishers] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (2, CAST(N'2020-06-29T12:17:08.9291957' AS DateTime2), NULL, 1, 0, NULL, N'Izdavac2')
INSERT [dbo].[Publishers] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (3, CAST(N'2020-06-29T12:17:13.2203302' AS DateTime2), NULL, 1, 0, NULL, N'Izdavac3')
INSERT [dbo].[Publishers] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (4, CAST(N'2020-06-29T12:17:16.5520777' AS DateTime2), NULL, 1, 0, NULL, N'Izdavac4')
INSERT [dbo].[Publishers] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (5, CAST(N'2020-06-29T12:17:20.9709767' AS DateTime2), NULL, 1, 0, NULL, N'Izdavac5')
INSERT [dbo].[Publishers] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (6, CAST(N'2020-06-29T12:17:25.4717548' AS DateTime2), NULL, 1, 0, NULL, N'Izdavac6')
INSERT [dbo].[Publishers] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (7, CAST(N'2020-06-29T12:17:30.3817632' AS DateTime2), NULL, 1, 0, NULL, N'Izdavac7')
INSERT [dbo].[Publishers] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (8, CAST(N'2020-06-29T12:17:33.9245567' AS DateTime2), NULL, 1, 0, NULL, N'Izdavac8')
INSERT [dbo].[Publishers] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (9, CAST(N'2020-06-29T12:17:37.7618638' AS DateTime2), NULL, 1, 0, NULL, N'Izdavac9')
INSERT [dbo].[Publishers] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (10, CAST(N'2020-06-29T12:17:41.2958224' AS DateTime2), NULL, 1, 0, NULL, N'Izdavac10')
INSERT [dbo].[Publishers] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (11, CAST(N'2020-06-29T12:17:44.6715434' AS DateTime2), NULL, 1, 0, NULL, N'Izdavac11')
INSERT [dbo].[Publishers] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (12, CAST(N'2020-06-29T12:17:48.0280236' AS DateTime2), NULL, 1, 0, NULL, N'Izdavac12')
SET IDENTITY_INSERT [dbo].[Publishers] OFF
SET IDENTITY_INSERT [dbo].[Recompenses] ON 

INSERT [dbo].[Recompenses] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [IssuanceId], [ExistTransgression], [ExistDamage], [TotalPrice]) VALUES (1, CAST(N'2020-06-29T13:35:18.1613599' AS DateTime2), NULL, 1, 0, NULL, 1, 0, 1, CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[Recompenses] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [IssuanceId], [ExistTransgression], [ExistDamage], [TotalPrice]) VALUES (2, CAST(N'2020-06-29T13:35:28.2339212' AS DateTime2), NULL, 1, 0, NULL, 2, 0, 1, CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[Recompenses] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [IssuanceId], [ExistTransgression], [ExistDamage], [TotalPrice]) VALUES (3, CAST(N'2020-06-29T13:35:52.5714944' AS DateTime2), NULL, 1, 0, NULL, 5, 0, 1, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Recompenses] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [IssuanceId], [ExistTransgression], [ExistDamage], [TotalPrice]) VALUES (4, CAST(N'2020-06-29T13:37:02.6110356' AS DateTime2), NULL, 1, 0, NULL, 10, 0, 1, CAST(3000.00 AS Decimal(18, 2)))
INSERT [dbo].[Recompenses] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [IssuanceId], [ExistTransgression], [ExistDamage], [TotalPrice]) VALUES (5, CAST(N'2020-06-29T13:37:10.9988345' AS DateTime2), NULL, 1, 0, NULL, 11, 0, 1, CAST(3000.00 AS Decimal(18, 2)))
INSERT [dbo].[Recompenses] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [IssuanceId], [ExistTransgression], [ExistDamage], [TotalPrice]) VALUES (6, CAST(N'2020-06-29T13:39:07.5122444' AS DateTime2), NULL, 1, 0, NULL, 16, 0, 1, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[Recompenses] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [IssuanceId], [ExistTransgression], [ExistDamage], [TotalPrice]) VALUES (7, CAST(N'2020-06-29T13:39:23.7310916' AS DateTime2), NULL, 1, 0, NULL, 19, 0, 1, CAST(1510.00 AS Decimal(18, 2)))
INSERT [dbo].[Recompenses] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [IssuanceId], [ExistTransgression], [ExistDamage], [TotalPrice]) VALUES (8, CAST(N'2020-06-29T13:39:49.2506039' AS DateTime2), NULL, 1, 0, NULL, 22, 0, 1, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[Recompenses] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [IssuanceId], [ExistTransgression], [ExistDamage], [TotalPrice]) VALUES (9, CAST(N'2020-06-29T13:50:12.4494060' AS DateTime2), NULL, 1, 0, NULL, 15, 0, 1, CAST(780.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[Recompenses] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (2, CAST(N'2020-06-29T09:48:10.0000000' AS DateTime2), NULL, 1, 0, NULL, N'Admin')
INSERT [dbo].[Roles] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name]) VALUES (3, CAST(N'2020-06-29T09:49:10.0000000' AS DateTime2), NULL, 1, 0, NULL, N'Bibliotekar')
SET IDENTITY_INSERT [dbo].[Roles] OFF
INSERT [dbo].[TitleAuthor] ([TitleId], [AuthorId]) VALUES (7, 1)
INSERT [dbo].[TitleAuthor] ([TitleId], [AuthorId]) VALUES (8, 1)
INSERT [dbo].[TitleAuthor] ([TitleId], [AuthorId]) VALUES (5, 2)
INSERT [dbo].[TitleAuthor] ([TitleId], [AuthorId]) VALUES (7, 2)
INSERT [dbo].[TitleAuthor] ([TitleId], [AuthorId]) VALUES (7, 3)
INSERT [dbo].[TitleAuthor] ([TitleId], [AuthorId]) VALUES (3, 6)
INSERT [dbo].[TitleAuthor] ([TitleId], [AuthorId]) VALUES (9, 6)
INSERT [dbo].[TitleAuthor] ([TitleId], [AuthorId]) VALUES (10, 6)
INSERT [dbo].[TitleAuthor] ([TitleId], [AuthorId]) VALUES (12, 6)
INSERT [dbo].[TitleAuthor] ([TitleId], [AuthorId]) VALUES (4, 8)
INSERT [dbo].[TitleAuthor] ([TitleId], [AuthorId]) VALUES (5, 8)
INSERT [dbo].[TitleAuthor] ([TitleId], [AuthorId]) VALUES (6, 9)
INSERT [dbo].[TitleAuthor] ([TitleId], [AuthorId]) VALUES (12, 9)
SET IDENTITY_INSERT [dbo].[TitlePrice] ON 

INSERT [dbo].[TitlePrice] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [DateFrom], [DateTo], [Price]) VALUES (3, CAST(N'2020-06-29T12:20:41.3141263' AS DateTime2), NULL, 1, 0, NULL, 3, CAST(N'2020-06-29T12:20:41.3128525' AS DateTime2), NULL, CAST(500.00 AS Decimal(18, 2)))
INSERT [dbo].[TitlePrice] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [DateFrom], [DateTo], [Price]) VALUES (4, CAST(N'2020-06-29T12:21:00.9976574' AS DateTime2), NULL, 1, 0, NULL, 4, CAST(N'2020-06-29T12:21:00.9960903' AS DateTime2), NULL, CAST(300.00 AS Decimal(18, 2)))
INSERT [dbo].[TitlePrice] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [DateFrom], [DateTo], [Price]) VALUES (5, CAST(N'2020-06-29T12:21:24.5554796' AS DateTime2), NULL, 1, 0, NULL, 5, CAST(N'2020-06-29T12:21:24.5540742' AS DateTime2), NULL, CAST(3000.00 AS Decimal(18, 2)))
INSERT [dbo].[TitlePrice] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [DateFrom], [DateTo], [Price]) VALUES (6, CAST(N'2020-06-29T12:22:21.5596953' AS DateTime2), CAST(N'2020-06-29T12:27:24.4230501' AS DateTime2), 0, 0, NULL, 6, CAST(N'2020-06-29T12:22:21.5584911' AS DateTime2), CAST(N'2020-06-29T12:27:24.4223773' AS DateTime2), CAST(785.00 AS Decimal(18, 2)))
INSERT [dbo].[TitlePrice] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [DateFrom], [DateTo], [Price]) VALUES (7, CAST(N'2020-06-29T12:22:49.4291542' AS DateTime2), NULL, 1, 0, NULL, 7, CAST(N'2020-06-29T12:22:49.4279709' AS DateTime2), NULL, CAST(1250.00 AS Decimal(18, 2)))
INSERT [dbo].[TitlePrice] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [DateFrom], [DateTo], [Price]) VALUES (8, CAST(N'2020-06-29T12:23:08.4102441' AS DateTime2), NULL, 1, 0, NULL, 8, CAST(N'2020-06-29T12:23:08.4091604' AS DateTime2), NULL, CAST(1000.00 AS Decimal(18, 2)))
INSERT [dbo].[TitlePrice] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [DateFrom], [DateTo], [Price]) VALUES (9, CAST(N'2020-06-29T12:23:39.1676586' AS DateTime2), NULL, 1, 0, NULL, 9, CAST(N'2020-06-29T12:23:39.1665630' AS DateTime2), NULL, CAST(150.00 AS Decimal(18, 2)))
INSERT [dbo].[TitlePrice] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [DateFrom], [DateTo], [Price]) VALUES (10, CAST(N'2020-06-29T12:24:04.5195465' AS DateTime2), NULL, 1, 0, NULL, 10, CAST(N'2020-06-29T12:24:04.5178965' AS DateTime2), NULL, CAST(1510.00 AS Decimal(18, 2)))
INSERT [dbo].[TitlePrice] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [DateFrom], [DateTo], [Price]) VALUES (11, CAST(N'2020-06-29T12:26:05.4407579' AS DateTime2), CAST(N'2020-06-29T12:27:24.4230524' AS DateTime2), 0, 0, NULL, 6, CAST(N'2020-06-29T12:26:05.4280511' AS DateTime2), CAST(N'2020-06-29T12:27:24.4223955' AS DateTime2), CAST(1001.00 AS Decimal(18, 2)))
INSERT [dbo].[TitlePrice] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [DateFrom], [DateTo], [Price]) VALUES (12, CAST(N'2020-06-29T12:27:24.4230426' AS DateTime2), NULL, 1, 0, NULL, 6, CAST(N'2020-06-29T12:27:24.4223973' AS DateTime2), NULL, CAST(780.00 AS Decimal(18, 2)))
INSERT [dbo].[TitlePrice] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [DateFrom], [DateTo], [Price]) VALUES (13, CAST(N'2020-06-29T12:41:58.3038118' AS DateTime2), CAST(N'2020-06-29T12:47:56.4475564' AS DateTime2), 0, 1, CAST(N'2020-06-29T12:47:56.3831145' AS DateTime2), 11, CAST(N'2020-06-29T12:41:58.3027308' AS DateTime2), NULL, CAST(580.00 AS Decimal(18, 2)))
INSERT [dbo].[TitlePrice] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [TitleId], [DateFrom], [DateTo], [Price]) VALUES (14, CAST(N'2020-06-29T12:48:45.0806492' AS DateTime2), NULL, 1, 0, NULL, 12, CAST(N'2020-06-29T12:48:45.0650865' AS DateTime2), NULL, CAST(152.00 AS Decimal(18, 2)))
SET IDENTITY_INSERT [dbo].[TitlePrice] OFF
SET IDENTITY_INSERT [dbo].[Titles] ON 

INSERT [dbo].[Titles] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name], [PublisherId], [CategoryId], [IssueYear], [Image]) VALUES (3, CAST(N'2020-06-29T12:20:41.3141183' AS DateTime2), NULL, 1, 0, NULL, N'Naslov3', 2, 4, 2006, N'a56992d6-ab88-40f9-b660-489bcb4319fd.jpg')
INSERT [dbo].[Titles] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name], [PublisherId], [CategoryId], [IssueYear], [Image]) VALUES (4, CAST(N'2020-06-29T12:21:00.9976473' AS DateTime2), NULL, 1, 0, NULL, N'Naslov4', 9, 11, 2006, N'5a2c01f4-1e64-418d-9fec-7696e9ee7530.jpg')
INSERT [dbo].[Titles] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name], [PublisherId], [CategoryId], [IssueYear], [Image]) VALUES (5, CAST(N'2020-06-29T12:21:24.5554743' AS DateTime2), NULL, 1, 0, NULL, N'Naslov5', 6, 7, 1998, N'784905a7-fe0f-4f26-b6c7-d2d57b7b1cf1.jpg')
INSERT [dbo].[Titles] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name], [PublisherId], [CategoryId], [IssueYear], [Image]) VALUES (6, CAST(N'2020-06-29T12:22:21.5596864' AS DateTime2), CAST(N'2020-06-29T12:26:35.5097306' AS DateTime2), 1, 0, NULL, N'Naslov6', 2, 3, 2015, N'17d884ae-214d-460d-b151-2c8a792029e4.jpg')
INSERT [dbo].[Titles] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name], [PublisherId], [CategoryId], [IssueYear], [Image]) VALUES (7, CAST(N'2020-06-29T12:22:49.4291458' AS DateTime2), NULL, 1, 0, NULL, N'Naslov7', 7, 6, 2019, N'fcdfff58-7654-4c15-95f4-58eed1071bc5.jpg')
INSERT [dbo].[Titles] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name], [PublisherId], [CategoryId], [IssueYear], [Image]) VALUES (8, CAST(N'2020-06-29T12:23:08.4102361' AS DateTime2), NULL, 1, 0, NULL, N'Naslov8', 6, 10, 2014, N'43d46ac6-47a2-4b22-a43e-076010794cd3.jpg')
INSERT [dbo].[Titles] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name], [PublisherId], [CategoryId], [IssueYear], [Image]) VALUES (9, CAST(N'2020-06-29T12:23:39.1676502' AS DateTime2), NULL, 1, 0, NULL, N'Naslov9', 12, 14, 2005, N'6f4ffa19-7755-4eec-917c-4233c458b129.jpg')
INSERT [dbo].[Titles] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name], [PublisherId], [CategoryId], [IssueYear], [Image]) VALUES (10, CAST(N'2020-06-29T12:24:04.5195398' AS DateTime2), NULL, 1, 0, NULL, N'Naslov10', 11, 14, 2005, N'd858e61f-7ad8-4c70-aaf9-5dc842ae8ebc.jpg')
INSERT [dbo].[Titles] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name], [PublisherId], [CategoryId], [IssueYear], [Image]) VALUES (11, CAST(N'2020-06-29T12:41:58.3038029' AS DateTime2), CAST(N'2020-06-29T12:47:56.4473269' AS DateTime2), 0, 1, CAST(N'2020-06-29T12:47:56.3835333' AS DateTime2), N'Naslov11', 6, 13, 2015, N'fc67ea93-412f-4228-a035-53a9207b956a.jpg')
INSERT [dbo].[Titles] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [Name], [PublisherId], [CategoryId], [IssueYear], [Image]) VALUES (12, CAST(N'2020-06-29T12:48:45.0804755' AS DateTime2), NULL, 1, 0, NULL, N'Naslov11', 11, 2, 2011, N'2dd5c76c-8e33-4875-8f6d-eb8237ef50c4.jpg')
SET IDENTITY_INSERT [dbo].[Titles] OFF
SET IDENTITY_INSERT [dbo].[UseCaseLogs] ON 

INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (1, CAST(N'2020-06-29T10:00:27.9293663' AS DateTime2), N'EFGetUsers', N'{"UserName":null,"RoleId":null,"PerPage":15,"Page":1,"IsActive":null}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (2, CAST(N'2020-06-29T10:03:08.7382758' AS DateTime2), N'EFUpdateUser', N'{"UserName":"ivanBibliotekar","Password":null,"RoleId":3,"UseCases":[1,2,3,4,5,6,7,8,9,10,16,17,18,19,20,21,22,23,24,25,26,27,28,29,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49],"Role":null,"Id":2,"IsActive":true}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (3, CAST(N'2020-06-29T10:03:17.9639876' AS DateTime2), N'EFCreateUser', N'2', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (4, CAST(N'2020-06-29T10:03:27.7380857' AS DateTime2), N'EFCreateUser', N'1', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (5, CAST(N'2020-06-29T10:04:11.4611510' AS DateTime2), N'EFUpdateUser', N'{"UserName":"ivanAdmin","Password":null,"RoleId":2,"UseCases":[30,31,32,33,34,50,51,11,12,13,14,15],"Role":{"Name":"Admin","Id":2,"IsActive":true},"Id":1,"IsActive":true}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (6, CAST(N'2020-06-29T10:04:16.4787683' AS DateTime2), N'EFCreateUser', N'1', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (7, CAST(N'2020-06-29T10:04:23.5804695' AS DateTime2), N'EFCreateUser', N'2', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (8, CAST(N'2020-06-29T10:04:55.0779302' AS DateTime2), N'EFGetAuthors', N'{"FirstName":null,"LastName":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (9, CAST(N'2020-06-29T10:05:05.3350573' AS DateTime2), N'EFGetOneAuthor', N'5', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (10, CAST(N'2020-06-29T10:05:14.3718206' AS DateTime2), N'EFGetMembers', N'{"FirstName":null,"LastName":null,"Phone":null,"Email":null,"MemberCardNumber":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (11, CAST(N'2020-06-29T12:00:25.4659733' AS DateTime2), N'EFGetAuthors', N'{"FirstName":null,"LastName":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (12, CAST(N'2020-06-29T12:02:25.4620772' AS DateTime2), N'EFCreateAuthor', N'{"FirstName":"Dejan","LastName":"Lucic","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (13, CAST(N'2020-06-29T12:02:41.0416496' AS DateTime2), N'EFCreateAuthor', N'{"FirstName":"Milan","LastName":"Vidojevic","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (14, CAST(N'2020-06-29T12:03:16.1211699' AS DateTime2), N'EFCreateAuthor', N'{"FirstName":"Radovan","LastName":"Damjanovic","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (15, CAST(N'2020-06-29T12:03:29.9927916' AS DateTime2), N'EFCreateAuthor', N'{"FirstName":"Jovan","LastName":"Jovanovic Zmaj","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (16, CAST(N'2020-06-29T12:05:01.9285376' AS DateTime2), N'EFCreateAuthor', N'{"FirstName":"Milos","LastName":"Crnjanski","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (17, CAST(N'2020-06-29T12:05:05.2706841' AS DateTime2), N'EFGetAuthors', N'{"FirstName":null,"LastName":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (18, CAST(N'2020-06-29T12:05:33.8165188' AS DateTime2), N'EFCreateAuthor', N'{"FirstName":"Branko","LastName":"Radicevic","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (19, CAST(N'2020-06-29T12:06:21.7273382' AS DateTime2), N'EFCreateAuthor', N'{"FirstName":"Laza","LastName":"Lazarevic","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (20, CAST(N'2020-06-29T12:07:13.4877058' AS DateTime2), N'EFCreateAuthor', N'{"FirstName":"Simo","LastName":"Matavulj","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (21, CAST(N'2020-06-29T12:08:10.1900247' AS DateTime2), N'EFCreateAuthor', N'{"FirstName":"Branislav","LastName":"Nusic","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (22, CAST(N'2020-06-29T12:08:28.1896374' AS DateTime2), N'EFCreateAuthor', N'{"FirstName":"Jovan","LastName":"Deretic","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (23, CAST(N'2020-06-29T12:10:09.6156971' AS DateTime2), N'EFCreateAuthor', N'{"FirstName":"Lav","LastName":"Tolstoj","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (24, CAST(N'2020-06-29T12:10:35.9710814' AS DateTime2), N'EFCreateAuthor', N'{"FirstName":"Petar","LastName":"Kocic","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (25, CAST(N'2020-06-29T12:10:42.5164472' AS DateTime2), N'EFGetAuthors', N'{"FirstName":null,"LastName":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (26, CAST(N'2020-06-29T12:10:52.7639220' AS DateTime2), N'EFGetAuthors', N'{"FirstName":null,"LastName":null,"PerPage":15,"Page":3,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (27, CAST(N'2020-06-29T12:11:06.2733117' AS DateTime2), N'EFGetAuthors', N'{"FirstName":null,"LastName":null,"PerPage":3,"Page":1,"IsActive":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (28, CAST(N'2020-06-29T12:11:09.4504620' AS DateTime2), N'EFGetAuthors', N'{"FirstName":null,"LastName":null,"PerPage":3,"Page":1,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (29, CAST(N'2020-06-29T12:11:18.0106691' AS DateTime2), N'EFGetAuthors', N'{"FirstName":null,"LastName":null,"PerPage":3,"Page":3,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (30, CAST(N'2020-06-29T12:11:27.3147653' AS DateTime2), N'EFGetAuthors', N'{"FirstName":null,"LastName":null,"PerPage":3,"Page":4,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (31, CAST(N'2020-06-29T12:11:52.2456056' AS DateTime2), N'EFUpdateAuthor', N'{"FirstName":"Dejansdsd","LastName":"Lucic","Id":1,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (32, CAST(N'2020-06-29T12:12:00.9806827' AS DateTime2), N'EFGetOneAuthor', N'1', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (33, CAST(N'2020-06-29T12:12:10.7017687' AS DateTime2), N'EFUpdateAuthor', N'{"FirstName":"Dejan","LastName":"Lucic","Id":1,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (34, CAST(N'2020-06-29T12:12:15.7252708' AS DateTime2), N'EFGetOneAuthor', N'1', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (35, CAST(N'2020-06-29T12:12:28.2901761' AS DateTime2), N'EFGetCategories', N'{"Name":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (36, CAST(N'2020-06-29T12:12:40.9035916' AS DateTime2), N'EFCreateCategory', N'{"Name":"Kategorija1","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (37, CAST(N'2020-06-29T12:12:45.5403238' AS DateTime2), N'EFCreateCategory', N'{"Name":"Kategorija2","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (38, CAST(N'2020-06-29T12:12:48.5138537' AS DateTime2), N'EFCreateCategory', N'{"Name":"Kategorija3","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (39, CAST(N'2020-06-29T12:12:53.6249758' AS DateTime2), N'EFCreateCategory', N'{"Name":"Kategorija4","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (40, CAST(N'2020-06-29T12:13:00.1026156' AS DateTime2), N'EFCreateCategory', N'{"Name":"Kategorija5","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (41, CAST(N'2020-06-29T12:13:04.7196369' AS DateTime2), N'EFCreateCategory', N'{"Name":"Kategorija6","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (42, CAST(N'2020-06-29T12:13:08.0550704' AS DateTime2), N'EFCreateCategory', N'{"Name":"Kategorija7","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (43, CAST(N'2020-06-29T12:13:12.0741272' AS DateTime2), N'EFCreateCategory', N'{"Name":"Kategorija8","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (44, CAST(N'2020-06-29T12:13:15.0725357' AS DateTime2), N'EFCreateCategory', N'{"Name":"Kategorija9","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (45, CAST(N'2020-06-29T12:13:18.2882947' AS DateTime2), N'EFCreateCategory', N'{"Name":"Kategorija10","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (46, CAST(N'2020-06-29T12:13:21.1579544' AS DateTime2), N'EFCreateCategory', N'{"Name":"Kategorija11","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (47, CAST(N'2020-06-29T12:13:24.4646057' AS DateTime2), N'EFCreateCategory', N'{"Name":"Kategorija12","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (48, CAST(N'2020-06-29T12:13:27.5983018' AS DateTime2), N'EFCreateCategory', N'{"Name":"Kategorija13","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (49, CAST(N'2020-06-29T12:13:30.9084308' AS DateTime2), N'EFCreateCategory', N'{"Name":"Kategorija14","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (50, CAST(N'2020-06-29T12:13:35.0989965' AS DateTime2), N'EFCreateCategory', N'{"Name":"Kategorija15","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (51, CAST(N'2020-06-29T12:13:47.3740849' AS DateTime2), N'EFGetCategories', N'{"Name":null,"PerPage":5,"Page":3,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (52, CAST(N'2020-06-29T12:14:11.9231421' AS DateTime2), N'EFDeleteCategory', N'15', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (53, CAST(N'2020-06-29T12:14:19.8914188' AS DateTime2), N'EFGetOneCategory', N'15', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (54, CAST(N'2020-06-29T12:14:24.8174859' AS DateTime2), N'EFCreateCategory', N'{"Name":"Kategorija15","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (55, CAST(N'2020-06-29T12:14:31.5204697' AS DateTime2), N'EFGetOneCategory', N'16', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (56, CAST(N'2020-06-29T12:14:38.6321413' AS DateTime2), N'EFGetCategories', N'{"Name":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (57, CAST(N'2020-06-29T12:14:59.3868958' AS DateTime2), N'EFUpdateCategory', N'{"Name":"Kategorija15","Id":16,"IsActive":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (58, CAST(N'2020-06-29T12:15:04.5029223' AS DateTime2), N'EFGetOneCategory', N'16', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (59, CAST(N'2020-06-29T12:15:11.1287131' AS DateTime2), N'EFUpdateCategory', N'{"Name":"Kategorija15","Id":16,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (60, CAST(N'2020-06-29T12:15:14.1766133' AS DateTime2), N'EFGetOneCategory', N'16', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (61, CAST(N'2020-06-29T12:15:28.2287824' AS DateTime2), N'EFGetNumberAllowedDays', N'{"DateFrom":null,"DateTo":null,"DayFrom":null,"DayTo":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (62, CAST(N'2020-06-29T12:15:39.3367286' AS DateTime2), N'EFCreateNumberAllowedDays', N'{"DateFrom":"2020-06-29T10:15:34.712Z","DateTo":"2020-06-29T10:15:34.712Z","Value":5,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (63, CAST(N'2020-06-29T12:15:43.7327687' AS DateTime2), N'EFGetNumberAllowedDays', N'{"DateFrom":null,"DateTo":null,"DayFrom":null,"DayTo":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (64, CAST(N'2020-06-29T12:16:02.2467410' AS DateTime2), N'EFCreateNumberAllowedDays', N'{"DateFrom":"2020-06-29T10:15:34.712Z","DateTo":"2020-06-29T10:15:34.712Z","Value":6,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (65, CAST(N'2020-06-29T12:16:04.8177282' AS DateTime2), N'EFGetNumberAllowedDays', N'{"DateFrom":null,"DateTo":null,"DayFrom":null,"DayTo":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (66, CAST(N'2020-06-29T12:16:30.8265376' AS DateTime2), N'EFCreatePrice', N'{"DateFrom":"2020-06-29T10:16:16.607Z","DateTo":"2020-06-29T10:16:16.607Z","Value":100.0,"Id":0,"IsActive":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (67, CAST(N'2020-06-29T12:16:36.9010565' AS DateTime2), N'EFGetPricelists', N'{"DateFrom":null,"DateTo":null,"PriceFrom":null,"PriceTo":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (68, CAST(N'2020-06-29T12:17:04.2157415' AS DateTime2), N'EFCreatePublisher', N'{"Name":"Izdavac1","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (69, CAST(N'2020-06-29T12:17:08.8819895' AS DateTime2), N'EFCreatePublisher', N'{"Name":"Izdavac2","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (70, CAST(N'2020-06-29T12:17:13.2163154' AS DateTime2), N'EFCreatePublisher', N'{"Name":"Izdavac3","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (71, CAST(N'2020-06-29T12:17:16.5443790' AS DateTime2), N'EFCreatePublisher', N'{"Name":"Izdavac4","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (72, CAST(N'2020-06-29T12:17:20.9668502' AS DateTime2), N'EFCreatePublisher', N'{"Name":"Izdavac5","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (73, CAST(N'2020-06-29T12:17:25.4676455' AS DateTime2), N'EFCreatePublisher', N'{"Name":"Izdavac6","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (74, CAST(N'2020-06-29T12:17:30.3754619' AS DateTime2), N'EFCreatePublisher', N'{"Name":"Izdavac7","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (75, CAST(N'2020-06-29T12:17:33.9201292' AS DateTime2), N'EFCreatePublisher', N'{"Name":"Izdavac8","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (76, CAST(N'2020-06-29T12:17:37.7580116' AS DateTime2), N'EFCreatePublisher', N'{"Name":"Izdavac9","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (77, CAST(N'2020-06-29T12:17:41.2920274' AS DateTime2), N'EFCreatePublisher', N'{"Name":"Izdavac10","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (78, CAST(N'2020-06-29T12:17:44.6672130' AS DateTime2), N'EFCreatePublisher', N'{"Name":"Izdavac11","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (79, CAST(N'2020-06-29T12:17:48.0234702' AS DateTime2), N'EFCreatePublisher', N'{"Name":"Izdavac12","Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (80, CAST(N'2020-06-29T12:17:54.4679247' AS DateTime2), N'EFGetPublishers', N'{"Name":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (81, CAST(N'2020-06-29T12:18:11.7092475' AS DateTime2), N'EFGetRoles', N'{"Name":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (82, CAST(N'2020-06-29T12:19:49.1049012' AS DateTime2), N'EFCreateTitle', N'{"Name":"Naslov1","PublisherId":1,"CategoryId":1,"IssueYear":2000,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\""],"Content-Type":["image/jpeg"]},"Length":52772,"Name":"Image","FileName":"198195_shutterstock-146589179_ls.jpg"},"PriceForDamage":650.0,"Authors":[1,2],"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (83, CAST(N'2020-06-29T12:20:18.6551860' AS DateTime2), N'EFCreateTitle', N'{"Name":"Naslov2","PublisherId":1,"CategoryId":1,"IssueYear":2006,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\""],"Content-Type":["image/jpeg"]},"Length":52772,"Name":"Image","FileName":"198195_shutterstock-146589179_ls.jpg"},"PriceForDamage":554.0,"Authors":[3],"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (84, CAST(N'2020-06-29T12:20:41.3045994' AS DateTime2), N'EFCreateTitle', N'{"Name":"Naslov3","PublisherId":2,"CategoryId":4,"IssueYear":2006,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\""],"Content-Type":["image/jpeg"]},"Length":52772,"Name":"Image","FileName":"198195_shutterstock-146589179_ls.jpg"},"PriceForDamage":500.0,"Authors":[6],"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (85, CAST(N'2020-06-29T12:21:00.9880601' AS DateTime2), N'EFCreateTitle', N'{"Name":"Naslov4","PublisherId":9,"CategoryId":11,"IssueYear":2006,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\""],"Content-Type":["image/jpeg"]},"Length":52772,"Name":"Image","FileName":"198195_shutterstock-146589179_ls.jpg"},"PriceForDamage":300.0,"Authors":[8],"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (86, CAST(N'2020-06-29T12:21:24.5319754' AS DateTime2), N'EFCreateTitle', N'{"Name":"Naslov5","PublisherId":6,"CategoryId":7,"IssueYear":1998,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\""],"Content-Type":["image/jpeg"]},"Length":52772,"Name":"Image","FileName":"198195_shutterstock-146589179_ls.jpg"},"PriceForDamage":3000.0,"Authors":[8,2],"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (87, CAST(N'2020-06-29T12:21:31.9080877' AS DateTime2), N'EFGetTitles', N'{"PublisherIds":[],"CategoryIds":[],"AuthorIds":[],"Name":null,"IssueYearFrom":null,"IssueYearTo":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (88, CAST(N'2020-06-29T12:22:21.5488472' AS DateTime2), N'EFCreateTitle', N'{"Name":"Naslov6","PublisherId":8,"CategoryId":5,"IssueYear":2016,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\""],"Content-Type":["image/jpeg"]},"Length":52772,"Name":"Image","FileName":"198195_shutterstock-146589179_ls.jpg"},"PriceForDamage":785.0,"Authors":[9],"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (89, CAST(N'2020-06-29T12:22:49.4019750' AS DateTime2), N'EFCreateTitle', N'{"Name":"Naslov7","PublisherId":7,"CategoryId":6,"IssueYear":2019,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\""],"Content-Type":["image/jpeg"]},"Length":52772,"Name":"Image","FileName":"198195_shutterstock-146589179_ls.jpg"},"PriceForDamage":1250.0,"Authors":[1,2,3],"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (90, CAST(N'2020-06-29T12:23:08.4005918' AS DateTime2), N'EFCreateTitle', N'{"Name":"Naslov8","PublisherId":6,"CategoryId":10,"IssueYear":2014,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\""],"Content-Type":["image/jpeg"]},"Length":52772,"Name":"Image","FileName":"198195_shutterstock-146589179_ls.jpg"},"PriceForDamage":1000.0,"Authors":[1],"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (91, CAST(N'2020-06-29T12:23:39.1435852' AS DateTime2), N'EFCreateTitle', N'{"Name":"Naslov9","PublisherId":12,"CategoryId":14,"IssueYear":2005,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\""],"Content-Type":["image/jpeg"]},"Length":52772,"Name":"Image","FileName":"198195_shutterstock-146589179_ls.jpg"},"PriceForDamage":150.0,"Authors":[6],"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (92, CAST(N'2020-06-29T12:24:04.5091412' AS DateTime2), N'EFCreateTitle', N'{"Name":"Naslov10","PublisherId":11,"CategoryId":14,"IssueYear":2005,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\""],"Content-Type":["image/jpeg"]},"Length":52772,"Name":"Image","FileName":"198195_shutterstock-146589179_ls.jpg"},"PriceForDamage":1510.0,"Authors":[6],"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (93, CAST(N'2020-06-29T12:24:11.5679870' AS DateTime2), N'EFGetTitles', N'{"PublisherIds":[],"CategoryIds":[],"AuthorIds":[],"Name":null,"IssueYearFrom":null,"IssueYearTo":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (94, CAST(N'2020-06-29T12:24:25.5548920' AS DateTime2), N'EFGetTitles', N'{"PublisherIds":[],"CategoryIds":[],"AuthorIds":[1],"Name":null,"IssueYearFrom":null,"IssueYearTo":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (95, CAST(N'2020-06-29T12:24:42.8481096' AS DateTime2), N'EFGetTitles', N'{"PublisherIds":[],"CategoryIds":[1],"AuthorIds":[1],"Name":null,"IssueYearFrom":null,"IssueYearTo":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (96, CAST(N'2020-06-29T12:24:59.4353150' AS DateTime2), N'EFGetTitles', N'{"PublisherIds":[],"CategoryIds":[],"AuthorIds":[],"Name":null,"IssueYearFrom":null,"IssueYearTo":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (97, CAST(N'2020-06-29T12:26:05.3622919' AS DateTime2), N'EFUpdateTitle', N'{"Name":"Naslov6","PublisherId":2,"CategoryId":3,"IssueYear":2015,"Image":null,"PriceForDamage":1001.0,"Authors":[9],"Id":6,"IsActive":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (98, CAST(N'2020-06-29T12:26:26.0937925' AS DateTime2), N'EFGetOneTitle', N'6', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (99, CAST(N'2020-06-29T12:26:35.4801639' AS DateTime2), N'EFUpdateTitle', N'{"Name":"Naslov6","PublisherId":2,"CategoryId":3,"IssueYear":2015,"Image":null,"PriceForDamage":1001.0,"Authors":[9],"Id":6,"IsActive":true}', 2)
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (100, CAST(N'2020-06-29T12:26:41.1005769' AS DateTime2), N'EFGetOneTitle', N'6', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (101, CAST(N'2020-06-29T12:27:24.3747714' AS DateTime2), N'EFUpdateTitle', N'{"Name":"Naslov6","PublisherId":2,"CategoryId":3,"IssueYear":2015,"Image":null,"PriceForDamage":780.0,"Authors":[9],"Id":6,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (102, CAST(N'2020-06-29T12:27:30.6837888' AS DateTime2), N'EFGetOneTitle', N'6', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (103, CAST(N'2020-06-29T12:28:29.5065640' AS DateTime2), N'EFCreateMember', N'{"FirstName":"Pera","LastName":"Peric","Phone":"064-444-444-44","Email":"pera@gmail.com","MemberCardNumber":100,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (104, CAST(N'2020-06-29T12:28:35.9062499' AS DateTime2), N'EFCreateMember', N'{"FirstName":"Pera","LastName":"Peric","Phone":"064-444-444-44","Email":"pera@gmail.com","MemberCardNumber":1000,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (105, CAST(N'2020-06-29T12:28:55.3388289' AS DateTime2), N'EFCreateMember', N'{"FirstName":"Mika","LastName":"Mikic","Phone":"064-555-444-44","Email":"mika@gmail.com","MemberCardNumber":1001,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (106, CAST(N'2020-06-29T12:29:15.0338294' AS DateTime2), N'EFCreateMember', N'{"FirstName":"Zarko","LastName":"Zarkic","Phone":"064-555-554-44","Email":"zarko@gmail.com","MemberCardNumber":1002,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (107, CAST(N'2020-06-29T12:29:35.8240597' AS DateTime2), N'EFCreateMember', N'{"FirstName":"Laza","LastName":"Lazic","Phone":"064-555-554-56","Email":"laza@gmail.com","MemberCardNumber":1003,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (108, CAST(N'2020-06-29T12:30:21.5481971' AS DateTime2), N'EFCreateMember', N'{"FirstName":"Vidoje","LastName":"Lazic","Phone":"064-523-554-56","Email":"vidoje@gmail.com","MemberCardNumber":1004,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (109, CAST(N'2020-06-29T12:30:41.6130300' AS DateTime2), N'EFCreateMember', N'{"FirstName":"Stanoje","LastName":"Vikic","Phone":"064-523-854-56","Email":"stanoje@gmail.com","MemberCardNumber":1005,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (110, CAST(N'2020-06-29T12:31:10.0493408' AS DateTime2), N'EFCreateMember', N'{"FirstName":"Kresimir","LastName":"Kresaic","Phone":"064-526-854-95","Email":"kresimir@gmail.com","MemberCardNumber":1006,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (111, CAST(N'2020-06-29T12:32:05.6971076' AS DateTime2), N'EFCreateMember', N'{"FirstName":"Aleksa","LastName":"Aleksic","Phone":"064-526-856-95","Email":"aleksa@gmail.com","MemberCardNumber":1006,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (112, CAST(N'2020-06-29T12:32:18.7601146' AS DateTime2), N'EFCreateMember', N'{"FirstName":"Aleksa","LastName":"Aleksic","Phone":"064-526-856-95","Email":"aleksa@hotmail.com","MemberCardNumber":1007,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (113, CAST(N'2020-06-29T12:32:37.8506956' AS DateTime2), N'EFCreateMember', N'{"FirstName":"Radivoje","LastName":"Aleksic","Phone":"064-546-856-45","Email":"radivoje@hotmail.com","MemberCardNumber":1008,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (114, CAST(N'2020-06-29T12:33:00.4879202' AS DateTime2), N'EFCreateMember', N'{"FirstName":"Paja","LastName":"Patak","Phone":"064-768-545-54","Email":"pajapatak@hotmail.com","MemberCardNumber":1009,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (115, CAST(N'2020-06-29T12:33:33.8731619' AS DateTime2), N'EFCreateMember', N'{"FirstName":"Budimir","LastName":"Budimirovic","Phone":"065-768-545-54","Email":"budimir@hotmail.com","MemberCardNumber":1010,"Id":0,"IsActive":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (116, CAST(N'2020-06-29T12:33:40.3126141' AS DateTime2), N'EFGetMembers', N'{"FirstName":null,"LastName":null,"Phone":null,"Email":null,"MemberCardNumber":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (117, CAST(N'2020-06-29T12:34:19.6786943' AS DateTime2), N'EFUpdateMember', N'{"FirstName":"Budimir","LastName":"Budimirovic","Phone":"065-768-545-54","Email":"budimir@hotmail.com","MemberCardNumber":1010,"Id":11,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (118, CAST(N'2020-06-29T12:34:27.9321221' AS DateTime2), N'EFGetOneMember', N'11', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (119, CAST(N'2020-06-29T12:35:16.0529647' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":0,"TitleId":0,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (120, CAST(N'2020-06-29T12:35:25.3693791' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1,"TitleId":0,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (121, CAST(N'2020-06-29T12:35:34.8034438' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1001,"TitleId":1,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (122, CAST(N'2020-06-29T12:35:42.9278280' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1001,"TitleId":1,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (123, CAST(N'2020-06-29T12:35:57.9042993' AS DateTime2), N'EFGetOneTitle', N'1', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (124, CAST(N'2020-06-29T12:36:46.6602070' AS DateTime2), N'EFGetTitles', N'{"PublisherIds":[],"CategoryIds":[],"AuthorIds":[],"Name":null,"IssueYearFrom":null,"IssueYearTo":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (125, CAST(N'2020-06-29T12:39:24.0954682' AS DateTime2), N'EFGetTitles', N'{"PublisherIds":[],"CategoryIds":[],"AuthorIds":[],"Name":null,"IssueYearFrom":null,"IssueYearTo":null,"PerPage":15,"Page":1,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (126, CAST(N'2020-06-29T12:41:58.2762066' AS DateTime2), N'EFCreateTitle', N'{"Name":"Naslov11","PublisherId":6,"CategoryId":13,"IssueYear":2015,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\""],"Content-Type":["image/jpeg"]},"Length":52772,"Name":"Image","FileName":"198195_shutterstock-146589179_ls.jpg"},"PriceForDamage":580.0,"Authors":[4,11],"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (127, CAST(N'2020-06-29T12:42:04.6738674' AS DateTime2), N'EFGetTitles', N'{"PublisherIds":[],"CategoryIds":[],"AuthorIds":[],"Name":null,"IssueYearFrom":null,"IssueYearTo":null,"PerPage":15,"Page":1,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (128, CAST(N'2020-06-29T12:47:22.2915109' AS DateTime2), N'EFGetTitles', N'{"PublisherIds":[],"CategoryIds":[],"AuthorIds":[],"Name":null,"IssueYearFrom":null,"IssueYearTo":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (129, CAST(N'2020-06-29T12:47:56.3191400' AS DateTime2), N'EFDeleteTitle', N'11', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (130, CAST(N'2020-06-29T12:48:04.5006629' AS DateTime2), N'EFGetOneTitle', N'11', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (131, CAST(N'2020-06-29T12:48:10.7009049' AS DateTime2), N'EFGetOneTitle', N'10', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (132, CAST(N'2020-06-29T12:48:44.9391955' AS DateTime2), N'EFCreateTitle', N'{"Name":"Naslov11","PublisherId":11,"CategoryId":2,"IssueYear":2011,"Image":{"ContentDisposition":"form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\"","ContentType":"image/jpeg","Headers":{"Content-Disposition":["form-data; name=\"Image\"; filename=\"198195_shutterstock-146589179_ls.jpg\""],"Content-Type":["image/jpeg"]},"Length":52772,"Name":"Image","FileName":"198195_shutterstock-146589179_ls.jpg"},"PriceForDamage":152.0,"Authors":[6,9],"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (133, CAST(N'2020-06-29T12:48:53.9215820' AS DateTime2), N'EFGetOneTitle', N'12', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (134, CAST(N'2020-06-29T12:49:19.2944122' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1000,"TitleId":1,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (135, CAST(N'2020-06-29T12:49:25.1440967' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1001,"TitleId":1,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (136, CAST(N'2020-06-29T12:49:28.8966170' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1002,"TitleId":1,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (137, CAST(N'2020-06-29T12:49:32.7273334' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1003,"TitleId":1,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (138, CAST(N'2020-06-29T12:49:37.0533473' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1004,"TitleId":1,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (139, CAST(N'2020-06-29T12:49:39.8864227' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1005,"TitleId":1,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (140, CAST(N'2020-06-29T12:49:43.7150428' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1006,"TitleId":1,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (141, CAST(N'2020-06-29T12:49:47.2737319' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1007,"TitleId":1,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (142, CAST(N'2020-06-29T12:49:50.4856200' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1008,"TitleId":1,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (143, CAST(N'2020-06-29T12:49:58.2288422' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1009,"TitleId":2,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (144, CAST(N'2020-06-29T12:50:01.8742127' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1010,"TitleId":2,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (145, CAST(N'2020-06-29T12:50:05.1587402' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1011,"TitleId":2,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (146, CAST(N'2020-06-29T12:50:08.6267148' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1012,"TitleId":2,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (147, CAST(N'2020-06-29T12:50:13.4844611' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1013,"TitleId":2,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (148, CAST(N'2020-06-29T12:50:13.8209414' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1013,"TitleId":2,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (149, CAST(N'2020-06-29T12:50:17.5948503' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1014,"TitleId":2,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (150, CAST(N'2020-06-29T12:50:18.3355732' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1014,"TitleId":2,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (151, CAST(N'2020-06-29T12:50:19.0626529' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1014,"TitleId":2,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (152, CAST(N'2020-06-29T12:50:24.7502084' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1015,"TitleId":2,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (153, CAST(N'2020-06-29T12:50:29.4535011' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1016,"TitleId":2,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (154, CAST(N'2020-06-29T12:50:40.6077888' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1017,"TitleId":3,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (155, CAST(N'2020-06-29T12:50:43.8690739' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1018,"TitleId":3,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (156, CAST(N'2020-06-29T12:50:50.7585638' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1019,"TitleId":3,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (157, CAST(N'2020-06-29T12:50:53.2942769' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1019,"TitleId":3,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (158, CAST(N'2020-06-29T12:50:58.3404709' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1020,"TitleId":3,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (159, CAST(N'2020-06-29T12:51:04.7867544' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1020,"TitleId":4,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (160, CAST(N'2020-06-29T12:51:08.2666013' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1021,"TitleId":4,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (161, CAST(N'2020-06-29T12:51:20.9400481' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1022,"TitleId":4,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (162, CAST(N'2020-06-29T12:51:24.8451553' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1023,"TitleId":4,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (163, CAST(N'2020-06-29T12:51:28.9232325' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1024,"TitleId":4,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (164, CAST(N'2020-06-29T12:51:32.4942047' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1025,"TitleId":4,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (165, CAST(N'2020-06-29T12:51:39.0494503' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1025,"TitleId":5,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (166, CAST(N'2020-06-29T12:51:44.5420288' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1026,"TitleId":5,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (167, CAST(N'2020-06-29T12:51:48.9440555' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1027,"TitleId":5,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (168, CAST(N'2020-06-29T12:51:52.9136193' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1028,"TitleId":5,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (169, CAST(N'2020-06-29T12:51:56.0008160' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1029,"TitleId":5,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (170, CAST(N'2020-06-29T12:52:02.5463139' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1030,"TitleId":5,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (171, CAST(N'2020-06-29T12:52:06.5283159' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1030,"TitleId":6,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (172, CAST(N'2020-06-29T12:52:10.4880847' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1031,"TitleId":6,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (173, CAST(N'2020-06-29T12:52:13.8605806' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1032,"TitleId":6,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (174, CAST(N'2020-06-29T12:52:17.5237692' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1033,"TitleId":6,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (175, CAST(N'2020-06-29T12:52:21.2815028' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1034,"TitleId":6,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (176, CAST(N'2020-06-29T12:52:28.2224855' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1035,"TitleId":7,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (177, CAST(N'2020-06-29T12:52:31.7336945' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1036,"TitleId":7,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (178, CAST(N'2020-06-29T12:52:35.5151655' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1037,"TitleId":7,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (179, CAST(N'2020-06-29T12:52:40.0655816' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1038,"TitleId":7,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (180, CAST(N'2020-06-29T12:52:54.8627961' AS DateTime2), N'EFDeleteTitle', N'1', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (181, CAST(N'2020-06-29T12:52:57.5029985' AS DateTime2), N'EFDeleteTitle', N'1', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (182, CAST(N'2020-06-29T12:53:10.2781443' AS DateTime2), N'EFGetOneTitle', N'1', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (183, CAST(N'2020-06-29T12:53:19.9149683' AS DateTime2), N'EFGetTitles', N'{"PublisherIds":[],"CategoryIds":[],"AuthorIds":[],"Name":null,"IssueYearFrom":null,"IssueYearTo":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (184, CAST(N'2020-06-29T12:54:18.9962374' AS DateTime2), N'EFGetBooks', N'{"SerialNumber":null,"TitleIds":[1],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (185, CAST(N'2020-06-29T12:54:24.8186594' AS DateTime2), N'EFGetBooks', N'{"SerialNumber":null,"TitleIds":[2],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (186, CAST(N'2020-06-29T13:01:21.9696839' AS DateTime2), N'EFGetBooks', N'{"SerialNumber":null,"TitleIds":[1],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (187, CAST(N'2020-06-29T13:02:28.4148719' AS DateTime2), N'EFUpdateTitle', N'{"Name":"Naslov1","PublisherId":1,"CategoryId":1,"IssueYear":2000,"Image":null,"PriceForDamage":260.0,"Authors":[1],"Id":1,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (188, CAST(N'2020-06-29T13:02:47.6218783' AS DateTime2), N'EFUpdateTitle', N'{"Name":"Naslov1","PublisherId":1,"CategoryId":1,"IssueYear":2000,"Image":null,"PriceForDamage":260.0,"Authors":[1],"Id":1,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (189, CAST(N'2020-06-29T13:02:56.1446325' AS DateTime2), N'EFGetOneTitle', N'1', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (190, CAST(N'2020-06-29T13:09:54.9403836' AS DateTime2), N'EFGetBooks', N'{"SerialNumber":null,"TitleIds":[],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (191, CAST(N'2020-06-29T13:10:37.1420141' AS DateTime2), N'EFGetBooks', N'{"SerialNumber":null,"TitleIds":[],"PerPage":10,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (192, CAST(N'2020-06-29T13:10:50.9893542' AS DateTime2), N'EFGetBooks', N'{"SerialNumber":null,"TitleIds":[],"PerPage":10,"Page":2,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (193, CAST(N'2020-06-29T13:11:03.2846703' AS DateTime2), N'EFGetBooks', N'{"SerialNumber":null,"TitleIds":[],"PerPage":10,"Page":3,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (194, CAST(N'2020-06-29T13:11:19.0379511' AS DateTime2), N'EFGetBooks', N'{"SerialNumber":null,"TitleIds":[],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (195, CAST(N'2020-06-29T13:11:25.6692065' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1039,"TitleId":8,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (196, CAST(N'2020-06-29T13:11:32.1124744' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1040,"TitleId":8,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (197, CAST(N'2020-06-29T13:11:35.9015940' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1041,"TitleId":8,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (198, CAST(N'2020-06-29T13:11:40.3650890' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1042,"TitleId":8,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (199, CAST(N'2020-06-29T13:11:43.8157082' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1043,"TitleId":8,"Id":0,"IsActive":true}', 2)
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (200, CAST(N'2020-06-29T13:11:49.9786728' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1044,"TitleId":8,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (201, CAST(N'2020-06-29T13:11:52.8940443' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1045,"TitleId":8,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (202, CAST(N'2020-06-29T13:12:07.0551213' AS DateTime2), N'EFDeleteTitle', N'2', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (203, CAST(N'2020-06-29T13:17:01.2583168' AS DateTime2), N'EFGetTitles', N'{"PublisherIds":[],"CategoryIds":[],"AuthorIds":[],"Name":null,"IssueYearFrom":null,"IssueYearTo":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (204, CAST(N'2020-06-29T13:17:09.5964164' AS DateTime2), N'EFDeleteTitle', N'3', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (205, CAST(N'2020-06-29T13:17:50.8479589' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1046,"TitleId":9,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (206, CAST(N'2020-06-29T13:17:56.1916371' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1047,"TitleId":9,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (207, CAST(N'2020-06-29T13:17:58.8961645' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1048,"TitleId":9,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (208, CAST(N'2020-06-29T13:18:01.9394224' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1049,"TitleId":9,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (209, CAST(N'2020-06-29T13:18:05.4706162' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1050,"TitleId":9,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (210, CAST(N'2020-06-29T13:18:08.6478362' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1051,"TitleId":9,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (211, CAST(N'2020-06-29T13:18:11.7999363' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1052,"TitleId":9,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (212, CAST(N'2020-06-29T13:18:15.5963044' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1053,"TitleId":9,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (213, CAST(N'2020-06-29T13:18:19.1152147' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1054,"TitleId":9,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (214, CAST(N'2020-06-29T13:18:22.1430760' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1055,"TitleId":9,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (215, CAST(N'2020-06-29T13:18:27.4766078' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1055,"TitleId":10,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (216, CAST(N'2020-06-29T13:18:44.1838422' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1056,"TitleId":10,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (217, CAST(N'2020-06-29T13:18:47.7964169' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1057,"TitleId":10,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (218, CAST(N'2020-06-29T13:18:52.7251263' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1058,"TitleId":10,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (219, CAST(N'2020-06-29T13:18:55.8364354' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1059,"TitleId":10,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (220, CAST(N'2020-06-29T13:18:59.7033456' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1060,"TitleId":10,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (221, CAST(N'2020-06-29T13:19:02.9227228' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1061,"TitleId":10,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (222, CAST(N'2020-06-29T13:19:05.4958986' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1062,"TitleId":10,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (223, CAST(N'2020-06-29T13:19:08.2848866' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1063,"TitleId":10,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (224, CAST(N'2020-06-29T13:19:11.4354418' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1064,"TitleId":10,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (225, CAST(N'2020-06-29T13:19:15.3253230' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1065,"TitleId":10,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (226, CAST(N'2020-06-29T13:19:18.1817300' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1066,"TitleId":10,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (227, CAST(N'2020-06-29T13:19:20.6788924' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1067,"TitleId":10,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (228, CAST(N'2020-06-29T13:19:26.5438281' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1067,"TitleId":11,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (229, CAST(N'2020-06-29T13:19:37.1775794' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1068,"TitleId":12,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (230, CAST(N'2020-06-29T13:19:39.8181209' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1069,"TitleId":12,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (231, CAST(N'2020-06-29T13:19:42.7054290' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1070,"TitleId":12,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (232, CAST(N'2020-06-29T13:19:45.5836020' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1071,"TitleId":12,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (233, CAST(N'2020-06-29T13:19:49.9931138' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1072,"TitleId":12,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (234, CAST(N'2020-06-29T13:19:52.8735927' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1073,"TitleId":12,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (235, CAST(N'2020-06-29T13:19:55.5729130' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1074,"TitleId":12,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (236, CAST(N'2020-06-29T13:19:58.4018642' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1075,"TitleId":12,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (237, CAST(N'2020-06-29T13:20:00.9695860' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1076,"TitleId":12,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (238, CAST(N'2020-06-29T13:20:03.6553882' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1077,"TitleId":12,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (239, CAST(N'2020-06-29T13:20:06.5752243' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1078,"TitleId":12,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (240, CAST(N'2020-06-29T13:20:08.9583906' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1079,"TitleId":12,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (241, CAST(N'2020-06-29T13:20:14.3588200' AS DateTime2), N'EFCreateBook', N'{"SerialNumber":1080,"TitleId":12,"Id":0,"IsActive":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (242, CAST(N'2020-06-29T13:20:22.1966513' AS DateTime2), N'EFGetBooks', N'{"SerialNumber":null,"TitleIds":[],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (243, CAST(N'2020-06-29T13:21:01.3519572' AS DateTime2), N'EFGetBooks', N'{"SerialNumber":null,"TitleIds":[],"PerPage":15,"Page":4,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (244, CAST(N'2020-06-29T13:21:05.1656288' AS DateTime2), N'EFGetBooks', N'{"SerialNumber":null,"TitleIds":[],"PerPage":15,"Page":5,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (245, CAST(N'2020-06-29T13:21:08.1538261' AS DateTime2), N'EFGetBooks', N'{"SerialNumber":null,"TitleIds":[],"PerPage":15,"Page":6,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (246, CAST(N'2020-06-29T13:21:11.4125913' AS DateTime2), N'EFGetBooks', N'{"SerialNumber":null,"TitleIds":[],"PerPage":15,"Page":5,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (247, CAST(N'2020-06-29T13:21:24.3593540' AS DateTime2), N'EFGetBooks', N'{"SerialNumber":null,"TitleIds":[12],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (248, CAST(N'2020-06-29T13:21:41.2674386' AS DateTime2), N'EFAdminSendEmail', N'{"Subject":"string","Content":"string","SendTo":"string"}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (249, CAST(N'2020-06-29T13:22:24.2632579' AS DateTime2), N'EFGetMembers', N'{"FirstName":null,"LastName":null,"Phone":null,"Email":null,"MemberCardNumber":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (250, CAST(N'2020-06-29T13:33:00.4450684' AS DateTime2), N'EFRentBook', N'{"BookId":18,"MemberId":1}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (251, CAST(N'2020-06-29T13:33:04.0979674' AS DateTime2), N'EFRentBook', N'{"BookId":18,"MemberId":1}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (252, CAST(N'2020-06-29T13:33:10.1853482' AS DateTime2), N'EFRentBook', N'{"BookId":19,"MemberId":1}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (253, CAST(N'2020-06-29T13:33:14.7857541' AS DateTime2), N'EFRentBook', N'{"BookId":20,"MemberId":1}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (254, CAST(N'2020-06-29T13:33:18.0711312' AS DateTime2), N'EFRentBook', N'{"BookId":20,"MemberId":2}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (255, CAST(N'2020-06-29T13:33:23.9412567' AS DateTime2), N'EFRentBook', N'{"BookId":21,"MemberId":2}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (256, CAST(N'2020-06-29T13:33:31.2433501' AS DateTime2), N'EFRentBook', N'{"BookId":21,"MemberId":2}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (257, CAST(N'2020-06-29T13:33:36.4451659' AS DateTime2), N'EFRentBook', N'{"BookId":22,"MemberId":3}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (258, CAST(N'2020-06-29T13:33:42.3875721' AS DateTime2), N'EFRentBook', N'{"BookId":23,"MemberId":4}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (259, CAST(N'2020-06-29T13:33:47.8787315' AS DateTime2), N'EFRentBook', N'{"BookId":24,"MemberId":4}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (260, CAST(N'2020-06-29T13:33:53.4599876' AS DateTime2), N'EFRentBook', N'{"BookId":26,"MemberId":5}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (261, CAST(N'2020-06-29T13:34:03.9903363' AS DateTime2), N'EFRentBook', N'{"BookId":27,"MemberId":5}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (262, CAST(N'2020-06-29T13:34:07.4569574' AS DateTime2), N'EFRentBook', N'{"BookId":29,"MemberId":5}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (263, CAST(N'2020-06-29T13:34:12.0958308' AS DateTime2), N'EFRentBook', N'{"BookId":28,"MemberId":6}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (264, CAST(N'2020-06-29T13:34:19.4768488' AS DateTime2), N'EFRentBook', N'{"BookId":30,"MemberId":7}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (265, CAST(N'2020-06-29T13:34:22.3438946' AS DateTime2), N'EFRentBook', N'{"BookId":31,"MemberId":7}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (266, CAST(N'2020-06-29T13:34:26.5294882' AS DateTime2), N'EFRentBook', N'{"BookId":32,"MemberId":8}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (267, CAST(N'2020-06-29T13:34:50.9396192' AS DateTime2), N'EFGetIssuances', N'{"RentedDateFrom":null,"RentedDateTo":null,"Status":null,"ExistRecompense":null,"TitleIds":[],"MemberIds":[],"LibrarianRentedIds":[],"LibrarianReturnedIds":[1],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (268, CAST(N'2020-06-29T13:34:56.1303728' AS DateTime2), N'EFGetIssuances', N'{"RentedDateFrom":null,"RentedDateTo":null,"Status":null,"ExistRecompense":null,"TitleIds":[],"MemberIds":[],"LibrarianRentedIds":[],"LibrarianReturnedIds":[],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (269, CAST(N'2020-06-29T13:35:17.9614256' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":1,"ExistDamage":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (270, CAST(N'2020-06-29T13:35:21.6468168' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":1,"ExistDamage":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (271, CAST(N'2020-06-29T13:35:28.2264516' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":2,"ExistDamage":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (272, CAST(N'2020-06-29T13:35:39.0532856' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":3,"ExistDamage":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (273, CAST(N'2020-06-29T13:35:44.4667383' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":4,"ExistDamage":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (274, CAST(N'2020-06-29T13:35:52.5573902' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":5,"ExistDamage":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (275, CAST(N'2020-06-29T13:35:59.4996338' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":6,"ExistDamage":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (276, CAST(N'2020-06-29T13:36:07.5170376' AS DateTime2), N'EFGetRecompenses', N'{"ExistTransgression":null,"ExistDamage":null,"MinPrice":null,"MaxPrice":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (277, CAST(N'2020-06-29T13:36:40.9554016' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":7,"ExistDamage":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (278, CAST(N'2020-06-29T13:36:45.9393280' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":7,"ExistDamage":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (279, CAST(N'2020-06-29T13:36:51.0865508' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":8,"ExistDamage":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (280, CAST(N'2020-06-29T13:36:54.8062686' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":9,"ExistDamage":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (281, CAST(N'2020-06-29T13:37:02.5980820' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":10,"ExistDamage":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (282, CAST(N'2020-06-29T13:37:04.9350516' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":10,"ExistDamage":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (283, CAST(N'2020-06-29T13:37:10.9709439' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":11,"ExistDamage":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (284, CAST(N'2020-06-29T13:37:18.0453831' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":12,"ExistDamage":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (285, CAST(N'2020-06-29T13:37:23.5853317' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":13,"ExistDamage":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (286, CAST(N'2020-06-29T13:37:28.5217939' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":16,"ExistDamage":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (287, CAST(N'2020-06-29T13:37:33.7007959' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":12,"ExistDamage":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (288, CAST(N'2020-06-29T13:37:38.7470053' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":13,"ExistDamage":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (289, CAST(N'2020-06-29T13:37:43.4120828' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":14,"ExistDamage":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (290, CAST(N'2020-06-29T13:37:50.6218890' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":15,"ExistDamage":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (291, CAST(N'2020-06-29T13:37:59.9781144' AS DateTime2), N'EFRentBook', N'{"BookId":32,"MemberId":1}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (292, CAST(N'2020-06-29T13:38:08.0882637' AS DateTime2), N'EFRentBook', N'{"BookId":22,"MemberId":1}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (293, CAST(N'2020-06-29T13:38:10.9159304' AS DateTime2), N'EFRentBook', N'{"BookId":55,"MemberId":1}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (294, CAST(N'2020-06-29T13:38:16.2704385' AS DateTime2), N'EFRentBook', N'{"BookId":44,"MemberId":6}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (295, CAST(N'2020-06-29T13:38:22.8489436' AS DateTime2), N'EFRentBook', N'{"BookId":65,"MemberId":11}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (296, CAST(N'2020-06-29T13:38:27.1754446' AS DateTime2), N'EFRentBook', N'{"BookId":77,"MemberId":11}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (297, CAST(N'2020-06-29T13:38:36.0499231' AS DateTime2), N'EFRentBook', N'{"BookId":29,"MemberId":12}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (298, CAST(N'2020-06-29T13:38:42.4445370' AS DateTime2), N'EFRentBook', N'{"BookId":29,"MemberId":10}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (299, CAST(N'2020-06-29T13:38:48.2229602' AS DateTime2), N'EFRentBook', N'{"BookId":56,"MemberId":10}', 2)
GO
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (300, CAST(N'2020-06-29T13:38:53.2844553' AS DateTime2), N'EFGetIssuances', N'{"RentedDateFrom":null,"RentedDateTo":null,"Status":null,"ExistRecompense":null,"TitleIds":[],"MemberIds":[],"LibrarianRentedIds":[],"LibrarianReturnedIds":[],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (301, CAST(N'2020-06-29T13:39:07.4834276' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":16,"ExistDamage":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (302, CAST(N'2020-06-29T13:39:13.8367705' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":17,"ExistDamage":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (303, CAST(N'2020-06-29T13:39:17.1633990' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":18,"ExistDamage":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (304, CAST(N'2020-06-29T13:39:23.6998138' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":19,"ExistDamage":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (305, CAST(N'2020-06-29T13:39:32.5907028' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":19,"ExistDamage":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (306, CAST(N'2020-06-29T13:39:40.0477400' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":20,"ExistDamage":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (307, CAST(N'2020-06-29T13:39:43.7514515' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":21,"ExistDamage":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (308, CAST(N'2020-06-29T13:39:49.2394709' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":22,"ExistDamage":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (309, CAST(N'2020-06-29T13:39:56.0050100' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":23,"ExistDamage":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (310, CAST(N'2020-06-29T13:40:10.4466798' AS DateTime2), N'EFGetIssuances', N'{"RentedDateFrom":null,"RentedDateTo":null,"Status":1,"ExistRecompense":null,"TitleIds":[],"MemberIds":[],"LibrarianRentedIds":[],"LibrarianReturnedIds":[],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (311, CAST(N'2020-06-29T13:40:24.7999013' AS DateTime2), N'EFGetIssuances', N'{"RentedDateFrom":null,"RentedDateTo":null,"Status":1,"ExistRecompense":null,"TitleIds":[],"MemberIds":[],"LibrarianRentedIds":[],"LibrarianReturnedIds":[],"PerPage":15,"Page":1,"IsActive":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (312, CAST(N'2020-06-29T13:40:37.3802369' AS DateTime2), N'EFGetIssuances', N'{"RentedDateFrom":null,"RentedDateTo":null,"Status":2,"ExistRecompense":null,"TitleIds":[],"MemberIds":[],"LibrarianRentedIds":[],"LibrarianReturnedIds":[],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (313, CAST(N'2020-06-29T13:40:46.2684942' AS DateTime2), N'EFGetIssuances', N'{"RentedDateFrom":null,"RentedDateTo":null,"Status":2,"ExistRecompense":null,"TitleIds":[3],"MemberIds":[],"LibrarianRentedIds":[],"LibrarianReturnedIds":[],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (314, CAST(N'2020-06-29T13:41:29.6574379' AS DateTime2), N'EFGetRecompenses', N'{"ExistTransgression":null,"ExistDamage":null,"MinPrice":null,"MaxPrice":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (315, CAST(N'2020-06-29T13:42:02.3670058' AS DateTime2), N'EFGetIssuances', N'{"RentedDateFrom":null,"RentedDateTo":null,"Status":null,"ExistRecompense":true,"TitleIds":[3],"MemberIds":[],"LibrarianRentedIds":[],"LibrarianReturnedIds":[],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (316, CAST(N'2020-06-29T13:42:12.2513728' AS DateTime2), N'EFGetIssuances', N'{"RentedDateFrom":null,"RentedDateTo":null,"Status":null,"ExistRecompense":true,"TitleIds":[],"MemberIds":[],"LibrarianRentedIds":[],"LibrarianReturnedIds":[],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (317, CAST(N'2020-06-29T13:42:31.3780408' AS DateTime2), N'EFGetIssuances', N'{"RentedDateFrom":null,"RentedDateTo":null,"Status":null,"ExistRecompense":false,"TitleIds":[],"MemberIds":[],"LibrarianRentedIds":[],"LibrarianReturnedIds":[],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (318, CAST(N'2020-06-29T13:42:39.3590340' AS DateTime2), N'EFGetIssuances', N'{"RentedDateFrom":null,"RentedDateTo":null,"Status":null,"ExistRecompense":false,"TitleIds":[],"MemberIds":[],"LibrarianRentedIds":[],"LibrarianReturnedIds":[],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (319, CAST(N'2020-06-29T13:42:48.9212736' AS DateTime2), N'EFGetIssuances', N'{"RentedDateFrom":null,"RentedDateTo":null,"Status":null,"ExistRecompense":null,"TitleIds":[],"MemberIds":[],"LibrarianRentedIds":[],"LibrarianReturnedIds":[],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (320, CAST(N'2020-06-29T13:43:20.7153795' AS DateTime2), N'EFGetIssuances', N'{"RentedDateFrom":null,"RentedDateTo":null,"Status":null,"ExistRecompense":false,"TitleIds":[],"MemberIds":[],"LibrarianRentedIds":[],"LibrarianReturnedIds":[],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (321, CAST(N'2020-06-29T13:47:39.8150873' AS DateTime2), N'EFRentBook', N'{"BookId":70,"MemberId":5}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (322, CAST(N'2020-06-29T13:47:52.5434953' AS DateTime2), N'EFRentBook', N'{"BookId":53,"MemberId":6}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (323, CAST(N'2020-06-29T13:47:59.3612008' AS DateTime2), N'EFGetIssuances', N'{"RentedDateFrom":null,"RentedDateTo":null,"Status":null,"ExistRecompense":false,"TitleIds":[],"MemberIds":[],"LibrarianRentedIds":[],"LibrarianReturnedIds":[],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (324, CAST(N'2020-06-29T13:48:06.6162263' AS DateTime2), N'EFGetIssuances', N'{"RentedDateFrom":null,"RentedDateTo":null,"Status":null,"ExistRecompense":true,"TitleIds":[],"MemberIds":[],"LibrarianRentedIds":[],"LibrarianReturnedIds":[],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (325, CAST(N'2020-06-29T13:48:14.4711631' AS DateTime2), N'EFGetIssuances', N'{"RentedDateFrom":null,"RentedDateTo":null,"Status":1,"ExistRecompense":null,"TitleIds":[],"MemberIds":[],"LibrarianRentedIds":[],"LibrarianReturnedIds":[],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (326, CAST(N'2020-06-29T13:48:28.8851764' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":24,"ExistDamage":false}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (327, CAST(N'2020-06-29T13:48:37.6084620' AS DateTime2), N'EFGetOneIssuance', N'24', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (328, CAST(N'2020-06-29T13:49:06.1801983' AS DateTime2), N'EFGetIssuances', N'{"RentedDateFrom":null,"RentedDateTo":null,"Status":null,"ExistRecompense":true,"TitleIds":[],"MemberIds":[],"LibrarianRentedIds":[],"LibrarianReturnedIds":[],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (329, CAST(N'2020-06-29T13:49:14.3229346' AS DateTime2), N'EFGetIssuances', N'{"RentedDateFrom":null,"RentedDateTo":null,"Status":null,"ExistRecompense":false,"TitleIds":[],"MemberIds":[],"LibrarianRentedIds":[],"LibrarianReturnedIds":[],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (330, CAST(N'2020-06-29T13:49:28.9541895' AS DateTime2), N'EFRentBook', N'{"BookId":42,"MemberId":9}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (331, CAST(N'2020-06-29T13:49:34.6653489' AS DateTime2), N'EFRentBook', N'{"BookId":75,"MemberId":9}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (332, CAST(N'2020-06-29T13:49:41.5144467' AS DateTime2), N'EFRentBook', N'{"BookId":35,"MemberId":7}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (333, CAST(N'2020-06-29T13:49:49.5150494' AS DateTime2), N'EFRentBook', N'{"BookId":29,"MemberId":2}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (334, CAST(N'2020-06-29T13:49:57.2006604' AS DateTime2), N'EFGetIssuances', N'{"RentedDateFrom":null,"RentedDateTo":null,"Status":1,"ExistRecompense":null,"TitleIds":[],"MemberIds":[],"LibrarianRentedIds":[],"LibrarianReturnedIds":[],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (335, CAST(N'2020-06-29T13:50:12.2880829' AS DateTime2), N'EFReturnBook', N'{"IssuanceId":15,"ExistDamage":true}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (336, CAST(N'2020-06-29T13:50:28.3758846' AS DateTime2), N'EFGetIssuances', N'{"RentedDateFrom":null,"RentedDateTo":null,"Status":2,"ExistRecompense":true,"TitleIds":[],"MemberIds":[],"LibrarianRentedIds":[],"LibrarianReturnedIds":[],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (337, CAST(N'2020-06-29T13:50:36.1492586' AS DateTime2), N'EFGetIssuances', N'{"RentedDateFrom":null,"RentedDateTo":null,"Status":null,"ExistRecompense":null,"TitleIds":[],"MemberIds":[],"LibrarianRentedIds":[],"LibrarianReturnedIds":[],"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (338, CAST(N'2020-06-29T13:51:01.3414872' AS DateTime2), N'EFGetRecompenses', N'{"ExistTransgression":null,"ExistDamage":null,"MinPrice":null,"MaxPrice":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (339, CAST(N'2020-06-29T13:51:34.7689581' AS DateTime2), N'EFGetTitles', N'{"PublisherIds":[],"CategoryIds":[],"AuthorIds":[],"Name":null,"IssueYearFrom":null,"IssueYearTo":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (340, CAST(N'2020-06-29T13:52:23.4440114' AS DateTime2), N'EFGetUsers', N'{"UserName":null,"RoleId":null,"PerPage":15,"Page":1,"IsActive":null}', 2)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (341, CAST(N'2020-06-29T13:53:58.7925776' AS DateTime2), N'EFGetRoles', N'{"Name":null,"PerPage":15,"Page":1,"IsActive":null}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (342, CAST(N'2020-06-29T13:54:08.7890919' AS DateTime2), N'EFGetUsers', N'{"UserName":null,"RoleId":null,"PerPage":15,"Page":1,"IsActive":null}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (343, CAST(N'2020-06-29T13:55:53.1562543' AS DateTime2), N'EFCreateUser', N'{"UserName":"drugiBibliotekar","Password":"lozinka","RoleId":3,"IsActive":true}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (344, CAST(N'2020-06-29T13:56:03.6182251' AS DateTime2), N'EFGetUsers', N'{"UserName":null,"RoleId":3,"PerPage":15,"Page":1,"IsActive":null}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (345, CAST(N'2020-06-29T13:56:28.9509161' AS DateTime2), N'EFCreateUser', N'3', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (346, CAST(N'2020-06-29T13:57:53.2524946' AS DateTime2), N'EFUpdateUser', N'{"UserName":"nekiBibliotekar","Password":"rikica","RoleId":3,"UseCases":[1,24],"Role":null,"Id":3,"IsActive":false}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (347, CAST(N'2020-06-29T13:57:57.8113410' AS DateTime2), N'EFCreateUser', N'3', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (348, CAST(N'2020-06-29T13:59:38.2767314' AS DateTime2), N'EFUpdateUser', N'{"UserName":"nekiBibliotekar","Password":"rikica","RoleId":3,"UseCases":[1,24],"Role":null,"Id":3,"IsActive":false}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (349, CAST(N'2020-06-29T14:01:04.1926706' AS DateTime2), N'EFCreateUser', N'{"UserName":"nekineki","Password":"rikica","RoleId":3,"IsActive":true}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (350, CAST(N'2020-06-29T14:01:37.8681729' AS DateTime2), N'EFCreateUser', N'4', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (351, CAST(N'2020-06-29T14:01:59.2993865' AS DateTime2), N'EFUpdateUser', N'{"UserName":"nekineki","Password":"lozinka","RoleId":3,"UseCases":[1,24,26,25,40,41,43,44,27,42,39,37,36,38,45,48,46,35,47,23,28,3,4,5,2,16,18,20,29,19,6,8,9,7,10,21,22,17,49],"Role":{"Name":"Bibliotekar","Id":3,"IsActive":true},"Id":3,"IsActive":true}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (352, CAST(N'2020-06-29T14:02:09.7231253' AS DateTime2), N'EFUpdateUser', N'{"UserName":"nekineki","Password":"lozinka","RoleId":3,"UseCases":[1,24,26,25,40,41,43,44,27,42,39,37,36,38,45,48,46,35,47,23,28,3,4,5,2,16,18,20,29,19,6,8,9,7,10,21,22,17,49],"Role":{"Name":"Bibliotekar","Id":3,"IsActive":true},"Id":4,"IsActive":true}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (353, CAST(N'2020-06-29T14:03:05.2675311' AS DateTime2), N'EFCreateUser', N'3', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (354, CAST(N'2020-06-29T14:03:56.0605057' AS DateTime2), N'EFUpdateUser', N'{"UserName":"nekiBibliotekar","Password":"rikica","RoleId":3,"UseCases":[1,24],"Role":null,"Id":4,"IsActive":true}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (355, CAST(N'2020-06-29T14:04:05.4643921' AS DateTime2), N'EFUpdateUser', N'{"UserName":"nekiBibliotekar","Password":"rikica","RoleId":3,"UseCases":[1,24],"Role":null,"Id":3,"IsActive":true}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (356, CAST(N'2020-06-29T14:04:39.9142277' AS DateTime2), N'EFGetUsers', N'{"UserName":null,"RoleId":3,"PerPage":15,"Page":1,"IsActive":null}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (357, CAST(N'2020-06-29T14:04:58.9320986' AS DateTime2), N'EFDeleteUser', N'1', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (358, CAST(N'2020-06-29T14:06:12.6140369' AS DateTime2), N'EFDeleteUser', N'3', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (359, CAST(N'2020-06-29T14:06:14.5109414' AS DateTime2), N'EFDeleteUser', N'3', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (360, CAST(N'2020-06-29T14:06:17.3285136' AS DateTime2), N'EFDeleteUser', N'4', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (361, CAST(N'2020-06-29T14:06:22.0143844' AS DateTime2), N'EFGetUsers', N'{"UserName":null,"RoleId":null,"PerPage":15,"Page":1,"IsActive":null}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (362, CAST(N'2020-06-29T14:06:52.2012943' AS DateTime2), N'EFCreateUser', N'{"UserName":"ivanAdminDrugiNalog","Password":"lozinka","RoleId":2,"IsActive":true}', 1)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (363, CAST(N'2020-06-29T14:07:30.9863374' AS DateTime2), N'EFGetAuthors', N'{"FirstName":null,"LastName":null,"PerPage":15,"Page":1,"IsActive":null}', 5)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (364, CAST(N'2020-06-29T14:07:45.3433933' AS DateTime2), N'EFGetLogs', N'{"DateFrom":null,"DateTo":null,"UseCaseName":null,"ActorId":4,"PerPage":15,"Page":1,"IsActive":null}', 5)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (365, CAST(N'2020-06-29T14:07:50.5004161' AS DateTime2), N'EFGetLogs', N'{"DateFrom":null,"DateTo":null,"UseCaseName":null,"ActorId":2,"PerPage":15,"Page":1,"IsActive":null}', 5)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (366, CAST(N'2020-06-29T14:08:02.7460192' AS DateTime2), N'EFGetLogs', N'{"DateFrom":null,"DateTo":null,"UseCaseName":null,"ActorId":5,"PerPage":15,"Page":1,"IsActive":null}', 5)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (367, CAST(N'2020-06-29T14:08:17.0169974' AS DateTime2), N'EFGetLogs', N'{"DateFrom":null,"DateTo":null,"UseCaseName":null,"ActorId":null,"PerPage":15,"Page":1,"IsActive":null}', 5)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (368, CAST(N'2020-06-29T14:08:30.8704753' AS DateTime2), N'EFGetRecompenses', N'{"ExistTransgression":null,"ExistDamage":null,"MinPrice":null,"MaxPrice":null,"PerPage":15,"Page":1,"IsActive":null}', 5)
INSERT [dbo].[UseCaseLogs] ([Id], [Date], [UseCaseName], [Data], [ActorId]) VALUES (369, CAST(N'2020-06-29T14:08:39.6256250' AS DateTime2), N'EFGetUsers', N'{"UserName":null,"RoleId":null,"PerPage":15,"Page":1,"IsActive":null}', 5)
SET IDENTITY_INSERT [dbo].[UseCaseLogs] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserName], [Password], [RoleId]) VALUES (1, CAST(N'2020-06-29T09:51:20.0000000' AS DateTime2), CAST(N'2020-06-29T14:04:58.9729366' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:04:58.9724074' AS DateTime2), N'ivanAdmin', N'8aa87050051efe26091a13dbfdf901c6', 2)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserName], [Password], [RoleId]) VALUES (2, CAST(N'2020-06-29T09:52:15.0000000' AS DateTime2), NULL, 1, 0, NULL, N'ivanBibliotekar', N'8aa87050051efe26091a13dbfdf901c6', 3)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserName], [Password], [RoleId]) VALUES (3, CAST(N'2020-06-29T13:55:53.2496280' AS DateTime2), CAST(N'2020-06-29T14:06:12.6320962' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:12.6319278' AS DateTime2), N'nekiBibliotekar', N'5916f5a09213e6d3b731919ae8d830eb', 3)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserName], [Password], [RoleId]) VALUES (4, CAST(N'2020-06-29T14:01:04.2186298' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346354' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3335758' AS DateTime2), N'nekineki', N'8aa87050051efe26091a13dbfdf901c6', 3)
INSERT [dbo].[Users] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserName], [Password], [RoleId]) VALUES (5, CAST(N'2020-06-29T14:06:52.2160295' AS DateTime2), NULL, 1, 0, NULL, N'ivanAdminDrugiNalog', N'8aa87050051efe26091a13dbfdf901c6', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[UserUseCases] ON 

INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (1, CAST(N'2020-06-29T09:53:15.0000000' AS DateTime2), CAST(N'2020-06-29T14:04:58.9729388' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:04:58.9724234' AS DateTime2), 1, 30)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (2, CAST(N'2020-06-29T09:53:15.0000000' AS DateTime2), CAST(N'2020-06-29T14:04:58.9729397' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:04:58.9724243' AS DateTime2), 1, 31)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (3, CAST(N'2020-06-29T09:54:15.0000000' AS DateTime2), CAST(N'2020-06-29T14:04:58.9729401' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:04:58.9724251' AS DateTime2), 1, 32)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (4, CAST(N'2020-06-29T09:54:15.0000000' AS DateTime2), CAST(N'2020-06-29T14:04:58.9729410' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:04:58.9724256' AS DateTime2), 1, 33)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (5, CAST(N'2020-06-29T09:54:36.0000000' AS DateTime2), CAST(N'2020-06-29T14:04:58.9729419' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:04:58.9724265' AS DateTime2), 1, 34)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (6, CAST(N'2020-06-29T10:03:08.9475628' AS DateTime2), NULL, 0, 0, NULL, 2, 1)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (7, CAST(N'2020-06-29T10:03:08.9480406' AS DateTime2), NULL, 0, 0, NULL, 2, 27)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (8, CAST(N'2020-06-29T10:03:08.9480419' AS DateTime2), NULL, 0, 0, NULL, 2, 28)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (9, CAST(N'2020-06-29T10:03:08.9480428' AS DateTime2), NULL, 0, 0, NULL, 2, 29)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (10, CAST(N'2020-06-29T10:03:08.9480442' AS DateTime2), NULL, 0, 0, NULL, 2, 35)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (11, CAST(N'2020-06-29T10:03:08.9480455' AS DateTime2), NULL, 0, 0, NULL, 2, 36)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (12, CAST(N'2020-06-29T10:03:08.9480464' AS DateTime2), NULL, 0, 0, NULL, 2, 37)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (13, CAST(N'2020-06-29T10:03:08.9480477' AS DateTime2), NULL, 0, 0, NULL, 2, 38)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (14, CAST(N'2020-06-29T10:03:08.9480397' AS DateTime2), NULL, 0, 0, NULL, 2, 26)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (15, CAST(N'2020-06-29T10:03:08.9480486' AS DateTime2), NULL, 0, 0, NULL, 2, 39)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (16, CAST(N'2020-06-29T10:03:08.9480508' AS DateTime2), NULL, 0, 0, NULL, 2, 41)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (17, CAST(N'2020-06-29T10:03:08.9480521' AS DateTime2), NULL, 0, 0, NULL, 2, 42)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (18, CAST(N'2020-06-29T10:03:08.9480530' AS DateTime2), NULL, 0, 0, NULL, 2, 43)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (19, CAST(N'2020-06-29T10:03:08.9480543' AS DateTime2), NULL, 0, 0, NULL, 2, 44)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (20, CAST(N'2020-06-29T10:03:08.9480552' AS DateTime2), NULL, 0, 0, NULL, 2, 45)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (21, CAST(N'2020-06-29T10:03:08.9480566' AS DateTime2), NULL, 0, 0, NULL, 2, 46)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (22, CAST(N'2020-06-29T10:03:08.9480574' AS DateTime2), NULL, 0, 0, NULL, 2, 47)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (23, CAST(N'2020-06-29T10:03:08.9480495' AS DateTime2), NULL, 0, 0, NULL, 2, 40)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (24, CAST(N'2020-06-29T10:03:08.9480588' AS DateTime2), NULL, 0, 0, NULL, 2, 48)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (25, CAST(N'2020-06-29T10:03:08.9480384' AS DateTime2), NULL, 0, 0, NULL, 2, 25)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (26, CAST(N'2020-06-29T10:03:08.9480362' AS DateTime2), NULL, 0, 0, NULL, 2, 23)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (27, CAST(N'2020-06-29T10:03:08.9480052' AS DateTime2), NULL, 0, 0, NULL, 2, 2)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (28, CAST(N'2020-06-29T10:03:08.9480180' AS DateTime2), NULL, 0, 0, NULL, 2, 3)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (29, CAST(N'2020-06-29T10:03:08.9480193' AS DateTime2), NULL, 0, 0, NULL, 2, 4)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (30, CAST(N'2020-06-29T10:03:08.9480207' AS DateTime2), NULL, 0, 0, NULL, 2, 5)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (31, CAST(N'2020-06-29T10:03:08.9480216' AS DateTime2), NULL, 0, 0, NULL, 2, 6)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (32, CAST(N'2020-06-29T10:03:08.9480229' AS DateTime2), NULL, 0, 0, NULL, 2, 7)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (33, CAST(N'2020-06-29T10:03:08.9480242' AS DateTime2), NULL, 0, 0, NULL, 2, 8)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (34, CAST(N'2020-06-29T10:03:08.9480371' AS DateTime2), NULL, 0, 0, NULL, 2, 24)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (35, CAST(N'2020-06-29T10:03:08.9480255' AS DateTime2), NULL, 0, 0, NULL, 2, 9)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (36, CAST(N'2020-06-29T10:03:08.9480278' AS DateTime2), NULL, 0, 0, NULL, 2, 16)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (37, CAST(N'2020-06-29T10:03:08.9480291' AS DateTime2), NULL, 0, 0, NULL, 2, 17)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (38, CAST(N'2020-06-29T10:03:08.9480304' AS DateTime2), NULL, 0, 0, NULL, 2, 18)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (39, CAST(N'2020-06-29T10:03:08.9480313' AS DateTime2), NULL, 0, 0, NULL, 2, 19)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (40, CAST(N'2020-06-29T10:03:08.9480326' AS DateTime2), NULL, 0, 0, NULL, 2, 20)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (41, CAST(N'2020-06-29T10:03:08.9480335' AS DateTime2), NULL, 0, 0, NULL, 2, 21)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (42, CAST(N'2020-06-29T10:03:08.9480348' AS DateTime2), NULL, 0, 0, NULL, 2, 22)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (43, CAST(N'2020-06-29T10:03:08.9480264' AS DateTime2), NULL, 0, 0, NULL, 2, 10)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (44, CAST(N'2020-06-29T10:03:08.9480601' AS DateTime2), NULL, 0, 0, NULL, 2, 49)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (45, CAST(N'2020-06-29T10:04:11.4926801' AS DateTime2), CAST(N'2020-06-29T14:04:58.9729423' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:04:58.9724269' AS DateTime2), 1, 50)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (46, CAST(N'2020-06-29T10:04:11.4926903' AS DateTime2), CAST(N'2020-06-29T14:04:58.9729432' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:04:58.9724278' AS DateTime2), 1, 51)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (47, CAST(N'2020-06-29T10:04:11.4926912' AS DateTime2), CAST(N'2020-06-29T14:04:58.9729441' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:04:58.9724282' AS DateTime2), 1, 11)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (48, CAST(N'2020-06-29T10:04:11.4926921' AS DateTime2), CAST(N'2020-06-29T14:04:58.9729446' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:04:58.9724291' AS DateTime2), 1, 12)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (49, CAST(N'2020-06-29T10:04:11.4926930' AS DateTime2), CAST(N'2020-06-29T14:04:58.9729454' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:04:58.9724296' AS DateTime2), 1, 13)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (50, CAST(N'2020-06-29T10:04:11.4926939' AS DateTime2), CAST(N'2020-06-29T14:04:58.9729463' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:04:58.9724300' AS DateTime2), 1, 14)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (51, CAST(N'2020-06-29T10:04:11.4926948' AS DateTime2), CAST(N'2020-06-29T14:04:58.9729468' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:04:58.9724309' AS DateTime2), 1, 15)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (52, CAST(N'2020-06-29T13:55:53.2497113' AS DateTime2), CAST(N'2020-06-29T14:06:12.6320975' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:12.6319384' AS DateTime2), 3, 1)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (53, CAST(N'2020-06-29T13:55:53.2497485' AS DateTime2), CAST(N'2020-06-29T14:06:12.6320984' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:12.6319393' AS DateTime2), 3, 24)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (54, CAST(N'2020-06-29T13:55:53.2497494' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388538' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376009' AS DateTime2), 3, 26)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (55, CAST(N'2020-06-29T13:55:53.2497498' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388546' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376097' AS DateTime2), 3, 25)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (56, CAST(N'2020-06-29T13:55:53.2497507' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388555' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376106' AS DateTime2), 3, 40)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (57, CAST(N'2020-06-29T13:55:53.2497516' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388564' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376115' AS DateTime2), 3, 41)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (58, CAST(N'2020-06-29T13:55:53.2497525' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388569' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376119' AS DateTime2), 3, 43)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (59, CAST(N'2020-06-29T13:55:53.2497534' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388577' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376128' AS DateTime2), 3, 44)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (60, CAST(N'2020-06-29T13:55:53.2497476' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388586' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376133' AS DateTime2), 3, 27)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (61, CAST(N'2020-06-29T13:55:53.2497543' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388595' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376141' AS DateTime2), 3, 42)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (62, CAST(N'2020-06-29T13:55:53.2497561' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388710' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376146' AS DateTime2), 3, 39)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (63, CAST(N'2020-06-29T13:55:53.2497565' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388719' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376155' AS DateTime2), 3, 37)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (64, CAST(N'2020-06-29T13:55:53.2497574' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388728' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376159' AS DateTime2), 3, 36)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (65, CAST(N'2020-06-29T13:55:53.2497583' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388737' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376168' AS DateTime2), 3, 38)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (66, CAST(N'2020-06-29T13:55:53.2497592' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388741' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376177' AS DateTime2), 3, 45)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (67, CAST(N'2020-06-29T13:55:53.2497600' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388750' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376181' AS DateTime2), 3, 48)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (68, CAST(N'2020-06-29T13:55:53.2497609' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388759' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376190' AS DateTime2), 3, 46)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (69, CAST(N'2020-06-29T13:55:53.2497552' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388768' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376199' AS DateTime2), 3, 35)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (70, CAST(N'2020-06-29T13:55:53.2497618' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388772' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376204' AS DateTime2), 3, 47)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (71, CAST(N'2020-06-29T13:55:53.2497467' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388781' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376212' AS DateTime2), 3, 23)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (72, CAST(N'2020-06-29T13:55:53.2497450' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388790' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376217' AS DateTime2), 3, 28)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (73, CAST(N'2020-06-29T13:55:53.2497126' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388795' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376226' AS DateTime2), 3, 3)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (74, CAST(N'2020-06-29T13:55:53.2497321' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388804' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376235' AS DateTime2), 3, 4)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (75, CAST(N'2020-06-29T13:55:53.2497335' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388812' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376239' AS DateTime2), 3, 5)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (76, CAST(N'2020-06-29T13:55:53.2497339' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388817' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376248' AS DateTime2), 3, 2)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (77, CAST(N'2020-06-29T13:55:53.2497352' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388826' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376257' AS DateTime2), 3, 16)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (78, CAST(N'2020-06-29T13:55:53.2497361' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388835' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376261' AS DateTime2), 3, 18)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (79, CAST(N'2020-06-29T13:55:53.2497366' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388843' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376270' AS DateTime2), 3, 20)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (80, CAST(N'2020-06-29T13:55:53.2497459' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388848' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376274' AS DateTime2), 3, 29)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (81, CAST(N'2020-06-29T13:55:53.2497374' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388857' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376283' AS DateTime2), 3, 19)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (82, CAST(N'2020-06-29T13:55:53.2497392' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388866' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376292' AS DateTime2), 3, 6)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (83, CAST(N'2020-06-29T13:55:53.2497401' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388870' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376297' AS DateTime2), 3, 8)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (84, CAST(N'2020-06-29T13:55:53.2497410' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388879' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376305' AS DateTime2), 3, 9)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (85, CAST(N'2020-06-29T13:55:53.2497419' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388888' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376310' AS DateTime2), 3, 7)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (86, CAST(N'2020-06-29T13:55:53.2497428' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388892' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376319' AS DateTime2), 3, 10)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (87, CAST(N'2020-06-29T13:55:53.2497432' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388901' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376328' AS DateTime2), 3, 21)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (88, CAST(N'2020-06-29T13:55:53.2497441' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388910' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376332' AS DateTime2), 3, 22)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (89, CAST(N'2020-06-29T13:55:53.2497383' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388919' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376341' AS DateTime2), 3, 17)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (90, CAST(N'2020-06-29T13:55:53.2497627' AS DateTime2), CAST(N'2020-06-29T13:57:53.3388923' AS DateTime2), 0, 1, CAST(N'2020-06-29T13:57:53.3376350' AS DateTime2), 3, 49)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (91, CAST(N'2020-06-29T14:01:04.2186404' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346371' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3335859' AS DateTime2), 4, 1)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (92, CAST(N'2020-06-29T14:01:04.2186754' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346380' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3335868' AS DateTime2), 4, 24)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (93, CAST(N'2020-06-29T14:01:04.2186759' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346389' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3335877' AS DateTime2), 4, 26)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (94, CAST(N'2020-06-29T14:01:04.2186767' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346398' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3335894' AS DateTime2), 4, 25)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (95, CAST(N'2020-06-29T14:01:04.2186776' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346402' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3335899' AS DateTime2), 4, 40)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (96, CAST(N'2020-06-29T14:01:04.2186781' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346411' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3335908' AS DateTime2), 4, 41)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (97, CAST(N'2020-06-29T14:01:04.2186790' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346420' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3335912' AS DateTime2), 4, 43)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (98, CAST(N'2020-06-29T14:01:04.2186799' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346424' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3335921' AS DateTime2), 4, 44)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (99, CAST(N'2020-06-29T14:01:04.2186745' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346433' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3335925' AS DateTime2), 4, 27)
GO
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (100, CAST(N'2020-06-29T14:01:04.2186807' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346442' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3335934' AS DateTime2), 4, 42)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (101, CAST(N'2020-06-29T14:01:04.2186821' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346447' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3335939' AS DateTime2), 4, 39)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (102, CAST(N'2020-06-29T14:01:04.2186830' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346456' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3335943' AS DateTime2), 4, 37)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (103, CAST(N'2020-06-29T14:01:04.2186834' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346464' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3335952' AS DateTime2), 4, 36)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (104, CAST(N'2020-06-29T14:01:04.2186843' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346473' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3335956' AS DateTime2), 4, 38)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (105, CAST(N'2020-06-29T14:01:04.2186852' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346478' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3335965' AS DateTime2), 4, 45)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (106, CAST(N'2020-06-29T14:01:04.2186861' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346487' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3335970' AS DateTime2), 4, 48)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (107, CAST(N'2020-06-29T14:01:04.2186865' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346495' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3335978' AS DateTime2), 4, 46)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (108, CAST(N'2020-06-29T14:01:04.2186812' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346500' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3335983' AS DateTime2), 4, 35)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (109, CAST(N'2020-06-29T14:01:04.2186874' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346509' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3335987' AS DateTime2), 4, 47)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (110, CAST(N'2020-06-29T14:01:04.2186736' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346518' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3335996' AS DateTime2), 4, 23)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (111, CAST(N'2020-06-29T14:01:04.2186719' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346522' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3336001' AS DateTime2), 4, 28)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (112, CAST(N'2020-06-29T14:01:04.2186422' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346531' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3336009' AS DateTime2), 4, 3)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (113, CAST(N'2020-06-29T14:01:04.2186444' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346602' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3336014' AS DateTime2), 4, 4)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (114, CAST(N'2020-06-29T14:01:04.2186457' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346611' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3336018' AS DateTime2), 4, 5)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (115, CAST(N'2020-06-29T14:01:04.2186475' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346619' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3336027' AS DateTime2), 4, 2)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (116, CAST(N'2020-06-29T14:01:04.2186493' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346624' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3336032' AS DateTime2), 4, 16)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (117, CAST(N'2020-06-29T14:01:04.2186510' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346633' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3336040' AS DateTime2), 4, 18)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (118, CAST(N'2020-06-29T14:01:04.2186528' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346642' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3336045' AS DateTime2), 4, 20)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (119, CAST(N'2020-06-29T14:01:04.2186728' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346646' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3336054' AS DateTime2), 4, 29)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (120, CAST(N'2020-06-29T14:01:04.2186546' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346655' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3336058' AS DateTime2), 4, 19)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (121, CAST(N'2020-06-29T14:01:04.2186577' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346664' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3336063' AS DateTime2), 4, 6)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (122, CAST(N'2020-06-29T14:01:04.2186595' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346673' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3336072' AS DateTime2), 4, 8)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (123, CAST(N'2020-06-29T14:01:04.2186612' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346677' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3336076' AS DateTime2), 4, 9)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (124, CAST(N'2020-06-29T14:01:04.2186630' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346686' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3336085' AS DateTime2), 4, 7)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (125, CAST(N'2020-06-29T14:01:04.2186648' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346695' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3336089' AS DateTime2), 4, 10)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (126, CAST(N'2020-06-29T14:01:04.2186701' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346699' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3336094' AS DateTime2), 4, 21)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (127, CAST(N'2020-06-29T14:01:04.2186710' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346708' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3336103' AS DateTime2), 4, 22)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (128, CAST(N'2020-06-29T14:01:04.2186564' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346717' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3336107' AS DateTime2), 4, 17)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (129, CAST(N'2020-06-29T14:01:04.2186883' AS DateTime2), CAST(N'2020-06-29T14:06:17.3346721' AS DateTime2), 0, 1, CAST(N'2020-06-29T14:06:17.3336116' AS DateTime2), 4, 49)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (130, CAST(N'2020-06-29T14:06:52.2160383' AS DateTime2), NULL, 0, 0, NULL, 5, 11)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (131, CAST(N'2020-06-29T14:06:52.2160392' AS DateTime2), NULL, 0, 0, NULL, 5, 13)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (132, CAST(N'2020-06-29T14:06:52.2160401' AS DateTime2), NULL, 0, 0, NULL, 5, 15)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (133, CAST(N'2020-06-29T14:06:52.2160410' AS DateTime2), NULL, 0, 0, NULL, 5, 14)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (134, CAST(N'2020-06-29T14:06:52.2160419' AS DateTime2), NULL, 0, 0, NULL, 5, 12)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (135, CAST(N'2020-06-29T14:06:52.2160423' AS DateTime2), NULL, 0, 0, NULL, 5, 30)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (136, CAST(N'2020-06-29T14:06:52.2160432' AS DateTime2), NULL, 0, 0, NULL, 5, 33)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (137, CAST(N'2020-06-29T14:06:52.2160441' AS DateTime2), NULL, 0, 0, NULL, 5, 32)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (138, CAST(N'2020-06-29T14:06:52.2160450' AS DateTime2), NULL, 0, 0, NULL, 5, 31)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (139, CAST(N'2020-06-29T14:06:52.2160459' AS DateTime2), NULL, 0, 0, NULL, 5, 34)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (140, CAST(N'2020-06-29T14:06:52.2160468' AS DateTime2), NULL, 0, 0, NULL, 5, 51)
INSERT [dbo].[UserUseCases] ([Id], [CreatedAt], [ModifiedAt], [IsActive], [IsDeleted], [DeletedAt], [UserId], [UseCaseId]) VALUES (141, CAST(N'2020-06-29T14:06:52.2160476' AS DateTime2), NULL, 0, 0, NULL, 5, 50)
SET IDENTITY_INSERT [dbo].[UserUseCases] OFF
/****** Object:  Index [IX_Books_SerialNumber]    Script Date: 29.6.2020. 14.28.00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Books_SerialNumber] ON [dbo].[Books]
(
	[SerialNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Books_TitleId]    Script Date: 29.6.2020. 14.28.00 ******/
CREATE NONCLUSTERED INDEX [IX_Books_TitleId] ON [dbo].[Books]
(
	[TitleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Issuances_BookId]    Script Date: 29.6.2020. 14.28.00 ******/
CREATE NONCLUSTERED INDEX [IX_Issuances_BookId] ON [dbo].[Issuances]
(
	[BookId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Issuances_LibrarianRentedId]    Script Date: 29.6.2020. 14.28.00 ******/
CREATE NONCLUSTERED INDEX [IX_Issuances_LibrarianRentedId] ON [dbo].[Issuances]
(
	[LibrarianRentedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Issuances_LibrarianReturnedId]    Script Date: 29.6.2020. 14.28.00 ******/
CREATE NONCLUSTERED INDEX [IX_Issuances_LibrarianReturnedId] ON [dbo].[Issuances]
(
	[LibrarianReturnedId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Issuances_MemberId]    Script Date: 29.6.2020. 14.28.00 ******/
CREATE NONCLUSTERED INDEX [IX_Issuances_MemberId] ON [dbo].[Issuances]
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Recompenses_IssuanceId]    Script Date: 29.6.2020. 14.28.00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Recompenses_IssuanceId] ON [dbo].[Recompenses]
(
	[IssuanceId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TitleAuthor_AuthorId]    Script Date: 29.6.2020. 14.28.00 ******/
CREATE NONCLUSTERED INDEX [IX_TitleAuthor_AuthorId] ON [dbo].[TitleAuthor]
(
	[AuthorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_TitlePrice_TitleId]    Script Date: 29.6.2020. 14.28.00 ******/
CREATE NONCLUSTERED INDEX [IX_TitlePrice_TitleId] ON [dbo].[TitlePrice]
(
	[TitleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Titles_CategoryId]    Script Date: 29.6.2020. 14.28.00 ******/
CREATE NONCLUSTERED INDEX [IX_Titles_CategoryId] ON [dbo].[Titles]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Titles_PublisherId]    Script Date: 29.6.2020. 14.28.00 ******/
CREATE NONCLUSTERED INDEX [IX_Titles_PublisherId] ON [dbo].[Titles]
(
	[PublisherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_RoleId]    Script Date: 29.6.2020. 14.28.00 ******/
CREATE NONCLUSTERED INDEX [IX_Users_RoleId] ON [dbo].[Users]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_UserName]    Script Date: 29.6.2020. 14.28.00 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_UserName] ON [dbo].[Users]
(
	[UserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserUseCases_UserId]    Script Date: 29.6.2020. 14.28.00 ******/
CREATE NONCLUSTERED INDEX [IX_UserUseCases_UserId] ON [dbo].[UserUseCases]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Issuances] ADD  DEFAULT ((0)) FOR [LibrarianRentedId]
GO
ALTER TABLE [dbo].[Issuances] ADD  DEFAULT ('0001-01-01T00:00:00.0000000') FOR [RentedDate]
GO
ALTER TABLE [dbo].[TitlePrice] ADD  DEFAULT ((0.0)) FOR [Price]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Titles_TitleId] FOREIGN KEY([TitleId])
REFERENCES [dbo].[Titles] ([Id])
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Titles_TitleId]
GO
ALTER TABLE [dbo].[Issuances]  WITH CHECK ADD  CONSTRAINT [FK_Issuances_Books_BookId] FOREIGN KEY([BookId])
REFERENCES [dbo].[Books] ([Id])
GO
ALTER TABLE [dbo].[Issuances] CHECK CONSTRAINT [FK_Issuances_Books_BookId]
GO
ALTER TABLE [dbo].[Issuances]  WITH CHECK ADD  CONSTRAINT [FK_Issuances_Members_MemberId] FOREIGN KEY([MemberId])
REFERENCES [dbo].[Members] ([Id])
GO
ALTER TABLE [dbo].[Issuances] CHECK CONSTRAINT [FK_Issuances_Members_MemberId]
GO
ALTER TABLE [dbo].[Issuances]  WITH CHECK ADD  CONSTRAINT [FK_Issuances_Users_LibrarianRentedId] FOREIGN KEY([LibrarianRentedId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Issuances] CHECK CONSTRAINT [FK_Issuances_Users_LibrarianRentedId]
GO
ALTER TABLE [dbo].[Issuances]  WITH CHECK ADD  CONSTRAINT [FK_Issuances_Users_LibrarianReturnedId] FOREIGN KEY([LibrarianReturnedId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Issuances] CHECK CONSTRAINT [FK_Issuances_Users_LibrarianReturnedId]
GO
ALTER TABLE [dbo].[Recompenses]  WITH CHECK ADD  CONSTRAINT [FK_Recompenses_Issuances_IssuanceId] FOREIGN KEY([IssuanceId])
REFERENCES [dbo].[Issuances] ([Id])
GO
ALTER TABLE [dbo].[Recompenses] CHECK CONSTRAINT [FK_Recompenses_Issuances_IssuanceId]
GO
ALTER TABLE [dbo].[TitleAuthor]  WITH CHECK ADD  CONSTRAINT [FK_TitleAuthor_Authors_AuthorId] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([Id])
GO
ALTER TABLE [dbo].[TitleAuthor] CHECK CONSTRAINT [FK_TitleAuthor_Authors_AuthorId]
GO
ALTER TABLE [dbo].[TitleAuthor]  WITH CHECK ADD  CONSTRAINT [FK_TitleAuthor_Titles_TitleId] FOREIGN KEY([TitleId])
REFERENCES [dbo].[Titles] ([Id])
GO
ALTER TABLE [dbo].[TitleAuthor] CHECK CONSTRAINT [FK_TitleAuthor_Titles_TitleId]
GO
ALTER TABLE [dbo].[TitlePrice]  WITH CHECK ADD  CONSTRAINT [FK_TitlePrice_Titles_TitleId] FOREIGN KEY([TitleId])
REFERENCES [dbo].[Titles] ([Id])
GO
ALTER TABLE [dbo].[TitlePrice] CHECK CONSTRAINT [FK_TitlePrice_Titles_TitleId]
GO
ALTER TABLE [dbo].[Titles]  WITH CHECK ADD  CONSTRAINT [FK_Titles_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Titles] CHECK CONSTRAINT [FK_Titles_Categories_CategoryId]
GO
ALTER TABLE [dbo].[Titles]  WITH CHECK ADD  CONSTRAINT [FK_Titles_Publishers_PublisherId] FOREIGN KEY([PublisherId])
REFERENCES [dbo].[Publishers] ([Id])
GO
ALTER TABLE [dbo].[Titles] CHECK CONSTRAINT [FK_Titles_Publishers_PublisherId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles_RoleId]
GO
ALTER TABLE [dbo].[UserUseCases]  WITH CHECK ADD  CONSTRAINT [FK_UserUseCases_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[UserUseCases] CHECK CONSTRAINT [FK_UserUseCases_Users_UserId]
GO
USE [master]
GO
ALTER DATABASE [ProjectASPApi] SET  READ_WRITE 
GO
