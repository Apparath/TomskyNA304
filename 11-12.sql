USE [master]
GO
/****** Object:  Database [PR11_12RIZ]    Script Date: 28.03.2020 22:08:02 ******/
CREATE DATABASE [PR11_12RIZ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PR11_12RIZ', FILENAME = N'C:\Users\Public\PR11_12RIZ.mdf' , SIZE = 20480KB , MAXSIZE = 102400KB , FILEGROWTH = 10240KB )
 LOG ON 
( NAME = N'PR11_12RIZ_log', FILENAME = N'C:\Users\Public\PR11_12RIZ_log.ldf' , SIZE = 10240KB , MAXSIZE = 102400KB , FILEGROWTH = 10240KB )
GO
ALTER DATABASE [PR11_12RIZ] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PR11_12RIZ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PR11_12RIZ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PR11_12RIZ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PR11_12RIZ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PR11_12RIZ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PR11_12RIZ] SET ARITHABORT OFF 
GO
ALTER DATABASE [PR11_12RIZ] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [PR11_12RIZ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PR11_12RIZ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PR11_12RIZ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PR11_12RIZ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PR11_12RIZ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PR11_12RIZ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PR11_12RIZ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PR11_12RIZ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PR11_12RIZ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PR11_12RIZ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PR11_12RIZ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PR11_12RIZ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PR11_12RIZ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PR11_12RIZ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PR11_12RIZ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PR11_12RIZ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PR11_12RIZ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [PR11_12RIZ] SET  MULTI_USER 
GO
ALTER DATABASE [PR11_12RIZ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PR11_12RIZ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PR11_12RIZ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PR11_12RIZ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PR11_12RIZ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PR11_12RIZ] SET QUERY_STORE = OFF
GO
USE [PR11_12RIZ]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 28.03.2020 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Department_code] [int] NOT NULL,
	[Department_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Department_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Destinations]    Script Date: 28.03.2020 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Destinations](
	[Personnel_number] [int] NOT NULL,
	[Department_code] [int] NOT NULL,
	[Position_code] [int] NOT NULL,
	[Employment_date] [date] NOT NULL,
	[Dismissal_date] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 28.03.2020 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Personnel_number] [int] NOT NULL,
	[LastName] [nvarchar](20) NOT NULL,
	[FirstName] [nvarchar](20) NOT NULL,
	[Patronymic] [nvarchar](20) NOT NULL,
	[Birth_date] [date] NOT NULL,
	[Education] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Staff] PRIMARY KEY CLUSTERED 
(
	[Personnel_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Оклады]    Script Date: 28.03.2020 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Оклады](
	[Personnel_number] [int] NOT NULL,
	[Размер_оклада] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_2]    Script Date: 28.03.2020 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_2]
AS
SELECT        dbo.Departments.Department_name, AVG(dbo.Оклады.Размер_оклада) AS [Ср.оклад]
FROM            dbo.Departments INNER JOIN
                         dbo.Destinations ON dbo.Departments.Department_code = dbo.Destinations.Department_code INNER JOIN
                         dbo.Employees ON dbo.Destinations.Personnel_number = dbo.Employees.Personnel_number INNER JOIN
                         dbo.Оклады ON dbo.Employees.Personnel_number = dbo.Оклады.Personnel_number
