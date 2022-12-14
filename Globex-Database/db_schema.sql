USE [master]
GO
/****** Object:  Database [globex]    Script Date: 12/01/2021 03:55:46 ******/
CREATE DATABASE [globex]
 CONTAINMENT = NONE
GO

ALTER DATABASE [globex] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
	EXEC [globex].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [globex] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [globex] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [globex] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [globex] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [globex] SET ARITHABORT OFF 
GO
ALTER DATABASE [globex] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [globex] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [globex] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [globex] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [globex] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [globex] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [globex] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [globex] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [globex] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [globex] SET  DISABLE_BROKER 
GO
ALTER DATABASE [globex] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [globex] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [globex] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [globex] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [globex] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [globex] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [globex] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [globex] SET RECOVERY FULL 
GO
ALTER DATABASE [globex] SET  MULTI_USER 
GO
ALTER DATABASE [globex] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [globex] SET DB_CHAINING OFF 
GO
ALTER DATABASE [globex] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [globex] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [globex] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'globex', N'ON'
GO
ALTER DATABASE [globex] SET QUERY_STORE = OFF
GO
USE [globex]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 12/01/2021 03:55:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee]
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Dob] [date] NOT NULL,
	[PayBand] [int] NOT NULL,
	[NationalInsuranceNumber] [nvarchar](10) NULL,
	[Phone] [nvarchar](25) NULL,
	[EmergencyContactName] [nvarchar](100) NULL,
	[EmergencyContactPhone] [nvarchar](25) NULL,
	[SalaryAccountNumber] [nvarchar](50) NOT NULL,
	[SalarySortCode] [nvarchar](10) NOT NULL,
	[UnionMembershipNo] [nvarchar](15) NULL,
	[ManagerId] [int] NULL,
	[ManagerFirstName] [nvarchar](50) NULL,
	[ManagerSurname] [nvarchar](50) NULL,
	CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 12/01/2021 03:55:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order]
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Product] [int] NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	[Supplier] [int] NOT NULL,
	CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PayBand]    Script Date: 12/01/2021 03:55:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PayBand]
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[MonthlySalary] [decimal](10, 2) NOT NULL,
	[AnnualBonus] [decimal](10, 2) NOT NULL,
	CONSTRAINT [PK_PayBand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 12/01/2021 03:55:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product]
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[SellingPrice] [decimal](10, 2) NOT NULL,
	CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sale]    Script Date: 12/01/2021 03:55:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sale]
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Amount] [decimal](10, 2) NOT NULL,
	CONSTRAINT [PK_Sale] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stock]    Script Date: 12/01/2021 03:55:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stock]
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SupplierId] [int] NOT NULL,
	[Price] [decimal](10, 2) NOT NULL,
	CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 12/01/2021 03:55:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier]
(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[ContactName] [nvarchar](50) NOT NULL,
	[ContactNumber] [nvarchar](50) NULL,
	[ContactEmail] [nvarchar](50) NOT NULL,
	CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 12/01/2021 03:55:47 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User]
(
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[CardNumber] [nvarchar](28) NULL,
	[CardExpiryDate] [date] NULL,
	[CardCSV] [nvarchar](3) NULL,
	[Dob] [date] NOT NULL,
	[Gender] [nvarchar](10) NOT NULL,
	CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Employee]  WITH CHECK ADD  CONSTRAINT [FK_Employee_PayBand] FOREIGN KEY([PayBand])
REFERENCES [dbo].[PayBand] ([Id])
GO
ALTER TABLE [dbo].[Employee] CHECK CONSTRAINT [FK_Employee_PayBand]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Product] FOREIGN KEY([Product])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Product]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Supplier] FOREIGN KEY([Supplier])
REFERENCES [dbo].[Supplier] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Supplier]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_Product]
GO
ALTER TABLE [dbo].[Sale]  WITH CHECK ADD  CONSTRAINT [FK_Sale_User] FOREIGN KEY([Username])
REFERENCES [dbo].[User] ([Username])
GO
ALTER TABLE [dbo].[Sale] CHECK CONSTRAINT [FK_Sale_User]
GO
ALTER TABLE [dbo].[Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_Supplier] FOREIGN KEY([SupplierId])
REFERENCES [dbo].[Supplier] ([Id])
GO
ALTER TABLE [dbo].[Stock] CHECK CONSTRAINT [FK_Stock_Supplier]
GO
USE [master]
GO
ALTER DATABASE [globex] SET  READ_WRITE 
GO
