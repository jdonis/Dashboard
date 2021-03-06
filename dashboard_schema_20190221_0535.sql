USE [DashboardFMP]
GO
EXEC sys.sp_dropextendedproperty @name=N'MS_Description' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'indicator', @level2type=N'COLUMN',@level2name=N'mode_id'

GO
ALTER TABLE [dbo].[indicator] DROP CONSTRAINT [CK__indicator__mode__3E52440B]
GO
ALTER TABLE [dbo].[indicator] DROP CONSTRAINT [CK__indicator__input__3D5E1FD2]
GO
ALTER TABLE [dbo].[indicator] DROP CONSTRAINT [CK__indicator__frequ__3C69FB99]
GO
ALTER TABLE [dbo].[country_indicator] DROP CONSTRAINT [CK__country_i__quart__70A8B9AE]
GO
ALTER TABLE [dbo].[question_value] DROP CONSTRAINT [FK__question___check__6DCC4D03]
GO
ALTER TABLE [dbo].[objective_info] DROP CONSTRAINT [FK__objective__objec__37A5467C]
GO
ALTER TABLE [dbo].[objective_info] DROP CONSTRAINT [FK__objective__langu__36B12243]
GO
ALTER TABLE [dbo].[indicator_info] DROP CONSTRAINT [FK__indicator__langu__35BCFE0A]
GO
ALTER TABLE [dbo].[indicator_info] DROP CONSTRAINT [FK__indicator__indic__34C8D9D1]
GO
ALTER TABLE [dbo].[indicator_group_info] DROP CONSTRAINT [FK__indicator__langu__33D4B598]
GO
ALTER TABLE [dbo].[indicator_group_info] DROP CONSTRAINT [FK__indicator__indic__32E0915F]
GO
ALTER TABLE [dbo].[country_info] DROP CONSTRAINT [FK__country_i__langu__2F10007B]
GO
ALTER TABLE [dbo].[country_info] DROP CONSTRAINT [FK__country_i__count__2E1BDC42]
GO
ALTER TABLE [dbo].[country_indicator] DROP CONSTRAINT [FK__country_i__indic__2D27B809]
GO
ALTER TABLE [dbo].[country_indicator] DROP CONSTRAINT [FK__country_i__count__2C3393D0]
GO
ALTER TABLE [dbo].[checklistquestion] DROP CONSTRAINT [FK__checklist__check__607251E5]
GO
ALTER TABLE [dbo].[checklist_question_info] DROP CONSTRAINT [FK__checklist__langu__5F7E2DAC]
GO
ALTER TABLE [dbo].[checklist_question_info] DROP CONSTRAINT [FK__checklist__check__5E8A0973]
GO
/****** Object:  Index [question_value_FKIndex2]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [question_value_FKIndex2] ON [dbo].[question_value]
GO
/****** Object:  Index [question_value_FKIndex1]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [question_value_FKIndex1] ON [dbo].[question_value]
GO
/****** Object:  Index [IFK_Question_Checklist]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IFK_Question_Checklist] ON [dbo].[question_value]
GO
/****** Object:  Index [IFK_Country_Question]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IFK_Country_Question] ON [dbo].[question_value]
GO
/****** Object:  Index [objective_info_FKIndex2]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [objective_info_FKIndex2] ON [dbo].[objective_info]
GO
/****** Object:  Index [objective_info_FKIndex1]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [objective_info_FKIndex1] ON [dbo].[objective_info]
GO
/****** Object:  Index [IFK_Objective_Lang]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IFK_Objective_Lang] ON [dbo].[objective_info]
GO
/****** Object:  Index [IFK_Objective_Info]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IFK_Objective_Info] ON [dbo].[objective_info]
GO
/****** Object:  Index [IX_language_name]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IX_language_name] ON [dbo].[language]
GO
/****** Object:  Index [IX_language_code]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IX_language_code] ON [dbo].[language]
GO
/****** Object:  Index [indicator_info_FKIndex2]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [indicator_info_FKIndex2] ON [dbo].[indicator_info]
GO
/****** Object:  Index [indicator_info_FKIndex1]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [indicator_info_FKIndex1] ON [dbo].[indicator_info]
GO
/****** Object:  Index [IFK_Indicator_Lang]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IFK_Indicator_Lang] ON [dbo].[indicator_info]
GO
/****** Object:  Index [IFK_Indicator_Info]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IFK_Indicator_Info] ON [dbo].[indicator_info]
GO
/****** Object:  Index [indicator_group_info_FKIndex2]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [indicator_group_info_FKIndex2] ON [dbo].[indicator_group_info]
GO
/****** Object:  Index [indicator_group_info_FKIndex1]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [indicator_group_info_FKIndex1] ON [dbo].[indicator_group_info]
GO
/****** Object:  Index [IFK_Indicator_Lang]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IFK_Indicator_Lang] ON [dbo].[indicator_group_info]
GO
/****** Object:  Index [IFK_Group_Info]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IFK_Group_Info] ON [dbo].[indicator_group_info]
GO
/****** Object:  Index [IX_indicator]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IX_indicator] ON [dbo].[indicator]
GO
/****** Object:  Index [indicator_FKIndex3]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [indicator_FKIndex3] ON [dbo].[indicator]
GO
/****** Object:  Index [indicator_FKIndex2]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [indicator_FKIndex2] ON [dbo].[indicator]
GO
/****** Object:  Index [indicator_FKIndex1]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [indicator_FKIndex1] ON [dbo].[indicator]
GO
/****** Object:  Index [IFK_Indicator_Objective]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IFK_Indicator_Objective] ON [dbo].[indicator]
GO
/****** Object:  Index [IFK_Indicator_Group]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IFK_Indicator_Group] ON [dbo].[indicator]
GO
/****** Object:  Index [IFK_Checklist_Indicator]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IFK_Checklist_Indicator] ON [dbo].[indicator]
GO
/****** Object:  Index [IFK_Country_Lang]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IFK_Country_Lang] ON [dbo].[country_info]
GO
/****** Object:  Index [IFK_Country_Info]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IFK_Country_Info] ON [dbo].[country_info]
GO
/****** Object:  Index [countryinfo_FKIndex2]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [countryinfo_FKIndex2] ON [dbo].[country_info]
GO
/****** Object:  Index [countryinfo_FKIndex1]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [countryinfo_FKIndex1] ON [dbo].[country_info]
GO
/****** Object:  Index [IX_country_indicator_find_country_indicator]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IX_country_indicator_find_country_indicator] ON [dbo].[country_indicator]
GO
/****** Object:  Index [IX_country_indicator_find_country_ind_by_quarter]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IX_country_indicator_find_country_ind_by_quarter] ON [dbo].[country_indicator]
GO
/****** Object:  Index [IFK_Indicator_Country]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IFK_Indicator_Country] ON [dbo].[country_indicator]
GO
/****** Object:  Index [IFK_Country_Indicator]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IFK_Country_Indicator] ON [dbo].[country_indicator]
GO
/****** Object:  Index [country_indicator_year]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [country_indicator_year] ON [dbo].[country_indicator]
GO
/****** Object:  Index [country_indicator_FKIndex2]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [country_indicator_FKIndex2] ON [dbo].[country_indicator]
GO
/****** Object:  Index [country_indicator_FKIndex1]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [country_indicator_FKIndex1] ON [dbo].[country_indicator]
GO
/****** Object:  Index [IX_country_code]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IX_country_code] ON [dbo].[country]
GO
/****** Object:  Index [IFK_Checklist_Question]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IFK_Checklist_Question] ON [dbo].[checklistquestion]
GO
/****** Object:  Index [checklistquestion_FKIndex1]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [checklistquestion_FKIndex1] ON [dbo].[checklistquestion]
GO
/****** Object:  Index [IFK_Question_Lang]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IFK_Question_Lang] ON [dbo].[checklist_question_info]
GO
/****** Object:  Index [IFK_Checklist_Question_Info]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IFK_Checklist_Question_Info] ON [dbo].[checklist_question_info]
GO
/****** Object:  Index [checklist_question_info_FKIndex2]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [checklist_question_info_FKIndex2] ON [dbo].[checklist_question_info]
GO
/****** Object:  Index [checklist_question_info_FKIndex1]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [checklist_question_info_FKIndex1] ON [dbo].[checklist_question_info]
GO
/****** Object:  Index [IX_CatYears]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP INDEX [IX_CatYears] ON [dbo].[CatYears]
GO
/****** Object:  Table [dbo].[VariablesAddons]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP TABLE [dbo].[VariablesAddons]
GO
/****** Object:  Table [dbo].[Variables]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP TABLE [dbo].[Variables]
GO
/****** Object:  Table [dbo].[question_value]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP TABLE [dbo].[question_value]
GO
/****** Object:  Table [dbo].[objective_info]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP TABLE [dbo].[objective_info]
GO
/****** Object:  Table [dbo].[objective]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP TABLE [dbo].[objective]
GO
/****** Object:  Table [dbo].[language]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP TABLE [dbo].[language]
GO
/****** Object:  Table [dbo].[indicatorgroup]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP TABLE [dbo].[indicatorgroup]
GO
/****** Object:  Table [dbo].[indicator_info]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP TABLE [dbo].[indicator_info]
GO
/****** Object:  Table [dbo].[indicator_group_info]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP TABLE [dbo].[indicator_group_info]
GO
/****** Object:  Table [dbo].[indicator]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP TABLE [dbo].[indicator]
GO
/****** Object:  Table [dbo].[country_objective]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP TABLE [dbo].[country_objective]
GO
/****** Object:  Table [dbo].[country_info]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP TABLE [dbo].[country_info]
GO
/****** Object:  Table [dbo].[country_indicator]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP TABLE [dbo].[country_indicator]
GO
/****** Object:  Table [dbo].[country]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP TABLE [dbo].[country]
GO
/****** Object:  Table [dbo].[checklistquestion]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP TABLE [dbo].[checklistquestion]
GO
/****** Object:  Table [dbo].[checklist_question_info]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP TABLE [dbo].[checklist_question_info]
GO
/****** Object:  Table [dbo].[checklist]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP TABLE [dbo].[checklist]
GO
/****** Object:  Table [dbo].[CatYears]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP TABLE [dbo].[CatYears]
GO
/****** Object:  Table [dbo].[CatIndicatorMode]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP TABLE [dbo].[CatIndicatorMode]
GO
/****** Object:  Table [dbo].[CatIndicatorInputType]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP TABLE [dbo].[CatIndicatorInputType]
GO
/****** Object:  Table [dbo].[CatIndicatorFrequency]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP TABLE [dbo].[CatIndicatorFrequency]
GO
/****** Object:  Table [dbo].[CatAnnualCalculation]    Script Date: 21/02/2019 05:37:00 a.m. ******/
DROP TABLE [dbo].[CatAnnualCalculation]
GO
USE [DashboardFMP]
GO
/****** Object:  Table [dbo].[CatAnnualCalculation]    Script Date: 21/02/2019 05:37:03 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatAnnualCalculation](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Instruction] [nvarchar](50) NULL,
	[orden] [int] NULL,
 CONSTRAINT [PK_CatAnnualCalculation] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CatIndicatorFrequency]    Script Date: 21/02/2019 05:37:04 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatIndicatorFrequency](
	[name] [nvarchar](5) NOT NULL,
	[orden] [int] NULL,
 CONSTRAINT [PK_CatIndicatorFrecuency_1] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CatIndicatorInputType]    Script Date: 21/02/2019 05:37:04 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatIndicatorInputType](
	[name] [nvarchar](10) NOT NULL,
	[orden] [int] NULL,
 CONSTRAINT [PK_CatIndicatorType] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CatIndicatorMode]    Script Date: 21/02/2019 05:37:04 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatIndicatorMode](
	[name] [nvarchar](10) NOT NULL,
	[orden] [int] NULL,
 CONSTRAINT [PK_CatIndicatorMode_1] PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CatYears]    Script Date: 21/02/2019 05:37:04 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CatYears](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[year_name] [int] NULL,
	[active] [bit] NULL,
 CONSTRAINT [PK_CatYears] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[checklist]    Script Date: 21/02/2019 05:37:04 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[checklist](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [varchar](10) NULL,
 CONSTRAINT [PK__checklis__3213E83F763F2BC9] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[checklist_question_info]    Script Date: 21/02/2019 05:37:04 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[checklist_question_info](
	[checklistquestion_id] [int] NOT NULL,
	[language_id] [int] NOT NULL,
	[name] [nvarchar](max) NULL,
	[description] [text] NULL,
 CONSTRAINT [PK__checklis__436F6AF18BE82B25] PRIMARY KEY CLUSTERED 
(
	[checklistquestion_id] ASC,
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[checklistquestion]    Script Date: 21/02/2019 05:37:04 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[checklistquestion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[checklist_id] [int] NOT NULL,
	[code] [varchar](10) NULL,
 CONSTRAINT [PK__checklis__3213E83F9FFD7EA4] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[country]    Script Date: 21/02/2019 05:37:04 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](6) NULL,
 CONSTRAINT [PK__country__3213E83F1996E971] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[country_indicator]    Script Date: 21/02/2019 05:37:04 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country_indicator](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[indicator_id] [int] NOT NULL,
	[country_id] [int] NOT NULL,
	[value] [decimal](18, 10) NULL,
	[quarter] [int] NOT NULL,
	[target] [decimal](18, 10) NULL,
	[inputyear] [date] NULL,
	[year_ind_country] [int] NULL,
	[active] [bit] NULL,
	[visible] [bit] NULL,
 CONSTRAINT [PK_country_indicator] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[country_info]    Script Date: 21/02/2019 05:37:04 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country_info](
	[country_id] [int] NOT NULL,
	[language_id] [int] NOT NULL,
	[name] [nvarchar](512) NOT NULL,
	[description] [nvarchar](max) NULL,
	[group] [bit] NULL,
	[code] [nvarchar](6) NULL,
 CONSTRAINT [PK__country___56881F3E42D882E2] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC,
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[country_objective]    Script Date: 21/02/2019 05:37:04 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[country_objective](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[objective_id] [int] NULL,
	[country_id] [int] NULL,
	[target] [decimal](18, 2) NULL,
	[year_obj_country] [int] NULL,
	[quarter] [int] NULL,
 CONSTRAINT [PK_country_objective] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[indicator]    Script Date: 21/02/2019 05:37:04 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[indicator](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[checklist_id] [int] NULL,
	[objective_id] [int] NOT NULL,
	[indicatorgroup_id] [int] NOT NULL,
	[code] [nvarchar](10) NULL,
	[mode] [nvarchar](7) NULL,
	[mode_id] [int] NULL,
	[frequency] [nvarchar](2) NULL,
	[Q1] [bit] NULL,
	[Q2] [bit] NULL,
	[Q3] [bit] NULL,
	[Q4] [bit] NULL,
	[anual_calculation_id] [int] NULL,
	[responsible] [int] NULL,
	[contact] [int] NULL,
	[inputtype] [nvarchar](9) NULL,
	[clave] [uniqueidentifier] NOT NULL CONSTRAINT [DF__indicator__clave__6CA31EA0]  DEFAULT (newid()),
	[clave_orig] [nvarchar](35) NULL,
	[orden] [int] NULL,
 CONSTRAINT [PK__indicato__3213E83FB2475CB0] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[indicator_group_info]    Script Date: 21/02/2019 05:37:04 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[indicator_group_info](
	[language_id] [int] NOT NULL,
	[indicatorgroup_id] [int] NOT NULL,
	[name] [nvarchar](512) NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK__indicato__2331EEA51BD2048F] PRIMARY KEY CLUSTERED 
(
	[indicatorgroup_id] ASC,
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[indicator_info]    Script Date: 21/02/2019 05:37:04 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[indicator_info](
	[language_id] [int] NOT NULL,
	[indicator_id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
	[code] [nvarchar](50) NULL,
	[short_] [nvarchar](150) NULL,
	[ind_num_visible] [nvarchar](50) NULL,
 CONSTRAINT [PK__indicato__9C7AA2A6A1D63257] PRIMARY KEY CLUSTERED 
(
	[language_id] ASC,
	[indicator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[indicatorgroup]    Script Date: 21/02/2019 05:37:04 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[indicatorgroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](3) NULL,
	[orden] [int] NULL,
 CONSTRAINT [PK__indicato__3213E83FA0626AC0] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[language]    Script Date: 21/02/2019 05:37:04 a.m. ******/
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
/****** Object:  Table [dbo].[objective]    Script Date: 21/02/2019 05:37:04 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[objective](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](4) NULL,
	[short_] [nvarchar](100) NULL,
	[orden] [int] NULL,
 CONSTRAINT [PK__objectiv__3213E83FFCEA25E9] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[objective_info]    Script Date: 21/02/2019 05:37:04 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[objective_info](
	[objective_id] [int] NOT NULL,
	[language_id] [int] NOT NULL,
	[short_name] [nvarchar](150) NULL,
	[name] [nvarchar](512) NULL,
	[text] [nvarchar](max) NULL,
	[code_info] [nvarchar](4) NULL,
 CONSTRAINT [PK__objectiv__0915A50DB74E031A] PRIMARY KEY CLUSTERED 
(
	[objective_id] ASC,
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[question_value]    Script Date: 21/02/2019 05:37:04 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[question_value](
	[country_indicator_country_id] [int] NOT NULL,
	[country_indicator_indicator_id] [int] NOT NULL,
	[checklistquestion_id] [int] NOT NULL,
	[year_ind_country] [int] NULL,
	[Q1value] [int] NULL,
	[Q1target] [int] NULL,
	[Q2value] [int] NULL,
	[Q2target] [int] NULL,
	[Q3value] [int] NULL,
	[Q3target] [int] NULL,
	[Q4value] [int] NULL,
	[Q4target] [int] NULL,
 CONSTRAINT [PK__question__05FEC92D14D4EF2E] PRIMARY KEY CLUSTERED 
(
	[country_indicator_country_id] ASC,
	[country_indicator_indicator_id] ASC,
	[checklistquestion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Variables]    Script Date: 21/02/2019 05:37:04 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Variables](
	[country] [nvarchar](255) NULL,
	[name] [nvarchar](255) NULL,
	[code] [nvarchar](255) NULL,
	[Q1_target] [float] NULL,
	[Q1] [nvarchar](255) NULL,
	[Q2_target] [float] NULL,
	[Q2] [float] NULL,
	[Q3_target] [nvarchar](255) NULL,
	[Q3] [float] NULL,
	[Q4_target] [float] NULL,
	[Q4] [float] NULL,
	[Actual_target] [float] NULL,
	[Actual] [float] NULL,
	[Q1_count] [nvarchar](255) NULL,
	[Q2_count] [nvarchar](255) NULL,
	[Q3_count] [nvarchar](255) NULL,
	[Q4_count] [nvarchar](255) NULL,
	[Actual_count] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VariablesAddons]    Script Date: 21/02/2019 05:37:04 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VariablesAddons](
	[name] [nvarchar](255) NULL,
	[code] [nvarchar](255) NULL,
	[Q1_target] [float] NULL,
	[Q1] [float] NULL,
	[Q2_target] [float] NULL,
	[Q2] [float] NULL,
	[Q3_target] [float] NULL,
	[Q3] [float] NULL,
	[Q4_target] [float] NULL,
	[Q4] [float] NULL,
	[Actual_target] [float] NULL,
	[Actual] [float] NULL,
	[Q1_count] [nvarchar](255) NULL,
	[Q2_count] [nvarchar](255) NULL,
	[Q3_count] [nvarchar](255) NULL,
	[Q4_count] [nvarchar](255) NULL,
	[Actual_count] [nvarchar](255) NULL
) ON [PRIMARY]

GO
/****** Object:  Index [IX_CatYears]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_CatYears] ON [dbo].[CatYears]
(
	[year_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [checklist_question_info_FKIndex1]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [checklist_question_info_FKIndex1] ON [dbo].[checklist_question_info]
(
	[checklistquestion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [checklist_question_info_FKIndex2]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [checklist_question_info_FKIndex2] ON [dbo].[checklist_question_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Checklist_Question_Info]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IFK_Checklist_Question_Info] ON [dbo].[checklist_question_info]
(
	[checklistquestion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Question_Lang]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IFK_Question_Lang] ON [dbo].[checklist_question_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [checklistquestion_FKIndex1]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [checklistquestion_FKIndex1] ON [dbo].[checklistquestion]
(
	[checklist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Checklist_Question]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IFK_Checklist_Question] ON [dbo].[checklistquestion]
(
	[checklist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_country_code]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_country_code] ON [dbo].[country]
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [country_indicator_FKIndex1]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [country_indicator_FKIndex1] ON [dbo].[country_indicator]
(
	[indicator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [country_indicator_FKIndex2]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [country_indicator_FKIndex2] ON [dbo].[country_indicator]
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [country_indicator_year]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [country_indicator_year] ON [dbo].[country_indicator]
(
	[inputyear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Country_Indicator]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IFK_Country_Indicator] ON [dbo].[country_indicator]
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Indicator_Country]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IFK_Indicator_Country] ON [dbo].[country_indicator]
(
	[indicator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_country_indicator_find_country_ind_by_quarter]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_country_indicator_find_country_ind_by_quarter] ON [dbo].[country_indicator]
(
	[country_id] ASC,
	[indicator_id] ASC,
	[year_ind_country] ASC,
	[quarter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_country_indicator_find_country_indicator]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_country_indicator_find_country_indicator] ON [dbo].[country_indicator]
(
	[country_id] ASC,
	[indicator_id] ASC,
	[year_ind_country] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [countryinfo_FKIndex1]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [countryinfo_FKIndex1] ON [dbo].[country_info]
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [countryinfo_FKIndex2]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [countryinfo_FKIndex2] ON [dbo].[country_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Country_Info]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IFK_Country_Info] ON [dbo].[country_info]
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Country_Lang]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IFK_Country_Lang] ON [dbo].[country_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Checklist_Indicator]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IFK_Checklist_Indicator] ON [dbo].[indicator]
(
	[checklist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Indicator_Group]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IFK_Indicator_Group] ON [dbo].[indicator]
(
	[indicatorgroup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Indicator_Objective]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IFK_Indicator_Objective] ON [dbo].[indicator]
(
	[objective_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_FKIndex1]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [indicator_FKIndex1] ON [dbo].[indicator]
(
	[indicatorgroup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_FKIndex2]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [indicator_FKIndex2] ON [dbo].[indicator]
(
	[objective_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_FKIndex3]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [indicator_FKIndex3] ON [dbo].[indicator]
(
	[checklist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_indicator]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_indicator] ON [dbo].[indicator]
(
	[clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Group_Info]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IFK_Group_Info] ON [dbo].[indicator_group_info]
(
	[indicatorgroup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Indicator_Lang]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IFK_Indicator_Lang] ON [dbo].[indicator_group_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_group_info_FKIndex1]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [indicator_group_info_FKIndex1] ON [dbo].[indicator_group_info]
(
	[indicatorgroup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_group_info_FKIndex2]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [indicator_group_info_FKIndex2] ON [dbo].[indicator_group_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Indicator_Info]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IFK_Indicator_Info] ON [dbo].[indicator_info]
(
	[indicator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Indicator_Lang]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IFK_Indicator_Lang] ON [dbo].[indicator_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_info_FKIndex1]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [indicator_info_FKIndex1] ON [dbo].[indicator_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_info_FKIndex2]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [indicator_info_FKIndex2] ON [dbo].[indicator_info]
(
	[indicator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_language_code]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_language_code] ON [dbo].[language]
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_language_name]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_language_name] ON [dbo].[language]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Objective_Info]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IFK_Objective_Info] ON [dbo].[objective_info]
(
	[objective_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Objective_Lang]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IFK_Objective_Lang] ON [dbo].[objective_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [objective_info_FKIndex1]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [objective_info_FKIndex1] ON [dbo].[objective_info]
(
	[objective_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [objective_info_FKIndex2]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [objective_info_FKIndex2] ON [dbo].[objective_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Country_Question]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IFK_Country_Question] ON [dbo].[question_value]
(
	[country_indicator_indicator_id] ASC,
	[country_indicator_country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Question_Checklist]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [IFK_Question_Checklist] ON [dbo].[question_value]
(
	[checklistquestion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [question_value_FKIndex1]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [question_value_FKIndex1] ON [dbo].[question_value]
(
	[country_indicator_indicator_id] ASC,
	[country_indicator_country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [question_value_FKIndex2]    Script Date: 21/02/2019 05:37:04 a.m. ******/
