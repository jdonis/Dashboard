USE [DashboardFMP ]
GO
DELETE FROM [dbo].[indicator_group_info]
GO
DELETE FROM [dbo].[objective_info]
GO
DELETE FROM [dbo].[country_info]
GO
DELETE FROM [dbo].[indicator_info]
GO
DELETE FROM [dbo].[question_value]
GO
DELETE FROM [dbo].[country_indicator]
GO
DELETE FROM [dbo].[country]
GO
DELETE FROM [dbo].[checklist_question_info]
GO
DELETE FROM [dbo].[language]
GO
DELETE FROM [dbo].[indicator]
GO
DELETE FROM [dbo].[objective]
GO
DELETE FROM [dbo].[indicatorgroup]
GO
DELETE FROM [dbo].[checklistquestion]
GO
DELETE FROM [dbo].[checklist]
GO
SET IDENTITY_INSERT [dbo].[indicatorgroup] ON 

INSERT [dbo].[indicatorgroup] ([id], [code]) VALUES (1, N'A01')
INSERT [dbo].[indicatorgroup] ([id], [code]) VALUES (2, N'A02')
INSERT [dbo].[indicatorgroup] ([id], [code]) VALUES (3, N'A03')
INSERT [dbo].[indicatorgroup] ([id], [code]) VALUES (4, N'A04')
INSERT [dbo].[indicatorgroup] ([id], [code]) VALUES (5, N'A05')
INSERT [dbo].[indicatorgroup] ([id], [code]) VALUES (6, N'A06')
INSERT [dbo].[indicatorgroup] ([id], [code]) VALUES (7, N'B01')
INSERT [dbo].[indicatorgroup] ([id], [code]) VALUES (8, N'B02')
INSERT [dbo].[indicatorgroup] ([id], [code]) VALUES (9, N'B03')
INSERT [dbo].[indicatorgroup] ([id], [code]) VALUES (10, N'B04')
SET IDENTITY_INSERT [dbo].[indicatorgroup] OFF
SET IDENTITY_INSERT [dbo].[objective] ON 

INSERT [dbo].[objective] ([id], [code]) VALUES (1, N'obj1')
INSERT [dbo].[objective] ([id], [code]) VALUES (2, N'obj2')
INSERT [dbo].[objective] ([id], [code]) VALUES (3, N'obj3')
INSERT [dbo].[objective] ([id], [code]) VALUES (4, N'obj4')
SET IDENTITY_INSERT [dbo].[objective] OFF
SET IDENTITY_INSERT [dbo].[language] ON 

INSERT [dbo].[language] ([id], [name], [code]) VALUES (1, N'Español', N'ES')
INSERT [dbo].[language] ([id], [name], [code]) VALUES (2, N'English', N'EN')
SET IDENTITY_INSERT [dbo].[language] OFF
SET IDENTITY_INSERT [dbo].[country] ON 

