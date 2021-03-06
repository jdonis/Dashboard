USE [DashboardFMP]
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__indicator__mode__3E52440B]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator] DROP CONSTRAINT [CK__indicator__mode__3E52440B]
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__indicator__input__3D5E1FD2]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator] DROP CONSTRAINT [CK__indicator__input__3D5E1FD2]
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__indicator__frequ__3C69FB99]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator] DROP CONSTRAINT [CK__indicator__frequ__3C69FB99]
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__country_i__quart__70A8B9AE]') AND parent_object_id = OBJECT_ID(N'[dbo].[country_indicator]'))
ALTER TABLE [dbo].[country_indicator] DROP CONSTRAINT [CK__country_i__quart__70A8B9AE]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__question___check__6DCC4D03]') AND parent_object_id = OBJECT_ID(N'[dbo].[question_value]'))
ALTER TABLE [dbo].[question_value] DROP CONSTRAINT [FK__question___check__6DCC4D03]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__objective__objec__37A5467C]') AND parent_object_id = OBJECT_ID(N'[dbo].[objective_info]'))
ALTER TABLE [dbo].[objective_info] DROP CONSTRAINT [FK__objective__objec__37A5467C]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__objective__langu__36B12243]') AND parent_object_id = OBJECT_ID(N'[dbo].[objective_info]'))
ALTER TABLE [dbo].[objective_info] DROP CONSTRAINT [FK__objective__langu__36B12243]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__indicator__langu__35BCFE0A]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator_info]'))
ALTER TABLE [dbo].[indicator_info] DROP CONSTRAINT [FK__indicator__langu__35BCFE0A]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__indicator__indic__34C8D9D1]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator_info]'))
ALTER TABLE [dbo].[indicator_info] DROP CONSTRAINT [FK__indicator__indic__34C8D9D1]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__indicator__langu__33D4B598]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator_group_info]'))
ALTER TABLE [dbo].[indicator_group_info] DROP CONSTRAINT [FK__indicator__langu__33D4B598]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__indicator__indic__32E0915F]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator_group_info]'))
ALTER TABLE [dbo].[indicator_group_info] DROP CONSTRAINT [FK__indicator__indic__32E0915F]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__indicator__objec__31EC6D26]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator] DROP CONSTRAINT [FK__indicator__objec__31EC6D26]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__indicator__indic__30F848ED]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator] DROP CONSTRAINT [FK__indicator__indic__30F848ED]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__indicator__check__300424B4]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator]'))
ALTER TABLE [dbo].[indicator] DROP CONSTRAINT [FK__indicator__check__300424B4]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__country_i__langu__2F10007B]') AND parent_object_id = OBJECT_ID(N'[dbo].[country_info]'))
ALTER TABLE [dbo].[country_info] DROP CONSTRAINT [FK__country_i__langu__2F10007B]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__country_i__count__2E1BDC42]') AND parent_object_id = OBJECT_ID(N'[dbo].[country_info]'))
ALTER TABLE [dbo].[country_info] DROP CONSTRAINT [FK__country_i__count__2E1BDC42]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__country_i__indic__2D27B809]') AND parent_object_id = OBJECT_ID(N'[dbo].[country_indicator]'))
ALTER TABLE [dbo].[country_indicator] DROP CONSTRAINT [FK__country_i__indic__2D27B809]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__country_i__count__2C3393D0]') AND parent_object_id = OBJECT_ID(N'[dbo].[country_indicator]'))
ALTER TABLE [dbo].[country_indicator] DROP CONSTRAINT [FK__country_i__count__2C3393D0]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__checklist__check__607251E5]') AND parent_object_id = OBJECT_ID(N'[dbo].[checklistquestion]'))
ALTER TABLE [dbo].[checklistquestion] DROP CONSTRAINT [FK__checklist__check__607251E5]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__checklist__langu__5F7E2DAC]') AND parent_object_id = OBJECT_ID(N'[dbo].[checklist_question_info]'))
ALTER TABLE [dbo].[checklist_question_info] DROP CONSTRAINT [FK__checklist__langu__5F7E2DAC]
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__checklist__check__5E8A0973]') AND parent_object_id = OBJECT_ID(N'[dbo].[checklist_question_info]'))
ALTER TABLE [dbo].[checklist_question_info] DROP CONSTRAINT [FK__checklist__check__5E8A0973]
GO
/****** Object:  Index [question_value_FKIndex2]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[question_value]') AND name = N'question_value_FKIndex2')
DROP INDEX [question_value_FKIndex2] ON [dbo].[question_value]
GO
/****** Object:  Index [question_value_FKIndex1]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[question_value]') AND name = N'question_value_FKIndex1')
DROP INDEX [question_value_FKIndex1] ON [dbo].[question_value]
GO
/****** Object:  Index [IFK_Question_Checklist]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[question_value]') AND name = N'IFK_Question_Checklist')
DROP INDEX [IFK_Question_Checklist] ON [dbo].[question_value]
GO
/****** Object:  Index [IFK_Country_Question]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[question_value]') AND name = N'IFK_Country_Question')
DROP INDEX [IFK_Country_Question] ON [dbo].[question_value]
GO
/****** Object:  Index [objective_info_FKIndex2]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[objective_info]') AND name = N'objective_info_FKIndex2')
DROP INDEX [objective_info_FKIndex2] ON [dbo].[objective_info]
GO
/****** Object:  Index [objective_info_FKIndex1]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[objective_info]') AND name = N'objective_info_FKIndex1')
DROP INDEX [objective_info_FKIndex1] ON [dbo].[objective_info]
GO
/****** Object:  Index [IFK_Objective_Lang]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[objective_info]') AND name = N'IFK_Objective_Lang')
DROP INDEX [IFK_Objective_Lang] ON [dbo].[objective_info]
GO
/****** Object:  Index [IFK_Objective_Info]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[objective_info]') AND name = N'IFK_Objective_Info')
DROP INDEX [IFK_Objective_Info] ON [dbo].[objective_info]
GO
/****** Object:  Index [indicator_info_FKIndex2]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator_info]') AND name = N'indicator_info_FKIndex2')
DROP INDEX [indicator_info_FKIndex2] ON [dbo].[indicator_info]
GO
/****** Object:  Index [indicator_info_FKIndex1]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator_info]') AND name = N'indicator_info_FKIndex1')
DROP INDEX [indicator_info_FKIndex1] ON [dbo].[indicator_info]
GO
/****** Object:  Index [IFK_Indicator_Lang]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator_info]') AND name = N'IFK_Indicator_Lang')
DROP INDEX [IFK_Indicator_Lang] ON [dbo].[indicator_info]
GO
/****** Object:  Index [IFK_Indicator_Info]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator_info]') AND name = N'IFK_Indicator_Info')
DROP INDEX [IFK_Indicator_Info] ON [dbo].[indicator_info]
GO
/****** Object:  Index [indicator_group_info_FKIndex2]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator_group_info]') AND name = N'indicator_group_info_FKIndex2')
DROP INDEX [indicator_group_info_FKIndex2] ON [dbo].[indicator_group_info]
GO
/****** Object:  Index [indicator_group_info_FKIndex1]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator_group_info]') AND name = N'indicator_group_info_FKIndex1')
DROP INDEX [indicator_group_info_FKIndex1] ON [dbo].[indicator_group_info]
GO
/****** Object:  Index [IFK_Indicator_Lang]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator_group_info]') AND name = N'IFK_Indicator_Lang')
DROP INDEX [IFK_Indicator_Lang] ON [dbo].[indicator_group_info]
GO
/****** Object:  Index [IFK_Group_Info]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator_group_info]') AND name = N'IFK_Group_Info')
DROP INDEX [IFK_Group_Info] ON [dbo].[indicator_group_info]
GO
/****** Object:  Index [IX_indicator]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator]') AND name = N'IX_indicator')
DROP INDEX [IX_indicator] ON [dbo].[indicator]
GO
/****** Object:  Index [indicator_FKIndex3]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator]') AND name = N'indicator_FKIndex3')
DROP INDEX [indicator_FKIndex3] ON [dbo].[indicator]
GO
/****** Object:  Index [indicator_FKIndex2]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator]') AND name = N'indicator_FKIndex2')
DROP INDEX [indicator_FKIndex2] ON [dbo].[indicator]
GO
/****** Object:  Index [indicator_FKIndex1]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator]') AND name = N'indicator_FKIndex1')
DROP INDEX [indicator_FKIndex1] ON [dbo].[indicator]
GO
/****** Object:  Index [IFK_Indicator_Objective]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator]') AND name = N'IFK_Indicator_Objective')
DROP INDEX [IFK_Indicator_Objective] ON [dbo].[indicator]
GO
/****** Object:  Index [IFK_Indicator_Group]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator]') AND name = N'IFK_Indicator_Group')
DROP INDEX [IFK_Indicator_Group] ON [dbo].[indicator]
GO
/****** Object:  Index [IFK_Checklist_Indicator]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator]') AND name = N'IFK_Checklist_Indicator')
DROP INDEX [IFK_Checklist_Indicator] ON [dbo].[indicator]
GO
/****** Object:  Index [IFK_Country_Lang]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[country_info]') AND name = N'IFK_Country_Lang')
DROP INDEX [IFK_Country_Lang] ON [dbo].[country_info]
GO
/****** Object:  Index [IFK_Country_Info]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[country_info]') AND name = N'IFK_Country_Info')
DROP INDEX [IFK_Country_Info] ON [dbo].[country_info]
GO
/****** Object:  Index [countryinfo_FKIndex2]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[country_info]') AND name = N'countryinfo_FKIndex2')
DROP INDEX [countryinfo_FKIndex2] ON [dbo].[country_info]
GO
/****** Object:  Index [countryinfo_FKIndex1]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[country_info]') AND name = N'countryinfo_FKIndex1')
DROP INDEX [countryinfo_FKIndex1] ON [dbo].[country_info]
GO
/****** Object:  Index [IFK_Indicator_Country]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[country_indicator]') AND name = N'IFK_Indicator_Country')
DROP INDEX [IFK_Indicator_Country] ON [dbo].[country_indicator]
GO
/****** Object:  Index [IFK_Country_Indicator]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[country_indicator]') AND name = N'IFK_Country_Indicator')
DROP INDEX [IFK_Country_Indicator] ON [dbo].[country_indicator]
GO
/****** Object:  Index [country_indicator_year]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[country_indicator]') AND name = N'country_indicator_year')
DROP INDEX [country_indicator_year] ON [dbo].[country_indicator]
GO
/****** Object:  Index [country_indicator_FKIndex2]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[country_indicator]') AND name = N'country_indicator_FKIndex2')
DROP INDEX [country_indicator_FKIndex2] ON [dbo].[country_indicator]
GO
/****** Object:  Index [country_indicator_FKIndex1]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[country_indicator]') AND name = N'country_indicator_FKIndex1')
DROP INDEX [country_indicator_FKIndex1] ON [dbo].[country_indicator]
GO
/****** Object:  Index [IFK_Checklist_Question]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[checklistquestion]') AND name = N'IFK_Checklist_Question')
DROP INDEX [IFK_Checklist_Question] ON [dbo].[checklistquestion]
GO
/****** Object:  Index [checklistquestion_FKIndex1]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[checklistquestion]') AND name = N'checklistquestion_FKIndex1')
DROP INDEX [checklistquestion_FKIndex1] ON [dbo].[checklistquestion]
GO
/****** Object:  Index [IFK_Question_Lang]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[checklist_question_info]') AND name = N'IFK_Question_Lang')
DROP INDEX [IFK_Question_Lang] ON [dbo].[checklist_question_info]
GO
/****** Object:  Index [IFK_Checklist_Question_Info]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[checklist_question_info]') AND name = N'IFK_Checklist_Question_Info')
DROP INDEX [IFK_Checklist_Question_Info] ON [dbo].[checklist_question_info]
GO
/****** Object:  Index [checklist_question_info_FKIndex2]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[checklist_question_info]') AND name = N'checklist_question_info_FKIndex2')
DROP INDEX [checklist_question_info_FKIndex2] ON [dbo].[checklist_question_info]
GO
/****** Object:  Index [checklist_question_info_FKIndex1]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[checklist_question_info]') AND name = N'checklist_question_info_FKIndex1')
DROP INDEX [checklist_question_info_FKIndex1] ON [dbo].[checklist_question_info]
GO
/****** Object:  Table [dbo].[VariablesAddons]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VariablesAddons]') AND type in (N'U'))
DROP TABLE [dbo].[VariablesAddons]
GO
/****** Object:  Table [dbo].[Variables]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Variables]') AND type in (N'U'))
DROP TABLE [dbo].[Variables]
GO
/****** Object:  Table [dbo].[question_value]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[question_value]') AND type in (N'U'))
DROP TABLE [dbo].[question_value]
GO
/****** Object:  Table [dbo].[objective_info]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[objective_info]') AND type in (N'U'))
DROP TABLE [dbo].[objective_info]
GO
/****** Object:  Table [dbo].[objective]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[objective]') AND type in (N'U'))
DROP TABLE [dbo].[objective]
GO
/****** Object:  Table [dbo].[language]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[language]') AND type in (N'U'))
DROP TABLE [dbo].[language]
GO
/****** Object:  Table [dbo].[indicatorgroup]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[indicatorgroup]') AND type in (N'U'))
DROP TABLE [dbo].[indicatorgroup]
GO
/****** Object:  Table [dbo].[indicator_info]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[indicator_info]') AND type in (N'U'))
DROP TABLE [dbo].[indicator_info]
GO
/****** Object:  Table [dbo].[indicator_group_info]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[indicator_group_info]') AND type in (N'U'))
DROP TABLE [dbo].[indicator_group_info]
GO
/****** Object:  Table [dbo].[indicator]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[indicator]') AND type in (N'U'))
DROP TABLE [dbo].[indicator]
GO
/****** Object:  Table [dbo].[country_objective]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[country_objective]') AND type in (N'U'))
DROP TABLE [dbo].[country_objective]
GO
/****** Object:  Table [dbo].[country_info]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[country_info]') AND type in (N'U'))
DROP TABLE [dbo].[country_info]
GO
/****** Object:  Table [dbo].[country_indicator]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[country_indicator]') AND type in (N'U'))
DROP TABLE [dbo].[country_indicator]
GO
/****** Object:  Table [dbo].[country]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[country]') AND type in (N'U'))
DROP TABLE [dbo].[country]
GO
/****** Object:  Table [dbo].[checklistquestion]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[checklistquestion]') AND type in (N'U'))
DROP TABLE [dbo].[checklistquestion]
GO
/****** Object:  Table [dbo].[checklist_question_info]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[checklist_question_info]') AND type in (N'U'))
DROP TABLE [dbo].[checklist_question_info]
GO
/****** Object:  Table [dbo].[checklist]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[checklist]') AND type in (N'U'))
DROP TABLE [dbo].[checklist]
GO
USE [master]
GO
/****** Object:  Database [DashboardFMP]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF  EXISTS (SELECT name FROM sys.databases WHERE name = N'DashboardFMP')
DROP DATABASE [DashboardFMP]
GO
/****** Object:  Database [DashboardFMP]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'DashboardFMP')
BEGIN
CREATE DATABASE [DashboardFMP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DashboardFMP _new', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DashboardFMP_nueva_new.mdf' , SIZE = 12288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DashboardFMP _new_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DashboardFMP_nueva_new_log.ldf' , SIZE = 4224KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [DashboardFMP] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DashboardFMP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DashboardFMP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DashboardFMP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DashboardFMP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DashboardFMP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DashboardFMP] SET ARITHABORT OFF 
GO
ALTER DATABASE [DashboardFMP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DashboardFMP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DashboardFMP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DashboardFMP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DashboardFMP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DashboardFMP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DashboardFMP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DashboardFMP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DashboardFMP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DashboardFMP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DashboardFMP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DashboardFMP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DashboardFMP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DashboardFMP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DashboardFMP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DashboardFMP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DashboardFMP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DashboardFMP] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DashboardFMP] SET  MULTI_USER 
GO
ALTER DATABASE [DashboardFMP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DashboardFMP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DashboardFMP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DashboardFMP] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [DashboardFMP] SET DELAYED_DURABILITY = DISABLED 
GO
USE [DashboardFMP]
GO
/****** Object:  Table [dbo].[checklist]    Script Date: 21/08/2018 01:07:48 p.m. ******/
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
/****** Object:  Table [dbo].[checklist_question_info]    Script Date: 21/08/2018 01:07:48 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[checklist_question_info]') AND type in (N'U'))
BEGIN
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
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[checklistquestion]    Script Date: 21/08/2018 01:07:48 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[checklistquestion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[checklistquestion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[checklist_id] [int] NOT NULL,
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
/****** Object:  Table [dbo].[country]    Script Date: 21/08/2018 01:07:48 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[country]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[country](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](6) NULL,
 CONSTRAINT [PK__country__3213E83F1996E971] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[country_indicator]    Script Date: 21/08/2018 01:07:48 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[country_indicator]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[country_indicator](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[indicator_id] [int] NOT NULL,
	[country_id] [int] NOT NULL,
	[value] [decimal](18, 10) NULL,
	[quarter] [int] NOT NULL,
	[target] [decimal](18, 10) NULL,
	[inputyear] [date] NULL,
	[year_ind_country] [int] NULL,
 CONSTRAINT [PK_country_indicator] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[country_info]    Script Date: 21/08/2018 01:07:48 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[country_info]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[country_objective]    Script Date: 21/08/2018 01:07:48 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[country_objective]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[indicator]    Script Date: 21/08/2018 01:07:48 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[indicator]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[indicator](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[checklist_id] [int] NULL,
	[objective_id] [int] NOT NULL,
	[indicatorgroup_id] [int] NOT NULL,
	[code] [nvarchar](10) NULL,
	[mode] [nvarchar](7) NULL,
	[frequency] [nvarchar](2) NULL,
	[responsible] [int] NULL,
	[contact] [int] NULL,
	[inputtype] [nvarchar](6) NULL,
	[clave] [nvarchar](35) NULL,
 CONSTRAINT [PK__indicato__3213E83FB2475CB0] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[indicator_group_info]    Script Date: 21/08/2018 01:07:48 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[indicator_group_info]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[indicator_info]    Script Date: 21/08/2018 01:07:48 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[indicator_info]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[indicator_info](
	[language_id] [int] NOT NULL,
	[indicator_id] [int] NOT NULL,
	[name] [nvarchar](255) NULL,
	[code] [nvarchar](50) NULL,
	[short_] [nvarchar](150) NULL,
 CONSTRAINT [PK__indicato__9C7AA2A6A1D63257] PRIMARY KEY CLUSTERED 
(
	[language_id] ASC,
	[indicator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[indicatorgroup]    Script Date: 21/08/2018 01:07:48 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[indicatorgroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[indicatorgroup](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](3) NULL,
 CONSTRAINT [PK__indicato__3213E83FA0626AC0] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[language]    Script Date: 21/08/2018 01:07:48 p.m. ******/
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
/****** Object:  Table [dbo].[objective]    Script Date: 21/08/2018 01:07:48 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[objective]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[objective](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](4) NULL,
	[short_] [nvarchar](100) NULL,
 CONSTRAINT [PK__objectiv__3213E83FFCEA25E9] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[objective_info]    Script Date: 21/08/2018 01:07:48 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[objective_info]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[objective_info](
	[objective_id] [int] NOT NULL,
	[language_id] [int] NOT NULL,
	[short_] [nvarchar](150) NULL,
	[name] [nvarchar](512) NULL,
	[text] [nvarchar](max) NULL,
	[code] [nvarchar](4) NULL,
 CONSTRAINT [PK__objectiv__0915A50DB74E031A] PRIMARY KEY CLUSTERED 
(
	[objective_id] ASC,
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[question_value]    Script Date: 21/08/2018 01:07:48 p.m. ******/
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
/****** Object:  Table [dbo].[Variables]    Script Date: 21/08/2018 01:07:48 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Variables]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Table [dbo].[VariablesAddons]    Script Date: 21/08/2018 01:07:48 p.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VariablesAddons]') AND type in (N'U'))
BEGIN
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
END
GO
/****** Object:  Index [checklist_question_info_FKIndex1]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[checklist_question_info]') AND name = N'checklist_question_info_FKIndex1')
CREATE NONCLUSTERED INDEX [checklist_question_info_FKIndex1] ON [dbo].[checklist_question_info]
(
	[checklistquestion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [checklist_question_info_FKIndex2]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[checklist_question_info]') AND name = N'checklist_question_info_FKIndex2')
CREATE NONCLUSTERED INDEX [checklist_question_info_FKIndex2] ON [dbo].[checklist_question_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Checklist_Question_Info]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[checklist_question_info]') AND name = N'IFK_Checklist_Question_Info')
CREATE NONCLUSTERED INDEX [IFK_Checklist_Question_Info] ON [dbo].[checklist_question_info]
(
	[checklistquestion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Question_Lang]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[checklist_question_info]') AND name = N'IFK_Question_Lang')
CREATE NONCLUSTERED INDEX [IFK_Question_Lang] ON [dbo].[checklist_question_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [checklistquestion_FKIndex1]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[checklistquestion]') AND name = N'checklistquestion_FKIndex1')
CREATE NONCLUSTERED INDEX [checklistquestion_FKIndex1] ON [dbo].[checklistquestion]
(
	[checklist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Checklist_Question]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[checklistquestion]') AND name = N'IFK_Checklist_Question')
CREATE NONCLUSTERED INDEX [IFK_Checklist_Question] ON [dbo].[checklistquestion]
(
	[checklist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [country_indicator_FKIndex1]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[country_indicator]') AND name = N'country_indicator_FKIndex1')
CREATE NONCLUSTERED INDEX [country_indicator_FKIndex1] ON [dbo].[country_indicator]
(
	[indicator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [country_indicator_FKIndex2]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[country_indicator]') AND name = N'country_indicator_FKIndex2')
CREATE NONCLUSTERED INDEX [country_indicator_FKIndex2] ON [dbo].[country_indicator]
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [country_indicator_year]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[country_indicator]') AND name = N'country_indicator_year')
CREATE NONCLUSTERED INDEX [country_indicator_year] ON [dbo].[country_indicator]
(
	[inputyear] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Country_Indicator]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[country_indicator]') AND name = N'IFK_Country_Indicator')
CREATE NONCLUSTERED INDEX [IFK_Country_Indicator] ON [dbo].[country_indicator]
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Indicator_Country]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[country_indicator]') AND name = N'IFK_Indicator_Country')
CREATE NONCLUSTERED INDEX [IFK_Indicator_Country] ON [dbo].[country_indicator]
(
	[indicator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [countryinfo_FKIndex1]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[country_info]') AND name = N'countryinfo_FKIndex1')
CREATE NONCLUSTERED INDEX [countryinfo_FKIndex1] ON [dbo].[country_info]
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [countryinfo_FKIndex2]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[country_info]') AND name = N'countryinfo_FKIndex2')
CREATE NONCLUSTERED INDEX [countryinfo_FKIndex2] ON [dbo].[country_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Country_Info]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[country_info]') AND name = N'IFK_Country_Info')
CREATE NONCLUSTERED INDEX [IFK_Country_Info] ON [dbo].[country_info]
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Country_Lang]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[country_info]') AND name = N'IFK_Country_Lang')
CREATE NONCLUSTERED INDEX [IFK_Country_Lang] ON [dbo].[country_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Checklist_Indicator]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator]') AND name = N'IFK_Checklist_Indicator')
CREATE NONCLUSTERED INDEX [IFK_Checklist_Indicator] ON [dbo].[indicator]
(
	[checklist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Indicator_Group]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator]') AND name = N'IFK_Indicator_Group')
CREATE NONCLUSTERED INDEX [IFK_Indicator_Group] ON [dbo].[indicator]
(
	[indicatorgroup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Indicator_Objective]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator]') AND name = N'IFK_Indicator_Objective')
CREATE NONCLUSTERED INDEX [IFK_Indicator_Objective] ON [dbo].[indicator]
(
	[objective_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_FKIndex1]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator]') AND name = N'indicator_FKIndex1')
CREATE NONCLUSTERED INDEX [indicator_FKIndex1] ON [dbo].[indicator]
(
	[indicatorgroup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_FKIndex2]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator]') AND name = N'indicator_FKIndex2')
CREATE NONCLUSTERED INDEX [indicator_FKIndex2] ON [dbo].[indicator]
(
	[objective_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_FKIndex3]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator]') AND name = N'indicator_FKIndex3')
CREATE NONCLUSTERED INDEX [indicator_FKIndex3] ON [dbo].[indicator]
(
	[checklist_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_indicator]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator]') AND name = N'IX_indicator')
CREATE UNIQUE NONCLUSTERED INDEX [IX_indicator] ON [dbo].[indicator]
(
	[clave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Group_Info]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator_group_info]') AND name = N'IFK_Group_Info')
CREATE NONCLUSTERED INDEX [IFK_Group_Info] ON [dbo].[indicator_group_info]
(
	[indicatorgroup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Indicator_Lang]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator_group_info]') AND name = N'IFK_Indicator_Lang')
CREATE NONCLUSTERED INDEX [IFK_Indicator_Lang] ON [dbo].[indicator_group_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_group_info_FKIndex1]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator_group_info]') AND name = N'indicator_group_info_FKIndex1')
CREATE NONCLUSTERED INDEX [indicator_group_info_FKIndex1] ON [dbo].[indicator_group_info]
(
	[indicatorgroup_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_group_info_FKIndex2]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator_group_info]') AND name = N'indicator_group_info_FKIndex2')
CREATE NONCLUSTERED INDEX [indicator_group_info_FKIndex2] ON [dbo].[indicator_group_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Indicator_Info]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator_info]') AND name = N'IFK_Indicator_Info')
CREATE NONCLUSTERED INDEX [IFK_Indicator_Info] ON [dbo].[indicator_info]
(
	[indicator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Indicator_Lang]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator_info]') AND name = N'IFK_Indicator_Lang')
CREATE NONCLUSTERED INDEX [IFK_Indicator_Lang] ON [dbo].[indicator_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_info_FKIndex1]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator_info]') AND name = N'indicator_info_FKIndex1')
CREATE NONCLUSTERED INDEX [indicator_info_FKIndex1] ON [dbo].[indicator_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [indicator_info_FKIndex2]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[indicator_info]') AND name = N'indicator_info_FKIndex2')
CREATE NONCLUSTERED INDEX [indicator_info_FKIndex2] ON [dbo].[indicator_info]
(
	[indicator_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Objective_Info]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[objective_info]') AND name = N'IFK_Objective_Info')
CREATE NONCLUSTERED INDEX [IFK_Objective_Info] ON [dbo].[objective_info]
(
	[objective_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Objective_Lang]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[objective_info]') AND name = N'IFK_Objective_Lang')
CREATE NONCLUSTERED INDEX [IFK_Objective_Lang] ON [dbo].[objective_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [objective_info_FKIndex1]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[objective_info]') AND name = N'objective_info_FKIndex1')
CREATE NONCLUSTERED INDEX [objective_info_FKIndex1] ON [dbo].[objective_info]
(
	[objective_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [objective_info_FKIndex2]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[objective_info]') AND name = N'objective_info_FKIndex2')
CREATE NONCLUSTERED INDEX [objective_info_FKIndex2] ON [dbo].[objective_info]
(
	[language_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Country_Question]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[question_value]') AND name = N'IFK_Country_Question')
CREATE NONCLUSTERED INDEX [IFK_Country_Question] ON [dbo].[question_value]
(
	[country_indicator_indicator_id] ASC,
	[country_indicator_country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IFK_Question_Checklist]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[question_value]') AND name = N'IFK_Question_Checklist')
CREATE NONCLUSTERED INDEX [IFK_Question_Checklist] ON [dbo].[question_value]
(
	[checklistquestion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [question_value_FKIndex1]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[question_value]') AND name = N'question_value_FKIndex1')
CREATE NONCLUSTERED INDEX [question_value_FKIndex1] ON [dbo].[question_value]
(
	[country_indicator_indicator_id] ASC,
	[country_indicator_country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [question_value_FKIndex2]    Script Date: 21/08/2018 01:07:48 p.m. ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[question_value]') AND name = N'question_value_FKIndex2')
CREATE NONCLUSTERED INDEX [question_value_FKIndex2] ON [dbo].[question_value]
(
	[checklistquestion_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__checklist__check__5E8A0973]') AND parent_object_id = OBJECT_ID(N'[dbo].[checklist_question_info]'))
ALTER TABLE [dbo].[checklist_question_info]  WITH CHECK ADD FOREIGN KEY([checklistquestion_id])
REFERENCES [dbo].[checklistquestion] ([id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__checklist__langu__5F7E2DAC]') AND parent_object_id = OBJECT_ID(N'[dbo].[checklist_question_info]'))
ALTER TABLE [dbo].[checklist_question_info]  WITH CHECK ADD FOREIGN KEY([language_id])
REFERENCES [dbo].[language] ([id])
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__checklist__check__607251E5]') AND parent_object_id = OBJECT_ID(N'[dbo].[checklistquestion]'))
ALTER TABLE [dbo].[checklistquestion]  WITH CHECK ADD FOREIGN KEY([checklist_id])
REFERENCES [dbo].[checklist] ([id])
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
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__country_i__count__2E1BDC42]') AND parent_object_id = OBJECT_ID(N'[dbo].[country_info]'))
ALTER TABLE [dbo].[country_info]  WITH CHECK ADD  CONSTRAINT [FK__country_i__count__2E1BDC42] FOREIGN KEY([country_id])
REFERENCES [dbo].[country] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__country_i__count__2E1BDC42]') AND parent_object_id = OBJECT_ID(N'[dbo].[country_info]'))
ALTER TABLE [dbo].[country_info] CHECK CONSTRAINT [FK__country_i__count__2E1BDC42]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__country_i__langu__2F10007B]') AND parent_object_id = OBJECT_ID(N'[dbo].[country_info]'))
ALTER TABLE [dbo].[country_info]  WITH CHECK ADD  CONSTRAINT [FK__country_i__langu__2F10007B] FOREIGN KEY([language_id])
REFERENCES [dbo].[language] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__country_i__langu__2F10007B]') AND parent_object_id = OBJECT_ID(N'[dbo].[country_info]'))
ALTER TABLE [dbo].[country_info] CHECK CONSTRAINT [FK__country_i__langu__2F10007B]
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
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__indicator__indic__32E0915F]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator_group_info]'))
ALTER TABLE [dbo].[indicator_group_info]  WITH CHECK ADD  CONSTRAINT [FK__indicator__indic__32E0915F] FOREIGN KEY([indicatorgroup_id])
REFERENCES [dbo].[indicatorgroup] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__indicator__indic__32E0915F]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator_group_info]'))
ALTER TABLE [dbo].[indicator_group_info] CHECK CONSTRAINT [FK__indicator__indic__32E0915F]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__indicator__langu__33D4B598]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator_group_info]'))
ALTER TABLE [dbo].[indicator_group_info]  WITH CHECK ADD  CONSTRAINT [FK__indicator__langu__33D4B598] FOREIGN KEY([language_id])
REFERENCES [dbo].[language] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__indicator__langu__33D4B598]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator_group_info]'))
ALTER TABLE [dbo].[indicator_group_info] CHECK CONSTRAINT [FK__indicator__langu__33D4B598]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__indicator__indic__34C8D9D1]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator_info]'))
ALTER TABLE [dbo].[indicator_info]  WITH CHECK ADD  CONSTRAINT [FK__indicator__indic__34C8D9D1] FOREIGN KEY([indicator_id])
REFERENCES [dbo].[indicator] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__indicator__indic__34C8D9D1]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator_info]'))
ALTER TABLE [dbo].[indicator_info] CHECK CONSTRAINT [FK__indicator__indic__34C8D9D1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__indicator__langu__35BCFE0A]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator_info]'))
ALTER TABLE [dbo].[indicator_info]  WITH CHECK ADD  CONSTRAINT [FK__indicator__langu__35BCFE0A] FOREIGN KEY([language_id])
REFERENCES [dbo].[language] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__indicator__langu__35BCFE0A]') AND parent_object_id = OBJECT_ID(N'[dbo].[indicator_info]'))
ALTER TABLE [dbo].[indicator_info] CHECK CONSTRAINT [FK__indicator__langu__35BCFE0A]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__objective__langu__36B12243]') AND parent_object_id = OBJECT_ID(N'[dbo].[objective_info]'))
ALTER TABLE [dbo].[objective_info]  WITH CHECK ADD  CONSTRAINT [FK__objective__langu__36B12243] FOREIGN KEY([language_id])
REFERENCES [dbo].[language] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__objective__langu__36B12243]') AND parent_object_id = OBJECT_ID(N'[dbo].[objective_info]'))
ALTER TABLE [dbo].[objective_info] CHECK CONSTRAINT [FK__objective__langu__36B12243]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__objective__objec__37A5467C]') AND parent_object_id = OBJECT_ID(N'[dbo].[objective_info]'))
ALTER TABLE [dbo].[objective_info]  WITH CHECK ADD  CONSTRAINT [FK__objective__objec__37A5467C] FOREIGN KEY([objective_id])
REFERENCES [dbo].[objective] ([id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__objective__objec__37A5467C]') AND parent_object_id = OBJECT_ID(N'[dbo].[objective_info]'))
ALTER TABLE [dbo].[objective_info] CHECK CONSTRAINT [FK__objective__objec__37A5467C]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK__question___check__6DCC4D03]') AND parent_object_id = OBJECT_ID(N'[dbo].[question_value]'))
ALTER TABLE [dbo].[question_value]  WITH CHECK ADD FOREIGN KEY([checklistquestion_id])
REFERENCES [dbo].[checklistquestion] ([id])
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__country_i__quart__70A8B9AE]') AND parent_object_id = OBJECT_ID(N'[dbo].[country_indicator]'))
ALTER TABLE [dbo].[country_indicator]  WITH CHECK ADD  CONSTRAINT [CK__country_i__quart__70A8B9AE] CHECK  (([quarter]=(0) OR [quarter]=(4) OR [quarter]=(3) OR [quarter]=(2) OR [quarter]=(1)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK__country_i__quart__70A8B9AE]') AND parent_object_id = OBJECT_ID(N'[dbo].[country_indicator]'))
ALTER TABLE [dbo].[country_indicator] CHECK CONSTRAINT [CK__country_i__quart__70A8B9AE]
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
ALTER DATABASE [DashboardFMP] SET  READ_WRITE 
GO
