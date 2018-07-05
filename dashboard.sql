USE [master]
GO
/****** Object:  Database [DashboardFMP ]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE DATABASE [DashboardFMP ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DashboardFMP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DashboardFMP .mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DashboardFMP _log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\DashboardFMP _log.ldf' , SIZE = 5120KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DashboardFMP ] SET COMPATIBILITY_LEVEL = 120
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
ALTER DATABASE [DashboardFMP ] SET RECOVERY FULL 
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
ALTER DATABASE [DashboardFMP ] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DashboardFMP ', N'ON'
GO
USE [DashboardFMP ]
GO
/****** Object:  Table [dbo].[checklist]    Script Date: 7/5/2018 2:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[checklist](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[checklist_question_info]    Script Date: 7/5/2018 2:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[checklist_question_info](
	[checklistquestion_id] [int] NOT NULL,
	[language_id] [int] NOT NULL,
	[name] [varchar](1) NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[checklistquestion_id] ASC,
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[checklistquestion]    Script Date: 7/5/2018 2:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[checklistquestion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[checklist_id] [int] NOT NULL,
	[code] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[country]    Script Date: 7/5/2018 2:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[country_indicator]    Script Date: 7/5/2018 2:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[country_indicator](
	[indicator_id] [int] NOT NULL,
	[country_id] [int] NOT NULL,
	[value] [int] NOT NULL,
	[inputtype] [varchar](6) NOT NULL,
	[quarter] [int] NOT NULL,
	[target] [int] NULL,
	[inputyear] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[indicator_id] ASC,
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[country_info]    Script Date: 7/5/2018 2:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[country_info](
	[country_id] [int] NOT NULL,
	[language_id] [int] NOT NULL,
	[name] [varchar](1) NOT NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[country_id] ASC,
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[indicator]    Script Date: 7/5/2018 2:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[indicator](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[checklist_id] [int] NOT NULL,
	[objective_id] [int] NOT NULL,
	[indicatorgroup_id] [int] NOT NULL,
	[code] [varchar](10) NULL,
	[mode] [varchar](10) NOT NULL,
	[frequency] [varchar](2) NOT NULL,
	[responsible] [int] NULL,
	[contact] [int] NULL,
	[inputtype] [varchar](6) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[indicator_group_info]    Script Date: 7/5/2018 2:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[indicator_group_info](
	[indicatorgroup_id] [int] NOT NULL,
	[language_id] [int] NOT NULL,
	[name] [varchar](1) NULL,
	[description] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[indicatorgroup_id] ASC,
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[indicator_info]    Script Date: 7/5/2018 2:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[indicator_info](
	[language_id] [int] NOT NULL,
	[indicator_id] [int] NOT NULL,
	[name] [varchar](255) NOT NULL,
	[code] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[language_id] ASC,
	[indicator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[indicatorgroup]    Script Date: 7/5/2018 2:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[indicatorgroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[language]    Script Date: 7/5/2018 2:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[language](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](100) NULL,
	[code] [varchar](3) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[objective]    Script Date: 7/5/2018 2:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[objective](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[objective_info]    Script Date: 7/5/2018 2:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[objective_info](
	[objective_id] [int] NOT NULL,
	[language_id] [int] NOT NULL,
	[name] [varchar](1) NULL,
	[text] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[objective_id] ASC,
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[question_value]    Script Date: 7/5/2018 2:50:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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

GO
/****** Object:  Index [checklist_question_info_FKIndex1]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [checklist_question_info_FKIndex1] ON [dbo].[checklist_question_info]
(
	[checklistquestion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [checklist_question_info_FKIndex2]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [checklist_question_info_FKIndex2] ON [dbo].[checklist_question_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Checklist_Question_Info]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [IFK_Checklist_Question_Info] ON [dbo].[checklist_question_info]
(
	[checklistquestion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Question_Lang]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [IFK_Question_Lang] ON [dbo].[checklist_question_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [checklistquestion_FKIndex1]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [checklistquestion_FKIndex1] ON [dbo].[checklistquestion]
(
	[checklist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Checklist_Question]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [IFK_Checklist_Question] ON [dbo].[checklistquestion]
(
	[checklist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [country_indicator_FKIndex1]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [country_indicator_FKIndex1] ON [dbo].[country_indicator]
(
	[indicator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [country_indicator_FKIndex2]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [country_indicator_FKIndex2] ON [dbo].[country_indicator]
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [country_indicator_year]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [country_indicator_year] ON [dbo].[country_indicator]
(
	[inputyear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Country_Indicator]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [IFK_Country_Indicator] ON [dbo].[country_indicator]
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Indicator_Country]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [IFK_Indicator_Country] ON [dbo].[country_indicator]
(
	[indicator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [countryinfo_FKIndex1]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [countryinfo_FKIndex1] ON [dbo].[country_info]
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [countryinfo_FKIndex2]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [countryinfo_FKIndex2] ON [dbo].[country_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Country_Info]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [IFK_Country_Info] ON [dbo].[country_info]
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Country_Lang]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [IFK_Country_Lang] ON [dbo].[country_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Checklist_Indicator]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [IFK_Checklist_Indicator] ON [dbo].[indicator]
(
	[checklist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Indicator_Group]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [IFK_Indicator_Group] ON [dbo].[indicator]
(
	[indicatorgroup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Indicator_Objective]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [IFK_Indicator_Objective] ON [dbo].[indicator]
(
	[objective_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_FKIndex1]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [indicator_FKIndex1] ON [dbo].[indicator]
(
	[indicatorgroup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_FKIndex2]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [indicator_FKIndex2] ON [dbo].[indicator]
(
	[objective_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_FKIndex3]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [indicator_FKIndex3] ON [dbo].[indicator]
(
	[checklist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Group_Info]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [IFK_Group_Info] ON [dbo].[indicator_group_info]
(
	[indicatorgroup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Indicator_Lang]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [IFK_Indicator_Lang] ON [dbo].[indicator_group_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_group_info_FKIndex1]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [indicator_group_info_FKIndex1] ON [dbo].[indicator_group_info]
(
	[indicatorgroup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_group_info_FKIndex2]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [indicator_group_info_FKIndex2] ON [dbo].[indicator_group_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Indicator_Info]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [IFK_Indicator_Info] ON [dbo].[indicator_info]
(
	[indicator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Indicator_Lang]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [IFK_Indicator_Lang] ON [dbo].[indicator_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_info_FKIndex1]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [indicator_info_FKIndex1] ON [dbo].[indicator_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_info_FKIndex2]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [indicator_info_FKIndex2] ON [dbo].[indicator_info]
(
	[indicator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Objective_Info]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [IFK_Objective_Info] ON [dbo].[objective_info]
(
	[objective_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Objective_Lang]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [IFK_Objective_Lang] ON [dbo].[objective_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [objective_info_FKIndex1]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [objective_info_FKIndex1] ON [dbo].[objective_info]
(
	[objective_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [objective_info_FKIndex2]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [objective_info_FKIndex2] ON [dbo].[objective_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Country_Question]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [IFK_Country_Question] ON [dbo].[question_value]
(
	[country_indicator_indicator_id] ASC,
	[country_indicator_country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Question_Checklist]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [IFK_Question_Checklist] ON [dbo].[question_value]
(
	[checklistquestion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [question_value_FKIndex1]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [question_value_FKIndex1] ON [dbo].[question_value]
(
	[country_indicator_indicator_id] ASC,
	[country_indicator_country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [question_value_FKIndex2]    Script Date: 7/5/2018 2:50:34 PM ******/
