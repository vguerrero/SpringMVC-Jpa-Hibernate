USE [master]
GO
/****** Object:  Database [ContactDB]    Script Date: 05/07/2013 16:01:24 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'ContactDB')
BEGIN
CREATE DATABASE [ContactDB] ON  PRIMARY 
( NAME = N'ContactDB', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ContactDB.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ContactDB_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\ContactDB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END
GO
ALTER DATABASE [ContactDB] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ContactDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ContactDB] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [ContactDB] SET ANSI_NULLS OFF
GO
ALTER DATABASE [ContactDB] SET ANSI_PADDING OFF
GO
ALTER DATABASE [ContactDB] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [ContactDB] SET ARITHABORT OFF
GO
ALTER DATABASE [ContactDB] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [ContactDB] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [ContactDB] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [ContactDB] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [ContactDB] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [ContactDB] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [ContactDB] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [ContactDB] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [ContactDB] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [ContactDB] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [ContactDB] SET  DISABLE_BROKER
GO
ALTER DATABASE [ContactDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [ContactDB] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [ContactDB] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [ContactDB] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [ContactDB] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [ContactDB] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [ContactDB] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [ContactDB] SET  READ_WRITE
GO
ALTER DATABASE [ContactDB] SET RECOVERY SIMPLE
GO
ALTER DATABASE [ContactDB] SET  MULTI_USER
GO
ALTER DATABASE [ContactDB] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [ContactDB] SET DB_CHAINING OFF
GO
USE [ContactDB]
GO
/****** Object:  Table [dbo].[CONTACTS]    Script Date: 05/07/2013 16:01:28 ******/
IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[DF_CONTACTS_created]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CONTACTS] DROP CONSTRAINT [DF_CONTACTS_created]
END
GO
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CONTACTS]') AND type in (N'U'))
DROP TABLE [dbo].[CONTACTS]
GO
/****** Object:  Table [dbo].[PERSON]    Script Date: 05/07/2013 16:01:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PERSON]') AND type in (N'U'))
DROP TABLE [dbo].[PERSON]
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 05/07/2013 16:01:28 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PRODUCT]') AND type in (N'U'))
DROP TABLE [dbo].[PRODUCT]
GO
/****** Object:  Table [dbo].[PRODUCT]    Script Date: 05/07/2013 16:01:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PRODUCT]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PRODUCT](
	[id] [int] NOT NULL,
	[code] [varchar](255) NULL,
	[enterDate] [datetime] NULL,
	[name] [varchar](255) NULL,
	[price] [numeric](19, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PERSON]    Script Date: 05/07/2013 16:01:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PERSON]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PERSON](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FIRST_NAME] [varchar](255) NULL,
	[LAST_NAME] [varchar](255) NULL,
	[MONEY] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[PERSON] ON
INSERT [dbo].[PERSON] ([ID], [FIRST_NAME], [LAST_NAME], [MONEY]) VALUES (1, N'luis ', N'gomez', 650000)
INSERT [dbo].[PERSON] ([ID], [FIRST_NAME], [LAST_NAME], [MONEY]) VALUES (2, N'sergio', N'bustamante reales', 14000)
INSERT [dbo].[PERSON] ([ID], [FIRST_NAME], [LAST_NAME], [MONEY]) VALUES (3, N'maria daniela', N'pertuz', 470000)
INSERT [dbo].[PERSON] ([ID], [FIRST_NAME], [LAST_NAME], [MONEY]) VALUES (4, N'omar', N'batista', 7415400)
INSERT [dbo].[PERSON] ([ID], [FIRST_NAME], [LAST_NAME], [MONEY]) VALUES (5, N'jesica', N'fuentes pardo', 8934900)
SET IDENTITY_INSERT [dbo].[PERSON] OFF
/****** Object:  Table [dbo].[CONTACTS]    Script Date: 05/07/2013 16:01:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CONTACTS]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CONTACTS](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [varchar](30) NULL,
	[lastname] [varchar](30) NULL,
	[telephone] [varchar](15) NULL,
	[email] [varchar](30) NULL,
	[created] [datetime] NOT NULL CONSTRAINT [DF_CONTACTS_created]  DEFAULT (getdate()),
 CONSTRAINT [PK_CONTACTS] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[CONTACTS] ON
INSERT [dbo].[CONTACTS] ([id], [firstname], [lastname], [telephone], [email], [created]) VALUES (6, N'daimer', N'suarez', N'5406504', N'daim@jasdf.com', CAST(0x0000A1A500E672A1 AS DateTime))
INSERT [dbo].[CONTACTS] ([id], [firstname], [lastname], [telephone], [email], [created]) VALUES (18, N'maria sandra', N'holgin suares', N'5540650652', N'ari@adsf.com', CAST(0x0000A1A900E3DF8B AS DateTime))
INSERT [dbo].[CONTACTS] ([id], [firstname], [lastname], [telephone], [email], [created]) VALUES (21, N'maikol ', N'alexander', N'40654011', N'maik@tyomm.com', CAST(0x0000A1AB00E693C6 AS DateTime))
INSERT [dbo].[CONTACTS] ([id], [firstname], [lastname], [telephone], [email], [created]) VALUES (22, N'farid', N'ollefio', N'21021110', N'sdf@gff.com', CAST(0x0000A1AB00E6FBF2 AS DateTime))
INSERT [dbo].[CONTACTS] ([id], [firstname], [lastname], [telephone], [email], [created]) VALUES (23, N'rene', N'higuita', N'506555844', N'ren@hig.com', CAST(0x0000A1AB00E7E4DB AS DateTime))
SET IDENTITY_INSERT [dbo].[CONTACTS] OFF
