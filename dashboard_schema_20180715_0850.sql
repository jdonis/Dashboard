USE [master]
GO
/****** Object:  Database [DashboardFMP ]    Script Date: 15/07/2018 08:49:02 a.m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'DashboardFMP ')
BEGIN
CREATE DATABASE [DashboardFMP ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Original_DashboardFMP_', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DashboardFMP .mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Original_DashboardFMP__log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DashboardFMP _log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DashboardFMP ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DashboardFMP ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DashboardFMP ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DashboardFMP ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DashboardFMP ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DashboardFMP ] SET ARITHABORT OFF 
GO
ALTER DATABASE [DashboardFMP ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DashboardFMP ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DashboardFMP ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DashboardFMP ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DashboardFMP ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DashboardFMP ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DashboardFMP ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DashboardFMP ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DashboardFMP ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DashboardFMP ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DashboardFMP ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DashboardFMP ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DashboardFMP ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DashboardFMP ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DashboardFMP ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DashboardFMP ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DashboardFMP ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DashboardFMP ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DashboardFMP ] SET  MULTI_USER 
GO
ALTER DATABASE [DashboardFMP ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DashboardFMP ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DashboardFMP ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DashboardFMP ] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DashboardFMP ]
GO
/****** Object:  Table [dbo].[checklist]    Script Date: 15/07/2018 08:49:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[checklist]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[checklist](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[checklistquestion]    Script Date: 15/07/2018 08:49:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[checklistquestion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[checklistquestion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[language_id] [int] NULL,
	[checklist_id] [int] NOT NULL,
	[code] [nvarchar](100) NULL,
	[name] [nvarchar](512) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK__checklis__3213E83FC4B34454] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[country]    Script Date: 15/07/2018 08:49:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[country]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[language_id] [int] NOT NULL,
	[code] [nvarchar](3) NULL,
	[name] [nvarchar](250) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK__country__3213E83F5512AD62] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[country_indicator]    Script Date: 15/07/2018 08:49:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[country_indicator]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[country_indicator](
	[indicator_id] [int] NOT NULL,
	[country_id] [int] NOT NULL,
	[value] [int] NOT NULL,
	[inputtype] [nvarchar](6) NOT NULL,
	[quarter] [int] NOT NULL,
	[target] [int] NULL,
	[inputyear] [date] NULL,
 CONSTRAINT [PK__country___848D8C5525AFA0C7] PRIMARY KEY CLUSTERED 
(
	[indicator_id] ASC,
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[indicator]    Script Date: 15/07/2018 08:49:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[indicator]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[indicator](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[language_id] [int] NOT NULL,
	[checklist_id] [int] NOT NULL,
	[objective_id] [int] NOT NULL,
	[indicatorgroup_id] [int] NOT NULL,
	[code] [nvarchar](10) NULL,
	[mode] [nvarchar](10) NOT NULL,
	[frequency] [nvarchar](2) NOT NULL,
	[responsible] [int] NULL,
	[contact] [int] NULL,
	[inputtype] [nvarchar](6) NOT NULL,
	[name] [nvarchar](255) NULL,
	[shortname] [nvarchar](255) NULL,
 CONSTRAINT [PK__indicato__3213E83FBF115A95] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[indicatorgroup]    Script Date: 15/07/2018 08:49:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[indicatorgroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[indicatorgroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[language_id] [int] NULL,
	[code] [nvarchar](100) NULL,
	[name] [nvarchar](512) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK__indicato__3213E83FF084AE45] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[language]    Script Date: 15/07/2018 08:49:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[language]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[language](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[code] [varchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[objective]    Script Date: 15/07/2018 08:49:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[objective]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[objective](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[language_id] [int] NOT NULL,
	[code] [nvarchar](4) NULL,
	[name] [nvarchar](250) NULL,
	[text] [nvarchar](max) NULL,
 CONSTRAINT [PK__objectiv__3213E83FBC92FCA3] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[question_value]    Script Date: 15/07/2018 08:49:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[question_value]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[question_value](
	[country_indicator_country_id] [int] NOT NULL,
	[country_indicator_indicator_id] [int] NOT NULL,
	[checklistquestion_id] [int] NOT NULL,
	[value] [int] NULL,
	[target] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[country_indicator_country_id] ASC,
	[country_indicator_indicator_id] ASC,
	[checklistquestion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Index [checklistquestion_FKIndex1]    Script Date: 15/07/2018 08:49:03 a.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[checklistquestion]') AND name = N'checklistquestion_FKIndex1')
CREATE NONCLUSTERED INDEX [checklistquestion_FKIndex1] ON [dbo].[checklistquestion]
(
	[checklist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Checklist_Question]    Script Date: 15/07/2018 08:49:03 a.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[checklistquestion]') AND name = N'IFK_Checklist_Question')
CREATE NONCLUSTERED INDEX [IFK_Checklist_Question] ON [dbo].[checklistquestion]
(
	[checklist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [country_indicator_FKIndex1]    Script Date: 15/07/2018 08:49:03 a.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[country_indicator]') AND name = N'country_indicator_FKIndex1')
CREATE NONCLUSTERED INDEX [country_indicator_FKIndex1] ON [dbo].[country_indicator]
(
	[indicator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [country_indicator_FKIndex2]    Script Date: 15/07/2018 08:49:03 a.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[country_indicator]') AND name = N'country_indicator_FKIndex2')
CREATE NONCLUSTERED INDEX [country_indicator_FKIndex2] ON [dbo].[country_indicator]
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [country_indicator_year]    Script Date: 15/07/2018 08:49:03 a.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[country_indicator]') AND name = N'country_indicator_year')
CREATE NONCLUSTERED INDEX [country_indicator_year] ON [dbo].[country_indicator]
(
	[inputyear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Country_Indicator]    Script Date: 15/07/2018 08:49:03 a.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[country_indicator]') AND name = N'IFK_Country_Indicator')
CREATE NONCLUSTERED INDEX [IFK_Country_Indicator] ON [dbo].[country_indicator]
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Indicator_Country]    Script Date: 15/07/2018 08:49:03 a.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[country_indicator]') AND name = N'IFK_Indicator_Country')
CREATE NONCLUSTERED INDEX [IFK_Indicator_Country] ON [dbo].[country_indicator]
(
	[indicator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Checklist_Indicator]    Script Date: 15/07/2018 08:49:03 a.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator]') AND name = N'IFK_Checklist_Indicator')
CREATE NONCLUSTERED INDEX [IFK_Checklist_Indicator] ON [dbo].[indicator]
(
	[checklist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Indicator_Group]    Script Date: 15/07/2018 08:49:03 a.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator]') AND name = N'IFK_Indicator_Group')
CREATE NONCLUSTERED INDEX [IFK_Indicator_Group] ON [dbo].[indicator]
(
	[indicatorgroup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Indicator_Objective]    Script Date: 15/07/2018 08:49:03 a.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator]') AND name = N'IFK_Indicator_Objective')
CREATE NONCLUSTERED INDEX [IFK_Indicator_Objective] ON [dbo].[indicator]
(
	[objective_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_FKIndex1]    Script Date: 15/07/2018 08:49:03 a.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator]') AND name = N'indicator_FKIndex1')
CREATE NONCLUSTERED INDEX [indicator_FKIndex1] ON [dbo].[indicator]
(
	[indicatorgroup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_FKIndex2]    Script Date: 15/07/2018 08:49:03 a.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator]') AND name = N'indicator_FKIndex2')
CREATE NONCLUSTERED INDEX [indicator_FKIndex2] ON [dbo].[indicator]
(
	[objective_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_FKIndex3]    Script Date: 15/07/2018 08:49:03 a.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator]') AND name = N'indicator_FKIndex3')
CREATE NONCLUSTERED INDEX [indicator_FKIndex3] ON [dbo].[indicator]
(
	[checklist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Country_Question]    Script Date: 15/07/2018 08:49:03 a.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[question_value]') AND name = N'IFK_Country_Question')
CREATE NONCLUSTERED INDEX [IFK_Country_Question] ON [dbo].[question_value]
(
	[country_indicator_indicator_id] ASC,
	[country_indicator_country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Question_Checklist]    Script Date: 15/07/2018 08:49:03 a.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[question_value]') AND name = N'IFK_Question_Checklist')
CREATE NONCLUSTERED INDEX [IFK_Question_Checklist] ON [dbo].[question_value]
(
	[checklistquestion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [question_value_FKIndex1]    Script Date: 15/07/2018 08:49:03 a.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[question_value]') AND name = N'question_value_FKIndex1')
CREATE NONCLUSTERED INDEX [question_value_FKIndex1] ON [dbo].[question_value]
(
	[country_indicator_indicator_id] ASC,
	[country_indicator_country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [question_value_FKIndex2]    Script Date: 15/07/2018 08:49:03 a.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[question_value]') AND name = N'question_value_FKIndex2')
CREATE NONCLUSTERED INDEX [question_value_FKIndex2] ON [dbo].[question_value]
(
	[checklistquestion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__checklist__check__2B3F6F97]') AND parent_object_id = OBJECT_ID(N'[dbo].[checklistquestion]'))
ALTER TABLE [dbo].[checklistquestion]  WITH CHECK ADD  CONSTRAINT [FK__checklist__check__2B3F6F97] FOREIGN KEY([checklist_id])
REFERENCES [dbo].[checklist] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__checklist__check__2B3F6F97]') AND parent_object_id = OBJECT_ID(N'[dbo].[checklistquestion]'))
ALTER TABLE [dbo].[checklistquestion] CHECK CONSTRAINT [FK__checklist__check__2B3F6F97]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_checklistquestion_language]') AND parent_object_id = OBJECT_ID(N'[dbo].[checklistquestion]'))
ALTER TABLE [dbo].[checklistquestion]  WITH CHECK ADD  CONSTRAINT [FK_checklistquestion_language] FOREIGN KEY([language_id])
REFERENCES [dbo].[language] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_checklistquestion_language]') AND parent_object_id = OBJECT_ID(N'[dbo].[checklistquestion]'))
ALTER TABLE [dbo].[checklistquestion] CHECK CONSTRAINT [FK_checklistquestion_language]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_country_language]') AND parent_object_id = OBJECT_ID(N'[dbo].[country]'))
ALTER TABLE [dbo].[country]  WITH CHECK ADD  CONSTRAINT [FK_country_language] FOREIGN KEY([language_id])
REFERENCES [dbo].[language] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_country_language]') AND parent_object_id = OBJECT_ID(N'[dbo].[country]'))
ALTER TABLE [dbo].[country] CHECK CONSTRAINT [FK_country_language]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__country_i__count__2C3393D0]') AND parent_object_id = OBJECT_ID(N'[dbo].[country_indicator]'))
ALTER TABLE [dbo].[country_indicator]  WITH CHECK ADD  CONSTRAINT [FK__country_i__count__2C3393D0] FOREIGN KEY([country_id])
REFERENCES [dbo].[country] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__country_i__count__2C3393D0]') AND parent_object_id = OBJECT_ID(N'[dbo].[country_indicator]'))
ALTER TABLE [dbo].[country_indicator] CHECK CONSTRAINT [FK__country_i__count__2C3393D0]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__country_i__indic__2D27B809]') AND parent_object_id = OBJECT_ID(N'[dbo].[country_indicator]'))
ALTER TABLE [dbo].[country_indicator]  WITH CHECK ADD  CONSTRAINT [FK__country_i__indic__2D27B809] FOREIGN KEY([indicator_id])
REFERENCES [dbo].[indicator] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__country_i__indic__2D27B809]') AND parent_object_id = OBJECT_ID(N'[dbo].[country_indicator]'))
ALTER TABLE [dbo].[country_indicator] CHECK CONSTRAINT [FK__country_i__indic__2D27B809]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__indicator__check__300424B4]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator]  WITH CHECK ADD  CONSTRAINT [FK__indicator__check__300424B4] FOREIGN KEY([checklist_id])
REFERENCES [dbo].[checklist] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__indicator__check__300424B4]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator] CHECK CONSTRAINT [FK__indicator__check__300424B4]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__indicator__indic__30F848ED]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator]  WITH CHECK ADD  CONSTRAINT [FK__indicator__indic__30F848ED] FOREIGN KEY([indicatorgroup_id])
REFERENCES [dbo].[indicatorgroup] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__indicator__indic__30F848ED]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator] CHECK CONSTRAINT [FK__indicator__indic__30F848ED]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__indicator__objec__31EC6D26]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator]  WITH CHECK ADD  CONSTRAINT [FK__indicator__objec__31EC6D26] FOREIGN KEY([objective_id])
REFERENCES [dbo].[objective] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__indicator__objec__31EC6D26]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator] CHECK CONSTRAINT [FK__indicator__objec__31EC6D26]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_indicator_language]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator]  WITH CHECK ADD  CONSTRAINT [FK_indicator_language] FOREIGN KEY([language_id])
REFERENCES [dbo].[language] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_indicator_language]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator] CHECK CONSTRAINT [FK_indicator_language]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_indicatorgroup_language]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicatorgroup]'))
ALTER TABLE [dbo].[indicatorgroup]  WITH CHECK ADD  CONSTRAINT [FK_indicatorgroup_language] FOREIGN KEY([language_id])
REFERENCES [dbo].[language] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_indicatorgroup_language]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicatorgroup]'))
ALTER TABLE [dbo].[indicatorgroup] CHECK CONSTRAINT [FK_indicatorgroup_language]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_objective_language]') AND parent_object_id = OBJECT_ID(N'[dbo].[objective]'))
ALTER TABLE [dbo].[objective]  WITH CHECK ADD  CONSTRAINT [FK_objective_language] FOREIGN KEY([language_id])
REFERENCES [dbo].[language] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_objective_language]') AND parent_object_id = OBJECT_ID(N'[dbo].[objective]'))
ALTER TABLE [dbo].[objective] CHECK CONSTRAINT [FK_objective_language]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__question___check__38996AB5]') AND parent_object_id = OBJECT_ID(N'[dbo].[question_value]'))
ALTER TABLE [dbo].[question_value]  WITH CHECK ADD  CONSTRAINT [FK__question___check__38996AB5] FOREIGN KEY([checklistquestion_id])
REFERENCES [dbo].[checklistquestion] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__question___check__38996AB5]') AND parent_object_id = OBJECT_ID(N'[dbo].[question_value]'))
ALTER TABLE [dbo].[question_value] CHECK CONSTRAINT [FK__question___check__38996AB5]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__question_value__398D8EEE]') AND parent_object_id = OBJECT_ID(N'[dbo].[question_value]'))
ALTER TABLE [dbo].[question_value]  WITH CHECK ADD  CONSTRAINT [FK__question_value__398D8EEE] FOREIGN KEY([country_indicator_indicator_id], [country_indicator_country_id])
REFERENCES [dbo].[country_indicator] ([indicator_id], [country_id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__question_value__398D8EEE]') AND parent_object_id = OBJECT_ID(N'[dbo].[question_value]'))
ALTER TABLE [dbo].[question_value] CHECK CONSTRAINT [FK__question_value__398D8EEE]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__country_i__input__3A81B327]') AND parent_object_id = OBJECT_ID(N'[dbo].[country_indicator]'))
ALTER TABLE [dbo].[country_indicator]  WITH CHECK ADD  CONSTRAINT [CK__country_i__input__3A81B327] CHECK  (([inputtype]='target' OR [inputtype]='fyi'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__country_i__input__3A81B327]') AND parent_object_id = OBJECT_ID(N'[dbo].[country_indicator]'))
ALTER TABLE [dbo].[country_indicator] CHECK CONSTRAINT [CK__country_i__input__3A81B327]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__country_i__quart__3B75D760]') AND parent_object_id = OBJECT_ID(N'[dbo].[country_indicator]'))
ALTER TABLE [dbo].[country_indicator]  WITH CHECK ADD  CONSTRAINT [CK__country_i__quart__3B75D760] CHECK  (([quarter]=(0) OR [quarter]=(4) OR [quarter]=(3) OR [quarter]=(2) OR [quarter]=(1)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__country_i__quart__3B75D760]') AND parent_object_id = OBJECT_ID(N'[dbo].[country_indicator]'))
ALTER TABLE [dbo].[country_indicator] CHECK CONSTRAINT [CK__country_i__quart__3B75D760]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[chk_indicator_frequency]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator]  WITH CHECK ADD  CONSTRAINT [chk_indicator_frequency] CHECK  (([frequency]='EQ' OR [frequency]='LQ' OR [frequency]='BQ'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[chk_indicator_frequency]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator] CHECK CONSTRAINT [chk_indicator_frequency]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[chk_indicator_inputtype]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator]  WITH CHECK ADD  CONSTRAINT [chk_indicator_inputtype] CHECK  (([inputtype]='fyi' OR [inputtype]='target'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[chk_indicator_inputtype]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator] CHECK CONSTRAINT [chk_indicator_inputtype]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[chk_indicator_mode]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator]  WITH CHECK ADD  CONSTRAINT [chk_indicator_mode] CHECK  (([mode]='percent' OR [mode]='value'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[chk_indicator_mode]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator] CHECK CONSTRAINT [chk_indicator_mode]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__indicator__frequ__3C69FB99]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator]  WITH CHECK ADD  CONSTRAINT [CK__indicator__frequ__3C69FB99] CHECK  (([frequency]='BQ' OR [frequency]='LQ' OR [frequency]='EQ'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__indicator__frequ__3C69FB99]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator] CHECK CONSTRAINT [CK__indicator__frequ__3C69FB99]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__indicator__input__3D5E1FD2]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator]  WITH CHECK ADD  CONSTRAINT [CK__indicator__input__3D5E1FD2] CHECK  (([inputtype]='target' OR [inputtype]='fyi'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__indicator__input__3D5E1FD2]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator] CHECK CONSTRAINT [CK__indicator__input__3D5E1FD2]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__indicator__mode__3E52440B]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator]  WITH CHECK ADD  CONSTRAINT [CK__indicator__mode__3E52440B] CHECK  (([mode]='value' OR [mode]='percent'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__indicator__mode__3E52440B]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator] CHECK CONSTRAINT [CK__indicator__mode__3E52440B]
GO
USE [master]
GO
ALTER DATABASE [DashboardFMP ] SET  READ_WRITE 
GO