CREATE NONCLUSTERED INDEX [question_value_FKIndex2] ON [dbo].[question_value]
(
	[checklistquestion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[checklist_question_info]  WITH CHECK ADD  CONSTRAINT [FK__checklist__check__5E8A0973] FOREIGN KEY([checklistquestion_id])
REFERENCES [dbo].[checklistquestion] ([id])
GO
ALTER TABLE [dbo].[checklist_question_info] CHECK CONSTRAINT [FK__checklist__check__5E8A0973]
GO
ALTER TABLE [dbo].[checklist_question_info]  WITH CHECK ADD  CONSTRAINT [FK__checklist__langu__5F7E2DAC] FOREIGN KEY([language_id])
REFERENCES [dbo].[language] ([id])
GO
ALTER TABLE [dbo].[checklist_question_info] CHECK CONSTRAINT [FK__checklist__langu__5F7E2DAC]
GO
ALTER TABLE [dbo].[checklistquestion]  WITH CHECK ADD  CONSTRAINT [FK__checklist__check__607251E5] FOREIGN KEY([checklist_id])
REFERENCES [dbo].[checklist] ([id])
GO
ALTER TABLE [dbo].[checklistquestion] CHECK CONSTRAINT [FK__checklist__check__607251E5]
GO
ALTER TABLE [dbo].[country_indicator]  WITH CHECK ADD  CONSTRAINT [FK__country_i__count__2C3393D0] FOREIGN KEY([country_id])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[country_indicator] CHECK CONSTRAINT [FK__country_i__count__2C3393D0]
GO
ALTER TABLE [dbo].[country_indicator]  WITH CHECK ADD  CONSTRAINT [FK__country_i__indic__2D27B809] FOREIGN KEY([indicator_id])
REFERENCES [dbo].[indicator] ([id])
GO
ALTER TABLE [dbo].[country_indicator] CHECK CONSTRAINT [FK__country_i__indic__2D27B809]
GO
ALTER TABLE [dbo].[country_info]  WITH CHECK ADD  CONSTRAINT [FK__country_i__count__2E1BDC42] FOREIGN KEY([country_id])
REFERENCES [dbo].[country] ([id])
GO
ALTER TABLE [dbo].[country_info] CHECK CONSTRAINT [FK__country_i__count__2E1BDC42]
GO
ALTER TABLE [dbo].[country_info]  WITH CHECK ADD  CONSTRAINT [FK__country_i__langu__2F10007B] FOREIGN KEY([language_id])
REFERENCES [dbo].[language] ([id])
GO
ALTER TABLE [dbo].[country_info] CHECK CONSTRAINT [FK__country_i__langu__2F10007B]
GO
ALTER TABLE [dbo].[indicator_group_info]  WITH CHECK ADD  CONSTRAINT [FK__indicator__indic__32E0915F] FOREIGN KEY([indicatorgroup_id])
REFERENCES [dbo].[indicatorgroup] ([id])
GO
ALTER TABLE [dbo].[indicator_group_info] CHECK CONSTRAINT [FK__indicator__indic__32E0915F]
GO
ALTER TABLE [dbo].[indicator_group_info]  WITH CHECK ADD  CONSTRAINT [FK__indicator__langu__33D4B598] FOREIGN KEY([language_id])
REFERENCES [dbo].[language] ([id])
GO
ALTER TABLE [dbo].[indicator_group_info] CHECK CONSTRAINT [FK__indicator__langu__33D4B598]
GO
ALTER TABLE [dbo].[indicator_info]  WITH CHECK ADD  CONSTRAINT [FK__indicator__indic__34C8D9D1] FOREIGN KEY([indicator_id])
REFERENCES [dbo].[indicator] ([id])
GO
ALTER TABLE [dbo].[indicator_info] CHECK CONSTRAINT [FK__indicator__indic__34C8D9D1]
GO
ALTER TABLE [dbo].[indicator_info]  WITH CHECK ADD  CONSTRAINT [FK__indicator__langu__35BCFE0A] FOREIGN KEY([language_id])
REFERENCES [dbo].[language] ([id])
GO
ALTER TABLE [dbo].[indicator_info] CHECK CONSTRAINT [FK__indicator__langu__35BCFE0A]
GO
ALTER TABLE [dbo].[objective_info]  WITH CHECK ADD  CONSTRAINT [FK__objective__langu__36B12243] FOREIGN KEY([language_id])
REFERENCES [dbo].[language] ([id])
GO
ALTER TABLE [dbo].[objective_info] CHECK CONSTRAINT [FK__objective__langu__36B12243]
GO
ALTER TABLE [dbo].[objective_info]  WITH CHECK ADD  CONSTRAINT [FK__objective__objec__37A5467C] FOREIGN KEY([objective_id])
REFERENCES [dbo].[objective] ([id])
GO
ALTER TABLE [dbo].[objective_info] CHECK CONSTRAINT [FK__objective__objec__37A5467C]
GO
ALTER TABLE [dbo].[question_value]  WITH CHECK ADD  CONSTRAINT [FK__question___check__6DCC4D03] FOREIGN KEY([checklistquestion_id])
REFERENCES [dbo].[checklistquestion] ([id])
GO
ALTER TABLE [dbo].[question_value] CHECK CONSTRAINT [FK__question___check__6DCC4D03]
GO
ALTER TABLE [dbo].[country_indicator]  WITH CHECK ADD  CONSTRAINT [CK__country_i__quart__70A8B9AE] CHECK  (([quarter]=(0) OR [quarter]=(4) OR [quarter]=(3) OR [quarter]=(2) OR [quarter]=(1)))
GO
ALTER TABLE [dbo].[country_indicator] CHECK CONSTRAINT [CK__country_i__quart__70A8B9AE]
GO
ALTER TABLE [dbo].[indicator]  WITH CHECK ADD  CONSTRAINT [CK__indicator__frequ__3C69FB99] CHECK  (([frequency]='BQ' OR [frequency]='LQ' OR [frequency]='EQ'))
GO
ALTER TABLE [dbo].[indicator] CHECK CONSTRAINT [CK__indicator__frequ__3C69FB99]
GO
ALTER TABLE [dbo].[indicator]  WITH CHECK ADD  CONSTRAINT [CK__indicator__input__3D5E1FD2] CHECK  (([inputtype]='target' OR [inputtype]='fyi' OR [inputtype]='checklist'))
GO
ALTER TABLE [dbo].[indicator] CHECK CONSTRAINT [CK__indicator__input__3D5E1FD2]
GO
ALTER TABLE [dbo].[indicator]  WITH CHECK ADD  CONSTRAINT [CK__indicator__mode__3E52440B] CHECK  (([mode]='value' OR [mode]='percent'))
GO
ALTER TABLE [dbo].[indicator] CHECK CONSTRAINT [CK__indicator__mode__3E52440B]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Format del archivo Excel' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'indicator', @level2type=N'COLUMN',@level2name=N'mode_id'
GO
USE [master]
GO
ALTER DATABASE [DashboardFMP] SET  READ_WRITE 
GO
