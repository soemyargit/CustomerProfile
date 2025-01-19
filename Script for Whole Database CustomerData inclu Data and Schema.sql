USE [master]
GO
/****** Object:  Database [Customerdata]    Script Date: 1/19/2025 4:37:17 AM ******/
CREATE DATABASE [Customerdata]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Customerdata', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Customerdata.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Customerdata_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Customerdata_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Customerdata] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Customerdata].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Customerdata] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Customerdata] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Customerdata] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Customerdata] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Customerdata] SET ARITHABORT OFF 
GO
ALTER DATABASE [Customerdata] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Customerdata] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Customerdata] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Customerdata] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Customerdata] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Customerdata] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Customerdata] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Customerdata] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Customerdata] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Customerdata] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Customerdata] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Customerdata] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Customerdata] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Customerdata] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Customerdata] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Customerdata] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Customerdata] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Customerdata] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Customerdata] SET  MULTI_USER 
GO
ALTER DATABASE [Customerdata] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Customerdata] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Customerdata] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Customerdata] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Customerdata] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Customerdata] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Customerdata] SET QUERY_STORE = ON
GO
ALTER DATABASE [Customerdata] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Customerdata]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 1/19/2025 4:37:17 AM ******/
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
/****** Object:  Table [dbo].[Addresses]    Script Date: 1/19/2025 4:37:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AddressType] [nvarchar](100) NULL,
	[AddressLine] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[Country] [nvarchar](100) NULL,
	[PostalCode] [nvarchar](100) NULL,
	[CustomerId] [int] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerAndAddresses]    Script Date: 1/19/2025 4:37:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAndAddresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Photo] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
	[Fax] [nvarchar](max) NOT NULL,
	[Internet] [nvarchar](max) NOT NULL,
	[Remarks] [nvarchar](max) NOT NULL,
	[HomeAddress] [nvarchar](max) NULL,
	[OfficeAddress] [nvarchar](max) NULL,
 CONSTRAINT [PK_CustomerAndAddresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 1/19/2025 4:37:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Photo] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Phone] [nvarchar](100) NULL,
	[Fax] [nvarchar](100) NULL,
	[Internet] [nvarchar](100) NULL,
	[Remarks] [nvarchar](255) NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250117204353_FirstMigration', N'7.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250118115106_Initial', N'7.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250118115511_InitialF', N'7.0.0')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250118121334_InitialFF', N'7.0.0')
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 
GO
INSERT [dbo].[Addresses] ([Id], [AddressType], [AddressLine], [City], [Country], [PostalCode], [CustomerId]) VALUES (3, N'Home', N'Yan Shin Lane North Okkalapa Yangon', N'Yangon', N'Myanmar', N'334432', 2)
GO
INSERT [dbo].[Addresses] ([Id], [AddressType], [AddressLine], [City], [Country], [PostalCode], [CustomerId]) VALUES (4, N'Office', N'Ward 33 North Dagon Yangon', N'Yangon', N'Myanmar', N'234455', 2)
GO
INSERT [dbo].[Addresses] ([Id], [AddressType], [AddressLine], [City], [Country], [PostalCode], [CustomerId]) VALUES (5, N'Home', N'Ward50 North Okkalapa Yangon', N'Yangon', N'Myanmar', N'34213', 3)
GO
INSERT [dbo].[Addresses] ([Id], [AddressType], [AddressLine], [City], [Country], [PostalCode], [CustomerId]) VALUES (6, N'Office', N'Ward 45 North Dagon Yangon', N'Yangon', N'Myanmar', N'23412', 3)
GO
INSERT [dbo].[Addresses] ([Id], [AddressType], [AddressLine], [City], [Country], [PostalCode], [CustomerId]) VALUES (7, N'Home', N'Ward 24 North Okkalapa Yangon', N'Yangon', N'Myanmar', N'23489', 4)
GO
INSERT [dbo].[Addresses] ([Id], [AddressType], [AddressLine], [City], [Country], [PostalCode], [CustomerId]) VALUES (8, N'Office', N'Ward 28 North Dagon Yangon', N'Yangon', N'Myanmar', N'34567', 4)
GO
SET IDENTITY_INSERT [dbo].[Addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 
GO
INSERT [dbo].[Customers] ([Id], [Name], [Photo], [Email], [Phone], [Fax], [Internet], [Remarks]) VALUES (2, N'Royal Asia', N'photo2.jpg', N'royalasia@gmail.com', N'3345677', N'11223344', N'https://www.royalasia.com.mm', N'Remarks2')
GO
INSERT [dbo].[Customers] ([Id], [Name], [Photo], [Email], [Phone], [Fax], [Internet], [Remarks]) VALUES (3, N'Sky Line', N'photo3.jpg', N'skyline@gmail.com', N'3900200', N'11223344', N'https://www.skyline.com.my', N'Remarks3')
GO
INSERT [dbo].[Customers] ([Id], [Name], [Photo], [Email], [Phone], [Fax], [Internet], [Remarks]) VALUES (4, N'Cherry Myay', N'photo4.jpg', N'cherrymyay@gmail.com', N'2345678', N'11223344', N'https://www.cherrymyay.com.mm', N'Remarks4')
GO
INSERT [dbo].[Customers] ([Id], [Name], [Photo], [Email], [Phone], [Fax], [Internet], [Remarks]) VALUES (10, N'Name11', N'', N'', N'1222222', N'', N'', N'')
GO
INSERT [dbo].[Customers] ([Id], [Name], [Photo], [Email], [Phone], [Fax], [Internet], [Remarks]) VALUES (11, N'Name111', N'', N'', N'22222', N'', N'', N'')
GO
INSERT [dbo].[Customers] ([Id], [Name], [Photo], [Email], [Phone], [Fax], [Internet], [Remarks]) VALUES (12, N'Name111', N'', N'', N'23333', N'', N'', N'')
GO
INSERT [dbo].[Customers] ([Id], [Name], [Photo], [Email], [Phone], [Fax], [Internet], [Remarks]) VALUES (13, N'Name222', N'', N'', N'33333', N'', N'', N'')
GO
INSERT [dbo].[Customers] ([Id], [Name], [Photo], [Email], [Phone], [Fax], [Internet], [Remarks]) VALUES (14, N'dddd', N'', N'', N'22222', N'', N'', N'')
GO
INSERT [dbo].[Customers] ([Id], [Name], [Photo], [Email], [Phone], [Fax], [Internet], [Remarks]) VALUES (15, N'dddddeeeee', N'', N'', N'333222', N'', N'', N'')
GO
INSERT [dbo].[Customers] ([Id], [Name], [Photo], [Email], [Phone], [Fax], [Internet], [Remarks]) VALUES (16, N'dfdddd', N'', N'', N'23111', N'', N'', N'')
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
/****** Object:  StoredProcedure [dbo].[DeleteCustomerAndAddresses]    Script Date: 1/19/2025 4:37:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteCustomerAndAddresses] 
@CustomerID INT 
AS BEGIN SET NOCOUNT ON; 
-- Delete from Addresses table first 
DELETE FROM Addresses WHERE CustomerID = @CustomerID; 
-- Delete from Customers table 
DELETE FROM Customers WHERE Id = @CustomerID; 
END;
GO
/****** Object:  StoredProcedure [dbo].[GetCustomerAndAddressesById]    Script Date: 1/19/2025 4:37:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[GetCustomerAndAddressesById]

@Id int	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	SELECT 
    c.Id,
    c.Name,
    c.Photo,
    c.Email,
    c.Phone,
    c.Fax,
    c.Internet,
    c.Remarks,
    HomeAddress = STUFF((
        SELECT '; ' + a.AddressLine + ', ' + a.City + ', ' + a.Country + ', ' + a.PostalCode
        FROM Addresses a
        WHERE a.CustomerId = c.Id AND a.AddressType = 'Home'
        FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, ''),
    OfficeAddress = STUFF((
        SELECT '; ' + a.AddressLine + ', ' + a.City + ', ' + a.Country + ', ' + a.PostalCode
        FROM Addresses a
        WHERE a.CustomerId = c.Id AND a.AddressType = 'Office'
        FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '')
FROM 
    Customers c 
WHERE c.Id = @Id

END
GO
/****** Object:  StoredProcedure [dbo].[GetCustomersAndAddresses]    Script Date: 1/19/2025 4:37:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetCustomersAndAddresses]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
	SELECT 
    c.Id,
    c.Name,
    c.Photo,
    c.Email,
    c.Phone,
    c.Fax,
    c.Internet,
    c.Remarks,
    HomeAddress = STUFF((
        SELECT '; ' + a.AddressLine + ', ' + a.City + ', ' + a.Country + ', ' + a.PostalCode
        FROM Addresses a
        WHERE a.CustomerId = c.Id AND a.AddressType = 'Home'
        FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, ''),
    OfficeAddress = STUFF((
        SELECT '; ' + a.AddressLine + ', ' + a.City + ', ' + a.Country + ', ' + a.PostalCode
        FROM Addresses a
        WHERE a.CustomerId = c.Id AND a.AddressType = 'Office'
        FOR XML PATH(''), TYPE).value('.', 'NVARCHAR(MAX)'), 1, 2, '')
FROM 
    Customers c
END
GO
/****** Object:  StoredProcedure [dbo].[InsertCustomerAndAddresses]    Script Date: 1/19/2025 4:37:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[InsertCustomerAndAddresses] 
@Name NVARCHAR(100), 
@Photo NVARCHAR(100),
@Email NVARCHAR(100),
@Phone NVARCHAR (100),
@Fax NVARCHAR (100),
@Internet NVARCHAR (100),
@Remarks NVARCHAR (250),
@AddressLine1 NVARCHAR(255), 
@AddressType1 NVARCHAR(100),
@City1 NVARCHAR(100), 
@Country1 NVARCHAR(100), 
@PostalCode1 NVARCHAR(20), 
@AddressLine2 NVARCHAR(255), 
@City2 NVARCHAR(100), 
@Country2 NVARCHAR(100), 
@PostalCode2 NVARCHAR(20),
@AddressType2 NVARCHAR(100)
AS BEGIN 
SET NOCOUNT ON; DECLARE @CustomerID INT; 
-- Insert into Customers table 
INSERT INTO Customers (Name, Photo, Email, Phone, Fax, Internet, Remarks) 
VALUES (@Name, @Photo, @Email,@Phone,@Fax,@Internet,@Remarks); 
-- Get the newly inserted CustomerID SET @CustomerID = SCOPE_IDENTITY(); 
SET @CustomerID = SCOPE_IDENTITY();

-- Insert the first address 
IF ( @AddressLine1 != '' ) 
OR (@City1 != '') OR ( @Country1 != '') 
OR ( @PostalCode1 != '') 
BEGIN
	INSERT INTO Addresses (CustomerID, AddressLine, City, Country, PostalCode, AddressType) 
	VALUES (@CustomerID, @AddressLine1, @City1, @Country1, @PostalCode1,@AddressType1); 
END
-- Insert the second address 

IF ( @AddressLine2 != '' ) 
OR ( @City2 != '') OR ( @Country2 != '') 
OR ( @PostalCode2 != '') 
BEGIN
	INSERT INTO Addresses (CustomerID, AddressLine, City, Country, PostalCode, AddressType) 
	VALUES (@CustomerID, @AddressLine2, @City2, @Country2, @PostalCode2,@AddressType2);
END

END;
GO
/****** Object:  StoredProcedure [dbo].[UpdateCustomerDetails]    Script Date: 1/19/2025 4:37:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateCustomerDetails] 
@CustomerID INT,
@Name NVARCHAR(255),
@Photo NVARCHAR(100),
@Email NVARCHAR(100),
@Phone NVARCHAR(100),
@Fax NVARCHAR(100),
@Internet NVARCHAR(100),
@Remarks NVARCHAR(255)
AS 
BEGIN 
SET NOCOUNT ON; 
UPDATE Customers SET Name = @Name, 
Photo = @Photo, Email = @Email, 
Phone =@Phone, Fax = @Fax, Internet = @Internet, Remarks = @Remarks
WHERE Id = @CustomerID; 
END;
GO
USE [master]
GO
ALTER DATABASE [Customerdata] SET  READ_WRITE 
GO
