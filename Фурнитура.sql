USE [master]
GO
/****** Object:  Database [Furniture_order]    Script Date: 28.03.2020 22:07:29 ******/
CREATE DATABASE [Furniture_order]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Furniture_order', FILENAME = N'C:\Users\Public\Furniture_order.mdf' , SIZE = 18432KB , MAXSIZE = 102400KB , FILEGROWTH = 10240KB )
 LOG ON 
( NAME = N'Furniture_order_log', FILENAME = N'C:\Users\Public\Furniture_order_log.ldf' , SIZE = 8192KB , MAXSIZE = 102400KB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [Furniture_order] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Furniture_order].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Furniture_order] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Furniture_order] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Furniture_order] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Furniture_order] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Furniture_order] SET ARITHABORT OFF 
GO
ALTER DATABASE [Furniture_order] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Furniture_order] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Furniture_order] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Furniture_order] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Furniture_order] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Furniture_order] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Furniture_order] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Furniture_order] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Furniture_order] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Furniture_order] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Furniture_order] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Furniture_order] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Furniture_order] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Furniture_order] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Furniture_order] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Furniture_order] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Furniture_order] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Furniture_order] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Furniture_order] SET  MULTI_USER 
GO
ALTER DATABASE [Furniture_order] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Furniture_order] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Furniture_order] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Furniture_order] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Furniture_order] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Furniture_order] SET QUERY_STORE = OFF
GO
USE [Furniture_order]
GO
/****** Object:  Table [dbo].[Equipment]    Script Date: 28.03.2020 22:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Equipment](
	[Label_equipment] [nchar](20) NOT NULL,
	[Type_name_equipment] [varchar](30) NOT NULL,
	[Characteristic_equipment] [varchar](100) NULL,
 CONSTRAINT [PK_Equipment] PRIMARY KEY CLUSTERED 
(
	[Label_equipment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Furniture]    Script Date: 28.03.2020 22:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Furniture](
	[Code_furniture] [int] IDENTITY(1,1) NOT NULL,
	[Vendor_code] [varchar](50) NOT NULL,
	[Name_furniture] [varchar](200) NOT NULL,
	[Unit_measure] [varchar](10) NOT NULL,
	[Count_furniture] [int] NOT NULL,
	[Name_supplier] [varchar](30) NULL,
	[Image_furniture] [image] NULL,
	[Type_furniture] [varchar](50) NOT NULL,
	[Purchase_price] [decimal](18, 2) NULL,
	[Weight_furniture] [decimal](10, 3) NULL,
 CONSTRAINT [PK_Furniture_1] PRIMARY KEY CLUSTERED 
(
	[Code_furniture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materials]    Script Date: 28.03.2020 22:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materials](
	[Code_material] [varchar](20) NOT NULL,
	[Name_material] [varchar](50) NOT NULL,
	[Unit_measure] [varchar](5) NULL,
	[Count_measure] [varchar](10) NULL,
	[Name_supplier] [varchar](30) NULL,
	[Image_material] [image] NULL,
	[Type_material] [varchar](30) NULL,
	[Purchase_price] [nvarchar](50) NULL,
	[Name_GOST] [varchar](30) NULL,
	[Length_material] [decimal](10, 3) NULL,
	[Characteristic_material] [varchar](100) NULL,
 CONSTRAINT [PK_Materials] PRIMARY KEY CLUSTERED 
(
	[Code_material] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 28.03.2020 22:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id_order] [int] NOT NULL,
	[Date_of_order] [date] NOT NULL,
	[Name_order] [varchar](50) NOT NULL,
	[Name_product] [varchar](30) NOT NULL,
	[Login_customer] [varchar](50) NOT NULL,
	[Login_manager] [varchar](50) NULL,
	[Cost_order] [money] NULL,
	[Cost_completion_date] [date] NULL,
	[Drawing_order] [image] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id_order] ASC,
	[Date_of_order] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Polsov]    Script Date: 28.03.2020 22:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Polsov](
	[Фамилия] [nvarchar](50) NOT NULL,
	[firstName] [nvarchar](128) NULL,
	[SecondName] [nvarchar](128) NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Role] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 28.03.2020 22:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Name_product] [varchar](30) NOT NULL,
	[Sizes_product] [decimal](10, 3) NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Name_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specification_details]    Script Date: 28.03.2020 22:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specification_details](
	[Name_product] [varchar](30) NOT NULL,
	[Name_detail] [varchar](30) NOT NULL,
	[Count_detail] [int] NOT NULL,
 CONSTRAINT [PK_Specification_details] PRIMARY KEY CLUSTERED 
(
	[Name_product] ASC,
	[Name_detail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specification_furniture]    Script Date: 28.03.2020 22:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specification_furniture](
	[Name_product] [varchar](30) NOT NULL,
	[Code_furniture] [int] NOT NULL,
	[Count_details] [int] NOT NULL,
 CONSTRAINT [PK_Specification_furniture] PRIMARY KEY CLUSTERED 
(
	[Name_product] ASC,
	[Code_furniture] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specification_materials]    Script Date: 28.03.2020 22:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specification_materials](
	[Name_product] [varchar](30) NOT NULL,
	[Code_material] [varchar](20) NOT NULL,
	[Count_details] [int] NOT NULL,
 CONSTRAINT [PK_Specification_materials] PRIMARY KEY CLUSTERED 
(
	[Name_product] ASC,
	[Code_material] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Specification_operations]    Script Date: 28.03.2020 22:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Specification_operations](
	[Name_produt] [varchar](30) NOT NULL,
	[Operation] [varchar](30) NOT NULL,
	[Serial_number] [int] NOT NULL,
	[Type_name_equipment] [varchar](30) NULL,
	[Operation_time] [time](7) NOT NULL,
 CONSTRAINT [PK_Specification_operations] PRIMARY KEY CLUSTERED 
(
	[Name_produt] ASC,
	[Operation] ASC,
	[Serial_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 28.03.2020 22:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Suppliers](
	[Name_supplier] [varchar](30) NOT NULL,
	[Address] [varchar](100) NULL,
	[Date_delivery] [date] NOT NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[Name_supplier] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type_equipment]    Script Date: 28.03.2020 22:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type_equipment](
	[Type_name_equipment] [varchar](30) NOT NULL,
 CONSTRAINT [PK_Type_equipment] PRIMARY KEY CLUSTERED 
(
	[Type_name_equipment] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 28.03.2020 22:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Login] [varchar](50) NOT NULL,
	[Password] [varchar](18) NOT NULL,
	[Role_name] [varchar](30) NOT NULL,
	[Last_name] [varchar](50) NULL,
	[First_name] [varchar](50) NULL,
	[Patronym] [varchar](50) NULL,
	[Photo] [image] NULL,
 CONSTRAINT [PK_Users_1] PRIMARY KEY CLUSTERED 
(
	[Login] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пользователи2]    Script Date: 28.03.2020 22:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пользователи2](
	[Фамилия] [nvarchar](50) NOT NULL,
	[Имя_отчество] [nvarchar](50) NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[Role] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Фурнитура$]    Script Date: 28.03.2020 22:07:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Фурнитура$](
	[Артикул] [nvarchar](255) NULL,
	[Наименование] [nvarchar](255) NULL,
	[Количество] [float] NULL,
	[Единица измерения] [nvarchar](255) NULL,
	[Тип] [nvarchar](255) NULL,
	[Цена] [float] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Equipment]  WITH CHECK ADD  CONSTRAINT [FK_Equipment_Type_equipment] FOREIGN KEY([Type_name_equipment])
REFERENCES [dbo].[Type_equipment] ([Type_name_equipment])
GO
ALTER TABLE [dbo].[Equipment] CHECK CONSTRAINT [FK_Equipment_Type_equipment]
GO
ALTER TABLE [dbo].[Furniture]  WITH CHECK ADD  CONSTRAINT [FK_Furniture_Suppliers] FOREIGN KEY([Name_supplier])
REFERENCES [dbo].[Suppliers] ([Name_supplier])
GO
ALTER TABLE [dbo].[Furniture] CHECK CONSTRAINT [FK_Furniture_Suppliers]
GO
ALTER TABLE [dbo].[Materials]  WITH CHECK ADD  CONSTRAINT [FK_Materials_Suppliers] FOREIGN KEY([Name_supplier])
REFERENCES [dbo].[Suppliers] ([Name_supplier])
GO
ALTER TABLE [dbo].[Materials] CHECK CONSTRAINT [FK_Materials_Suppliers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Products] FOREIGN KEY([Name_product])
REFERENCES [dbo].[Products] ([Name_product])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users] FOREIGN KEY([Login_customer])
REFERENCES [dbo].[Users] ([Login])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Users1] FOREIGN KEY([Login_manager])
REFERENCES [dbo].[Users] ([Login])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Users1]
GO
ALTER TABLE [dbo].[Specification_details]  WITH CHECK ADD  CONSTRAINT [FK_Specification_details_Products] FOREIGN KEY([Name_product])
REFERENCES [dbo].[Products] ([Name_product])
GO
ALTER TABLE [dbo].[Specification_details] CHECK CONSTRAINT [FK_Specification_details_Products]
GO
ALTER TABLE [dbo].[Specification_details]  WITH CHECK ADD  CONSTRAINT [FK_Specification_details_Products1] FOREIGN KEY([Name_detail])
REFERENCES [dbo].[Products] ([Name_product])
GO
ALTER TABLE [dbo].[Specification_details] CHECK CONSTRAINT [FK_Specification_details_Products1]
GO
ALTER TABLE [dbo].[Specification_furniture]  WITH CHECK ADD  CONSTRAINT [FK_Specification_furniture_Furniture] FOREIGN KEY([Code_furniture])
REFERENCES [dbo].[Furniture] ([Code_furniture])
GO
ALTER TABLE [dbo].[Specification_furniture] CHECK CONSTRAINT [FK_Specification_furniture_Furniture]
GO
ALTER TABLE [dbo].[Specification_materials]  WITH CHECK ADD  CONSTRAINT [FK_Specification_materials_Materials] FOREIGN KEY([Code_material])
REFERENCES [dbo].[Materials] ([Code_material])
GO
ALTER TABLE [dbo].[Specification_materials] CHECK CONSTRAINT [FK_Specification_materials_Materials]
GO
ALTER TABLE [dbo].[Specification_materials]  WITH CHECK ADD  CONSTRAINT [FK_Specification_materials_Products] FOREIGN KEY([Name_product])
REFERENCES [dbo].[Products] ([Name_product])
GO
ALTER TABLE [dbo].[Specification_materials] CHECK CONSTRAINT [FK_Specification_materials_Products]
GO
ALTER TABLE [dbo].[Specification_operations]  WITH CHECK ADD  CONSTRAINT [FK_Specification_operations_Products] FOREIGN KEY([Name_produt])
REFERENCES [dbo].[Products] ([Name_product])
GO
ALTER TABLE [dbo].[Specification_operations] CHECK CONSTRAINT [FK_Specification_operations_Products]
GO
ALTER TABLE [dbo].[Specification_operations]  WITH CHECK ADD  CONSTRAINT [FK_Specification_operations_Type_equipment] FOREIGN KEY([Type_name_equipment])
REFERENCES [dbo].[Type_equipment] ([Type_name_equipment])
GO
ALTER TABLE [dbo].[Specification_operations] CHECK CONSTRAINT [FK_Specification_operations_Type_equipment]
GO
USE [master]
GO
ALTER DATABASE [Furniture_order] SET  READ_WRITE 
GO
