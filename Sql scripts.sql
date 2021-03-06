USE [master]
GO
/****** Object:  Database [FlightBookingDb]    Script Date: 16-05-2022 08:17:22 ******/
CREATE DATABASE [FlightBookingDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'FlightBookingDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FlightBookingDb.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'FlightBookingDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\FlightBookingDb_log.ldf' , SIZE = 816KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [FlightBookingDb] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [FlightBookingDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [FlightBookingDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [FlightBookingDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [FlightBookingDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [FlightBookingDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [FlightBookingDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [FlightBookingDb] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [FlightBookingDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [FlightBookingDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [FlightBookingDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [FlightBookingDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [FlightBookingDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [FlightBookingDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [FlightBookingDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [FlightBookingDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [FlightBookingDb] SET  ENABLE_BROKER 
GO
ALTER DATABASE [FlightBookingDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [FlightBookingDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [FlightBookingDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [FlightBookingDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [FlightBookingDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [FlightBookingDb] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [FlightBookingDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [FlightBookingDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [FlightBookingDb] SET  MULTI_USER 
GO
ALTER DATABASE [FlightBookingDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [FlightBookingDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [FlightBookingDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [FlightBookingDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [FlightBookingDb] SET DELAYED_DURABILITY = DISABLED 
GO
USE [FlightBookingDb]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 16-05-2022 08:17:22 ******/
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
/****** Object:  Table [dbo].[tblAdminLoginDetails]    Script Date: 16-05-2022 08:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAdminLoginDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AdminId] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[AdminName] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblAdminLoginDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblAirLine]    Script Date: 16-05-2022 08:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAirLine](
	[AirlineId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[ContactNumber] [nvarchar](max) NOT NULL,
	[ActiveStatus] [nvarchar](max) NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[Updatedby] [nvarchar](max) NULL,
	[UpdatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_tblAirLine] PRIMARY KEY CLUSTERED 
(
	[AirlineId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblBookings]    Script Date: 16-05-2022 08:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblBookings](
	[TicketID] [nvarchar](450) NOT NULL,
	[BookingID] [nvarchar](max) NOT NULL DEFAULT (N''),
	[DateOfJourney] [datetime2](7) NOT NULL,
	[FromPlace] [nvarchar](max) NOT NULL DEFAULT (N''),
	[ToPlace] [nvarchar](max) NOT NULL DEFAULT (N''),
	[BoardingTime] [nvarchar](max) NOT NULL,
	[UserName] [nvarchar](50) NOT NULL DEFAULT (N''),
	[passportNumber] [nvarchar](20) NOT NULL DEFAULT (N''),
	[Age] [int] NOT NULL DEFAULT ((0)),
	[SeatNumber] [int] NOT NULL DEFAULT ((0)),
	[Status] [int] NOT NULL,
	[Statusstr] [nvarchar](max) NOT NULL DEFAULT (N''),
	[CreatedBy] [nvarchar](max) NOT NULL DEFAULT (N''),
	[CreatedDate] [datetime2](7) NOT NULL,
	[Updatedby] [nvarchar](max) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[EmailID] [nvarchar](max) NOT NULL DEFAULT (N''),
	[FlightNumber] [nvarchar](max) NOT NULL DEFAULT (N''),
	[Seattype] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_tblBookings] PRIMARY KEY CLUSTERED 
(
	[TicketID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblFlight]    Script Date: 16-05-2022 08:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblFlight](
	[FlightID] [int] IDENTITY(1,1) NOT NULL,
	[FlightNumber] [nvarchar](20) NOT NULL,
	[AirLineId] [int] NOT NULL,
	[FlightName] [nvarchar](50) NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[Updatedby] [nvarchar](max) NULL,
	[UpdatedDate] [datetime2](7) NULL,
 CONSTRAINT [PK_tblFlight] PRIMARY KEY CLUSTERED 
(
	[FlightID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblInventoy]    Script Date: 16-05-2022 08:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblInventoy](
	[InventoryId] [int] IDENTITY(1,1) NOT NULL,
	[FlightNumber] [nvarchar](20) NOT NULL,
	[AirLineId] [int] NOT NULL,
	[FromPlace] [nvarchar](max) NOT NULL,
	[ToPlace] [nvarchar](max) NOT NULL,
	[StartDate] [datetime2](7) NOT NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[ScheduledDays] [int] NOT NULL,
	[Instrument] [nvarchar](max) NOT NULL,
	[BClassCount] [int] NOT NULL,
	[NBClassCount] [int] NOT NULL,
	[TicketCost] [decimal](18, 2) NOT NULL,
	[Rows] [int] NOT NULL,
	[Meal] [int] NOT NULL,
	[CreatedBy] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[Updatedby] [nvarchar](max) NULL,
	[UpdatedDate] [datetime2](7) NULL,
	[BclassAvailCount] [int] NOT NULL DEFAULT ((0)),
	[EndTime] [nvarchar](max) NOT NULL DEFAULT (N''),
	[NBclassAvailableCount] [int] NOT NULL DEFAULT ((0)),
	[startTime] [nvarchar](max) NOT NULL DEFAULT (N''),
 CONSTRAINT [PK_tblInventoy] PRIMARY KEY CLUSTERED 
(
	[InventoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUserRegistor]    Script Date: 16-05-2022 08:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUserRegistor](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[FullName] [nvarchar](max) NULL,
	[Mobile] [nvarchar](max) NULL,
	[Role] [int] NOT NULL,
 CONSTRAINT [PK_tblUserRegistor] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRegistor]    Script Date: 16-05-2022 08:17:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRegistor](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[mobile] [nvarchar](20) NOT NULL,
	[Address] [nvarchar](200) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[DateOfBirth] [datetime2](7) NOT NULL,
	[CreatedBy] [nvarchar](max) NULL,
	[CreatedDate] [datetime2](7) NOT NULL,
	[Updatedby] [nvarchar](max) NULL,
	[UpdatedDate] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_UserRegistor] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [FlightBookingDb] SET  READ_WRITE 
GO