INSERT [dbo].[country] ([id], [code]) VALUES (1, N'global')
INSERT [dbo].[country] ([id], [code]) VALUES (2, N'can')
INSERT [dbo].[country] ([id], [code]) VALUES (3, N'cbo')
INSERT [dbo].[country] ([id], [code]) VALUES (4, N'cco')
INSERT [dbo].[country] ([id], [code]) VALUES (5, N'cec')
INSERT [dbo].[country] ([id], [code]) VALUES (6, N'cpe')
INSERT [dbo].[country] ([id], [code]) VALUES (7, N'cve')
INSERT [dbo].[country] ([id], [code]) VALUES (8, N'ccb')
INSERT [dbo].[country] ([id], [code]) VALUES (9, N'cba')
INSERT [dbo].[country] ([id], [code]) VALUES (10, N'cbh')
INSERT [dbo].[country] ([id], [code]) VALUES (11, N'cgy')
INSERT [dbo].[country] ([id], [code]) VALUES (12, N'cja')
INSERT [dbo].[country] ([id], [code]) VALUES (13, N'csu')
INSERT [dbo].[country] ([id], [code]) VALUES (14, N'ctt')
INSERT [dbo].[country] ([id], [code]) VALUES (15, N'cid')
INSERT [dbo].[country] ([id], [code]) VALUES (16, N'cbl')
INSERT [dbo].[country] ([id], [code]) VALUES (17, N'cpn')
INSERT [dbo].[country] ([id], [code]) VALUES (18, N'ccr')
INSERT [dbo].[country] ([id], [code]) VALUES (19, N'cdr')
INSERT [dbo].[country] ([id], [code]) VALUES (20, N'ces')
INSERT [dbo].[country] ([id], [code]) VALUES (21, N'cgu')
INSERT [dbo].[country] ([id], [code]) VALUES (22, N'cha')
INSERT [dbo].[country] ([id], [code]) VALUES (23, N'cho')
INSERT [dbo].[country] ([id], [code]) VALUES (24, N'ce')
INSERT [dbo].[country] ([id], [code]) VALUES (25, N'cni')
INSERT [dbo].[country] ([id], [code]) VALUES (26, N'csc')
INSERT [dbo].[country] ([id], [code]) VALUES (27, N'car')
INSERT [dbo].[country] ([id], [code]) VALUES (28, N'cbr')
SET IDENTITY_INSERT [dbo].[country] OFF
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (1, 1, N'Global', NULL, 1, N'Global')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (2, 1, N'Grupo Andino', NULL, 1, N'AN')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (3, 1, N'Bolivia', NULL, NULL, N'BO')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (4, 1, N'Colombia', NULL, NULL, N'CO')
INSERT [dbo].[objective_info] ([objective_id], [language_id], [short], [name], [text]) VALUES (1, 1, N'Operaciones', N'Operaciones', NULL)
INSERT [dbo].[objective_info] ([objective_id], [language_id], [short], [name], [text]) VALUES (2, 1, N'Consolidación Grupo BID', N'Consolidación Grupo BID', NULL)
INSERT [dbo].[objective_info] ([objective_id], [language_id], [short], [name], [text]) VALUES (3, 1, N'Innovación y Conocimiento', N'Innovación y Conocimiento', NULL)
INSERT [dbo].[objective_info] ([objective_id], [language_id], [short], [name], [text]) VALUES (4, 1, N'Eficiencia en el uso de Recurso', N'Eficiencia en el uso de Recurso', NULL)
INSERT [dbo].[indicator_group_info] ([language_id], [indicatorgroup_id], [name], [description]) VALUES (1, 1, N'Gestión de Clientes y Donantes', NULL)
INSERT [dbo].[indicator_group_info] ([language_id], [indicatorgroup_id], [name], [description]) VALUES (1, 2, N'Estrategia & Programación', NULL)
INSERT [dbo].[indicator_group_info] ([language_id], [indicatorgroup_id], [name], [description]) VALUES (1, 3, N'Desarrollo de Conocimiento', NULL)
INSERT [dbo].[indicator_group_info] ([language_id], [indicatorgroup_id], [name], [description]) VALUES (1, 4, N'Originación', NULL)
INSERT [dbo].[indicator_group_info] ([language_id], [indicatorgroup_id], [name], [description]) VALUES (1, 5, N'Preparación', NULL)
INSERT [dbo].[indicator_group_info] ([language_id], [indicatorgroup_id], [name], [description]) VALUES (1, 6, N'Supervision', NULL)
INSERT [dbo].[indicator_group_info] ([language_id], [indicatorgroup_id], [name], [description]) VALUES (1, 7, N'Aprendizaje y Conocimiento Colaborativo', NULL)
INSERT [dbo].[indicator_group_info] ([language_id], [indicatorgroup_id], [name], [description]) VALUES (1, 8, N'Gestión de Mejoras de Capital', NULL)
INSERT [dbo].[indicator_group_info] ([language_id], [indicatorgroup_id], [name], [description]) VALUES (1, 9, N'Governanza Corporativa', NULL)
INSERT [dbo].[indicator_group_info] ([language_id], [indicatorgroup_id], [name], [description]) VALUES (1, 10, N'Servicios Corporativos', NULL)