GROUP BY dbo.Departments.Department_name
HAVING        (MAX(dbo.Оклады.Размер_оклада) > 15000)
GO
/****** Object:  Table [dbo].[ШтатИмпорт]    Script Date: 28.03.2020 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ШтатИмпорт](
	[Department_name] [varchar](50) NOT NULL,
	[Position_name] [varchar](50) NOT NULL,
	[Staff_count] [int] NOT NULL,
 CONSTRAINT [PK_ШтатИмпорт] PRIMARY KEY CLUSTERED 
(
	[Department_name] ASC,
	[Position_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[View_1]    Script Date: 28.03.2020 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[View_1]
AS
SELECT        dbo.Departments.Department_code, dbo.Departments.Department_name, dbo.ШтатИмпорт.Staff_count
FROM            dbo.ШтатИмпорт INNER JOIN
                         dbo.Departments ON dbo.ШтатИмпорт.Department_name = dbo.Departments.Department_name
GO
/****** Object:  Table [dbo].[Positions]    Script Date: 28.03.2020 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Positions](
	[Position_code] [int] NULL,
	[Position_name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[СотрудниткиИмпорт]    Script Date: 28.03.2020 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[СотрудниткиИмпорт](
	[номер] [float] NULL,
	[ФИО] [nvarchar](255) NULL,
	[пол] [nvarchar](255) NULL,
	[датаРождения] [datetime] NULL,
	[телефон] [nvarchar](255) NULL,
	[образование] [nvarchar](255) NULL,
	[названиеОтдела] [nvarchar](255) NULL,
	[кодДолжности] [float] NULL,
	[названиеДолжности] [nvarchar](255) NULL,
	[кодОтдела] [float] NULL,
	[датаПриема] [nvarchar](255) NULL,
	[датаУвольнения] [nvarchar](255) NULL,
	[статус] [nvarchar](255) NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Destinations]  WITH CHECK ADD  CONSTRAINT [FK_Destinations_Departments] FOREIGN KEY([Department_code])
REFERENCES [dbo].[Departments] ([Department_code])
GO
ALTER TABLE [dbo].[Destinations] CHECK CONSTRAINT [FK_Destinations_Departments]
GO
ALTER TABLE [dbo].[Destinations]  WITH CHECK ADD  CONSTRAINT [FK_Destinations_Employees] FOREIGN KEY([Personnel_number])
REFERENCES [dbo].[Employees] ([Personnel_number])
GO
ALTER TABLE [dbo].[Destinations] CHECK CONSTRAINT [FK_Destinations_Employees]
GO
ALTER TABLE [dbo].[Оклады]  WITH CHECK ADD  CONSTRAINT [FK_Оклады_Employees] FOREIGN KEY([Personnel_number])
REFERENCES [dbo].[Employees] ([Personnel_number])
GO
ALTER TABLE [dbo].[Оклады] CHECK CONSTRAINT [FK_Оклады_Employees]
GO
/****** Object:  StoredProcedure [dbo].[Proc1]    Script Date: 28.03.2020 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc1] @n int
AS
BEGIN
	SELECT dbo.Departments.Department_name, AVG(dbo.Оклады.Размер_оклада) AS [Ср.оклад]
	FROM dbo.Departments INNER JOIN
		 dbo.Destinations ON dbo.Departments.Department_code = dbo.Destinations.Department_code INNER JOIN
         dbo.Employees ON dbo.Destinations.Personnel_number = dbo.Employees.Personnel_number INNER JOIN
         dbo.Оклады ON dbo.Employees.Personnel_number = dbo.Оклады.Personnel_number
	GROUP BY dbo.Departments.Department_name
	HAVING (MAX(dbo.Оклады.Размер_оклада) > @n)
END
GO
/****** Object:  StoredProcedure [dbo].[Proc3]    Script Date: 28.03.2020 22:08:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[Proc3] @PartFam varchar(20), @n int OUTPUT
AS
BEGIN
	DECLARE @str varchar(10)
	SET @str='%'+@PartFam+'%'
	SELECT @n=COUNT(Employees.Personnel_number) FROM Employees
			WHERE Employees.LastName LIKE @str
END
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[10] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "ШтатИмпорт"
            Begin Extent = 
               Top = 11
               Left = 48
               Bottom = 124
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Departments"
            Begin Extent = 
               Top = 10
               Left = 300
               Bottom = 106
               Right = 487
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[41] 4[20] 2[13] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Departments"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 102
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Destinations"
            Begin Extent = 
               Top = 6
               Left = 263
               Bottom = 136
               Right = 451
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Employees"
            Begin Extent = 
               Top = 6
               Left = 489
               Bottom = 136
               Right = 677
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "Оклады"
            Begin Extent = 
               Top = 160
               Left = 271
               Bottom = 256
               Right = 459
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
    ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'  End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'View_2'
GO
USE [master]
GO
ALTER DATABASE [PR11_12RIZ] SET  READ_WRITE 
GO