CREATE NONCLUSTERED INDEX [question_value_FKIndex2] ON [dbo].[question_value]
(
	[checklistquestion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[checklist_question_info]  WITH CHECK ADD FOREIGN KEY([checklistquestion_id])
REFERENCES [dbo].[checklistquestion] ([id])
GO
ALTER TABLE [dbo].[checklist_question_info]  WITH CHECK ADD FOREIGN KEY([language_id])
REFERENCES [dbo].[language] ([id])
GO
ALTER TABLE [dbo].[checklistquestion]  WITH CHECK ADD FOREIGN KEY([checklist_id])
REFERENCES [dbo].[checklist] ([id])
GO
ALTER TABLE [dbo].[country_indicator]  WITH CHECK ADD FOREIGN KEY([country_id])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[country_indicator]  WITH CHECK ADD FOREIGN KEY([indicator_id])
REFERENCES [dbo].[indicator] ([id])
GO
ALTER TABLE [dbo].[country_info]  WITH CHECK ADD FOREIGN KEY([country_id])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[country_info]  WITH CHECK ADD FOREIGN KEY([language_id])
REFERENCES [dbo].[language] ([id])
GO
ALTER TABLE [dbo].[indicator]  WITH CHECK ADD FOREIGN KEY([checklist_id])
REFERENCES [dbo].[checklist] ([id])
GO
ALTER TABLE [dbo].[indicator]  WITH CHECK ADD FOREIGN KEY([indicatorgroup_id])
REFERENCES [dbo].[indicatorgroup] ([id])
GO
ALTER TABLE [dbo].[indicator]  WITH CHECK ADD FOREIGN KEY([objective_id])
REFERENCES [dbo].[objective] ([id])
GO
ALTER TABLE [dbo].[indicator_group_info]  WITH CHECK ADD FOREIGN KEY([indicatorgroup_id])
REFERENCES [dbo].[indicatorgroup] ([id])
GO
ALTER TABLE [dbo].[indicator_group_info]  WITH CHECK ADD FOREIGN KEY([language_id])
REFERENCES [dbo].[language] ([id])
GO
ALTER TABLE [dbo].[indicator_info]  WITH CHECK ADD FOREIGN KEY([indicator_id])
REFERENCES [dbo].[indicator] ([id])
GO
ALTER TABLE [dbo].[indicator_info]  WITH CHECK ADD FOREIGN KEY([language_id])
REFERENCES [dbo].[language] ([id])
GO
ALTER TABLE [dbo].[objective_info]  WITH CHECK ADD FOREIGN KEY([language_id])
REFERENCES [dbo].[language] ([id])
GO
ALTER TABLE [dbo].[objective_info]  WITH CHECK ADD FOREIGN KEY([objective_id])
REFERENCES [dbo].[objective] ([id])
GO
ALTER TABLE [dbo].[question_value]  WITH CHECK ADD FOREIGN KEY([checklistquestion_id])
REFERENCES [dbo].[checklistquestion] ([id])
GO
ALTER TABLE [dbo].[question_value]  WITH CHECK ADD FOREIGN KEY([country_indicator_indicator_id], [country_indicator_country_id])
REFERENCES [dbo].[country_indicator] ([indicator_id], [country_id])
GO
ALTER TABLE [dbo].[country_indicator]  WITH CHECK ADD CHECK  (([inputtype]='target' OR [inputtype]='fyi'))
GO
ALTER TABLE [dbo].[country_indicator]  WITH CHECK ADD CHECK  (([quarter]=(0) OR [quarter]=(4) OR [quarter]=(3) OR [quarter]=(2) OR [quarter]=(1)))
GO
ALTER TABLE [dbo].[indicator]  WITH CHECK ADD CHECK  (([frequency]='BQ' OR [frequency]='LQ' OR [frequency]='EQ'))
GO
ALTER TABLE [dbo].[indicator]  WITH CHECK ADD CHECK  (([inputtype]='target' OR [inputtype]='fyi'))
GO
ALTER TABLE [dbo].[indicator]  WITH CHECK ADD CHECK  (([mode]='value' OR [mode]='percent'))
GO
USE [master]
GO
ALTER DATABASE [DashboardFMP ] SET  READ_WRITE 
GO
