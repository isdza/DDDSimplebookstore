CREATE DATABASE [Euroitag]
GO 
GO
ALTER TABLE [dbo].[UserSubscriptions] DROP CONSTRAINT [FK_UserSubscriptions_UserSubscriptions]
GO
/****** Object:  Table [dbo].[UserSubscriptions]    Script Date: 25/05/2023 14:05:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserSubscriptions]') AND type in (N'U'))
DROP TABLE [dbo].[UserSubscriptions]
GO
/****** Object:  Table [dbo].[User]    Script Date: 25/05/2023 14:05:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[User]') AND type in (N'U'))
DROP TABLE [dbo].[User]
GO
/****** Object:  Table [dbo].[Subscription]    Script Date: 25/05/2023 14:05:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Subscription]') AND type in (N'U'))
DROP TABLE [dbo].[Subscription]
GO
/****** Object:  Table [dbo].[Catalog]    Script Date: 25/05/2023 14:05:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Catalog]') AND type in (N'U'))
DROP TABLE [dbo].[Catalog]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 25/05/2023 14:05:41 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Book]') AND type in (N'U'))
DROP TABLE [dbo].[Book]
GO
USE [master]
GO
/****** Object:  Database [Euroitag]    Script Date: 25/05/2023 14:05:41 ******/
DROP DATABASE [Euroitag]
GO
/****** Object:  Database [Euroitag]    Script Date: 25/05/2023 14:05:41 ******/
CREATE DATABASE [Euroitag]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Euroitag', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Euroitag.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Euroitag_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\[Euroitag_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Euroitag] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Euroitag].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Euroitag] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Euroitag] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Euroitag] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Euroitag] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Euroitag] SET ARITHABORT OFF 
GO
ALTER DATABASE [Euroitag] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Euroitag] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Euroitag] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Euroitag] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Euroitag] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Euroitag] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Euroitag] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Euroitag] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Euroitag] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Euroitag] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Euroitag] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Euroitag] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Euroitag] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Euroitag] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Euroitag] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Euroitag] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Euroitag] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Euroitag] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Euroitag] SET  MULTI_USER 
GO
ALTER DATABASE [Euroitag] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Euroitag] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Euroitag] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Euroitag] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Euroitag] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Euroitag] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Euroitag] SET QUERY_STORE = OFF
GO
USE [Euroitag]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 25/05/2023 14:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[Text] [nvarchar](max) NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Catalog]    Script Date: 25/05/2023 14:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Catalog](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscription]    Script Date: 25/05/2023 14:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscription](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[BookId] [bigint] NOT NULL,
 CONSTRAINT [PK_Subscription] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 25/05/2023 14:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[Surname] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserSubscriptions]    Script Date: 25/05/2023 14:05:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserSubscriptions](
	[UserId] [bigint] NOT NULL,
	[SubscriptionId] [int] NOT NULL,
 CONSTRAINT [PK_UserSubscriptions] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[SubscriptionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Book] ON 
GO
INSERT [dbo].[Book] ([Id], [Name], [Text]) VALUES (1, N'book1', N'book1 Text')
GO
INSERT [dbo].[Book] ([Id], [Name], [Text]) VALUES (2, N'Book2', N'Book2 Text')
GO
INSERT [dbo].[Book] ([Id], [Name], [Text]) VALUES (3, N'Book3', N'Book3 Text')
GO
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
ALTER TABLE [dbo].[UserSubscriptions]  WITH CHECK ADD  CONSTRAINT [FK_UserSubscriptions_UserSubscriptions] FOREIGN KEY([UserId], [SubscriptionId])
REFERENCES [dbo].[UserSubscriptions] ([UserId], [SubscriptionId])
GO
ALTER TABLE [dbo].[UserSubscriptions] CHECK CONSTRAINT [FK_UserSubscriptions_UserSubscriptions]
GO
USE [master]
GO
ALTER DATABASE [Euroitag] SET  READ_WRITE 
GO
