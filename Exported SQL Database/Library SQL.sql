USE [master]
GO
/****** Object:  Database [ELibraryData]    Script Date: 08/09/2023 12:46:13 ******/
CREATE DATABASE [ELibraryData]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ELibraryData', FILENAME = N'D:\Programs\Microsoft SQL Server\MSSQL16.ELIBRARY\MSSQL\DATA\ELibraryData.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ELibraryData_log', FILENAME = N'D:\Programs\Microsoft SQL Server\MSSQL16.ELIBRARY\MSSQL\DATA\ELibraryData_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ELibraryData] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ELibraryData].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ELibraryData] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ELibraryData] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ELibraryData] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ELibraryData] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ELibraryData] SET ARITHABORT OFF 
GO
ALTER DATABASE [ELibraryData] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ELibraryData] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ELibraryData] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ELibraryData] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ELibraryData] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ELibraryData] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ELibraryData] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ELibraryData] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ELibraryData] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ELibraryData] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ELibraryData] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ELibraryData] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ELibraryData] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ELibraryData] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ELibraryData] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ELibraryData] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ELibraryData] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ELibraryData] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ELibraryData] SET  MULTI_USER 
GO
ALTER DATABASE [ELibraryData] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ELibraryData] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ELibraryData] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ELibraryData] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ELibraryData] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ELibraryData] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [ELibraryData] SET QUERY_STORE = ON
GO
ALTER DATABASE [ELibraryData] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ELibraryData]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 08/09/2023 12:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 08/09/2023 12:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Author_ID] [int] NOT NULL,
	[Genre_ID] [int] NOT NULL,
	[Publisher_ID] [int] NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Language] [varchar](5) NOT NULL,
	[RentalPrice] [decimal](10, 2) NOT NULL,
	[RemainingStock] [int] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 08/09/2023 12:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Username] [varchar](20) NOT NULL,
	[Password] [varchar](30) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[PhoneNumber] [varchar](15) NULL,
	[Address] [varchar](50) NULL,
	[City] [varchar](15) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 08/09/2023 12:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Librarian]    Script Date: 08/09/2023 12:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Librarian](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varchar](20) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Publisher]    Script Date: 08/09/2023 12:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Publisher](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[ContactInfo] [varchar](100) NOT NULL,
 CONSTRAINT [PK_Publisher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rental]    Script Date: 08/09/2023 12:46:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rental](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Client_ID] [int] NOT NULL,
	[Book_ID] [int] NOT NULL,
	[Librarian_ID] [int] NULL,
	[RentalDate] [datetime] NOT NULL,
	[ReturnDate] [datetime] NULL,
	[Status] [varchar](10) NOT NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [ELibraryData] SET  READ_WRITE 
GO
