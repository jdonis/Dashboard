USE [DashboardFMP ]
GO
SET IDENTITY_INSERT [dbo].[language] ON 

INSERT [dbo].[language] ([id], [name], [code]) VALUES (1, N'Español', N'ESP')
INSERT [dbo].[language] ([id], [name], [code]) VALUES (2, N'English', N'ENG')
SET IDENTITY_INSERT [dbo].[language] OFF
SET IDENTITY_INSERT [dbo].[country] ON 

INSERT [dbo].[country] ([id], [language_id], [code], [name], [description]) VALUES (1, 1, N'BO', N'Bolivia', NULL)
INSERT [dbo].[country] ([id], [language_id], [code], [name], [description]) VALUES (2, 1, N'CO', N'Colombia', NULL)
INSERT [dbo].[country] ([id], [language_id], [code], [name], [description]) VALUES (3, 1, N'EC', N'Ecuador', NULL)
INSERT [dbo].[country] ([id], [language_id], [code], [name], [description]) VALUES (4, 1, N'PE', N'Perú', NULL)
INSERT [dbo].[country] ([id], [language_id], [code], [name], [description]) VALUES (5, 2, N'BA', N'Barbados', NULL)
SET IDENTITY_INSERT [dbo].[country] OFF
