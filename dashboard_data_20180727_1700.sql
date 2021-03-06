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

INSERT [dbo].[objective] ([id], [code], [short_]) VALUES (1, N'obj1', N'Obj. 1')
INSERT [dbo].[objective] ([id], [code], [short_]) VALUES (2, N'obj2', N'Obj. 2')
INSERT [dbo].[objective] ([id], [code], [short_]) VALUES (3, N'obj3', N'Obj. 3')
INSERT [dbo].[objective] ([id], [code], [short_]) VALUES (4, N'obj4', N'Obj. 4')
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
INSERT [dbo].[country] ([id], [code]) VALUES (24, N'cme')
INSERT [dbo].[country] ([id], [code]) VALUES (25, N'cni')
INSERT [dbo].[country] ([id], [code]) VALUES (26, N'csc')
INSERT [dbo].[country] ([id], [code]) VALUES (27, N'car')
INSERT [dbo].[country] ([id], [code]) VALUES (28, N'cbr')
SET IDENTITY_INSERT [dbo].[country] OFF
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (1, 1, N'Global', NULL, 1, N'Global')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (2, 1, N'Grupo Andino', NULL, 1, N'AN')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (3, 1, N'Bolivia', NULL, NULL, N'BO')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (4, 1, N'Colombia', NULL, NULL, N'CO')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (5, 1, N'Ecuador', NULL, NULL, N'EC')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (6, 1, N'Perú', NULL, NULL, N'PE')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (7, 1, N'Venezuela', NULL, NULL, N'VE')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (8, 1, N'Caribe', NULL, 1, N'CB')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (9, 1, N'Barbados', NULL, NULL, N'BA')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (10, 1, N'Bahamas', NULL, NULL, N'BH')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (11, 1, N'Guyana', NULL, NULL, N'GY')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (12, 1, N'Jamaica', NULL, NULL, N'JA')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (13, 1, N'Surinam', NULL, NULL, N'SU')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (14, 1, N'Trinidad y Tobago', NULL, NULL, N'TT')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (15, 1, N'Centro América', NULL, 1, N'ID')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (16, 1, N'Belize', NULL, NULL, N'BL')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (17, 1, N'Panamá', NULL, NULL, N'PN')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (18, 1, N'Costa Rica', NULL, NULL, N'CR')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (19, 1, N'Rep. Dominicana', NULL, NULL, N'DR')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (20, 1, N'El Salvador', NULL, NULL, N'ES')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (21, 1, N'Guatemala', NULL, NULL, N'GU')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (22, 1, N'Haití', NULL, NULL, N'HA')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (23, 1, N'Honduras', NULL, NULL, N'HO')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (24, 1, N'México', NULL, NULL, N'ME')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (25, 1, N'Nicaragua', NULL, NULL, N'NI')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (26, 1, N'Cono Sur', NULL, 1, N'SC')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (27, 1, N'Argentina', NULL, NULL, N'AR')
INSERT [dbo].[country_info] ([country_id], [language_id], [name], [description], [group], [code]) VALUES (28, 1, N'Brazil', NULL, NULL, N'BR')
INSERT [dbo].[objective_info] ([objective_id], [language_id], [short_], [name], [text]) VALUES (1, 1, N'Operaciones', N'Operaciones', NULL)
INSERT [dbo].[objective_info] ([objective_id], [language_id], [short_], [name], [text]) VALUES (2, 1, N'Consolidación Grupo BID', N'Consolidación Grupo BID', NULL)
INSERT [dbo].[objective_info] ([objective_id], [language_id], [short_], [name], [text]) VALUES (3, 1, N'Innovación y Conocimiento', N'Innovación y Conocimiento', NULL)
INSERT [dbo].[objective_info] ([objective_id], [language_id], [short_], [name], [text]) VALUES (4, 1, N'Eficiencia en el uso de Recurso', N'Eficiencia en el uso de Recurso', NULL)
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
