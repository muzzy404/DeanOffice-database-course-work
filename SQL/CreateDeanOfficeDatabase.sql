USE [master]
GO
/****** Object:  Database [DeanOffice]    Script Date: 30.06.2018 20:03:18 ******/
CREATE DATABASE [DeanOffice]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DeanOffice', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DeanOffice.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DeanOffice_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\DeanOffice_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 COLLATE Cyrillic_General_CI_AS
GO
ALTER DATABASE [DeanOffice] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DeanOffice].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DeanOffice] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DeanOffice] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DeanOffice] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DeanOffice] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DeanOffice] SET ARITHABORT OFF 
GO
ALTER DATABASE [DeanOffice] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DeanOffice] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DeanOffice] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DeanOffice] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DeanOffice] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DeanOffice] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DeanOffice] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DeanOffice] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DeanOffice] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DeanOffice] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DeanOffice] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DeanOffice] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DeanOffice] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DeanOffice] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DeanOffice] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DeanOffice] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DeanOffice] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DeanOffice] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DeanOffice] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DeanOffice] SET  MULTI_USER 
GO
ALTER DATABASE [DeanOffice] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DeanOffice] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DeanOffice] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DeanOffice] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [server_login_lab]    Script Date: 30.06.2018 20:03:18 ******/
CREATE LOGIN [server_login_lab] WITH PASSWORD=N'zL ò	¶9Égö%_¤óò5þ%õ!ø|R', DEFAULT_DATABASE=[lab_works_test], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
ALTER LOGIN [server_login_lab] DISABLE
GO
/****** Object:  Login [NT SERVICE\winmgmt]    Script Date: 30.06.2018 20:03:18 ******/
CREATE LOGIN [NT SERVICE\winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 30.06.2018 20:03:18 ******/
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT Service\MSSQLSERVER]    Script Date: 30.06.2018 20:03:18 ******/
CREATE LOGIN [NT Service\MSSQLSERVER] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT AUTHORITY\СИСТЕМА]    Script Date: 30.06.2018 20:03:18 ******/
CREATE LOGIN [NT AUTHORITY\СИСТЕМА] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [muzzy\father]    Script Date: 30.06.2018 20:03:18 ******/
CREATE LOGIN [muzzy\father] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [lab_works_user]    Script Date: 30.06.2018 20:03:18 ******/
CREATE LOGIN [lab_works_user] WITH PASSWORD=N'Àgà¼DtÆÕyÎeÃdÎ 0S,Hó[It\lÓ"', DEFAULT_DATABASE=[lab_works_test], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=ON, CHECK_POLICY=ON
GO
ALTER LOGIN [lab_works_user] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [DeanOfficeTeacher]    Script Date: 30.06.2018 20:03:18 ******/
CREATE LOGIN [DeanOfficeTeacher] WITH PASSWORD=N'¹]öp8W±du^T¢ÜÊ}ÚJÆê[æ_$;Ç', DEFAULT_DATABASE=[DeanOffice], DEFAULT_LANGUAGE=[русский], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [DeanOfficeTeacher] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [DeanOfficeSecretary]    Script Date: 30.06.2018 20:03:18 ******/
CREATE LOGIN [DeanOfficeSecretary] WITH PASSWORD=N'm°k£4"Z=ìb°]Ü­ÌéÅS¯xAm2r8è', DEFAULT_DATABASE=[DeanOffice], DEFAULT_LANGUAGE=[русский], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [DeanOfficeSecretary] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [DeanOfficeAdmin]    Script Date: 30.06.2018 20:03:18 ******/
CREATE LOGIN [DeanOfficeAdmin] WITH PASSWORD=N'ä«°S^çj¯Ó0ÂPåÿ.?o×5ÿ¡sSÏOk', DEFAULT_DATABASE=[DeanOffice], DEFAULT_LANGUAGE=[русский], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
ALTER LOGIN [DeanOfficeAdmin] DISABLE
GO
/****** Object:  Login [BUILTIN\Пользователи]    Script Date: 30.06.2018 20:03:18 ******/
CREATE LOGIN [BUILTIN\Пользователи] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 30.06.2018 20:03:18 ******/
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'=jMêE¬FTXÂd-¼áXãÚ»«±ù! ú|', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 30.06.2018 20:03:18 ******/
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'ßD]´UÈ6-üÝþx£=ëÙÅpý¼m»¸î©', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [server_login_lab]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\winmgmt]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQLSERVER]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [muzzy\father]
GO
ALTER SERVER ROLE [securityadmin] ADD MEMBER [muzzy\father]
GO
ALTER SERVER ROLE [serveradmin] ADD MEMBER [muzzy\father]
GO
ALTER SERVER ROLE [setupadmin] ADD MEMBER [muzzy\father]
GO
ALTER SERVER ROLE [processadmin] ADD MEMBER [muzzy\father]
GO
ALTER SERVER ROLE [diskadmin] ADD MEMBER [muzzy\father]
GO
ALTER SERVER ROLE [dbcreator] ADD MEMBER [muzzy\father]
GO
ALTER SERVER ROLE [bulkadmin] ADD MEMBER [muzzy\father]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [lab_works_user]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [DeanOfficeSecretary]
GO
USE [DeanOffice]
GO
/****** Object:  User [teacher]    Script Date: 30.06.2018 20:03:18 ******/
CREATE USER [teacher] FOR LOGIN [DeanOfficeTeacher] WITH DEFAULT_SCHEMA=[db_datawriter]
GO
/****** Object:  User [secretary]    Script Date: 30.06.2018 20:03:18 ******/
CREATE USER [secretary] FOR LOGIN [DeanOfficeSecretary] WITH DEFAULT_SCHEMA=[db_datawriter]
GO
/****** Object:  User [admin]    Script Date: 30.06.2018 20:03:18 ******/
CREATE USER [admin] FOR LOGIN [DeanOfficeAdmin] WITH DEFAULT_SCHEMA=[db_accessadmin]
GO
ALTER ROLE [db_datareader] ADD MEMBER [teacher]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [teacher]
GO
ALTER ROLE [db_datareader] ADD MEMBER [secretary]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [secretary]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [admin]
GO
ALTER ROLE [db_datareader] ADD MEMBER [admin]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [admin]
GO
GRANT CONNECT TO [admin] AS [dbo]
GO
GRANT CONNECT TO [secretary] AS [dbo]
GO
GRANT CONNECT TO [teacher] AS [dbo]
GO
/****** Object:  StoredProcedure [dbo].[addDiscipline]    Script Date: 30.06.2018 20:03:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addDiscipline]
	@name varchar(50),
	@lectureHours  tinyint,
	@practiceHours tinyint
AS
	INSERT INTO Disciplines VALUES
		(@name, @lectureHours, @practiceHours)

GO
/****** Object:  StoredProcedure [dbo].[addStudent]    Script Date: 30.06.2018 20:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addStudent]
	@lastname   varchar(20),
	@firstname  varchar(20),
	@patronymic varchar(20),
	@dob date,
	@group  int,
	@status int
AS
	INSERT INTO Students VALUES
		(@lastname, @firstname, @patronymic, @dob, @group, @status)

GO
/****** Object:  StoredProcedure [dbo].[addTeacher]    Script Date: 30.06.2018 20:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[addTeacher]
	@lastname   varchar(20),
	@firstname  varchar(20),
	@patronymic varchar(20),
	@discipline int,
	@department int,
	@status int
AS
	INSERT INTO Teachers VALUES
		(@lastname, @firstname, @patronymic, @discipline, @department, @status)

GO
/****** Object:  StoredProcedure [dbo].[deanOfficeTestProc]    Script Date: 30.06.2018 20:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deanOfficeTestProc]
AS
	SELECT lastName, firstName, patronymic, Groups.number
	FROM Students, Groups
	WHERE Students.groupNumber = Groups.id

GO
/****** Object:  StoredProcedure [dbo].[getGroupList]    Script Date: 30.06.2018 20:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[getGroupList]
	@GroupId int
AS
	SELECT lastName, firstName, patronymic, Groups.number
	FROM Students, Groups
	WHERE Students.groupNumber = Groups.id AND Groups.id = @GroupId

GO
/****** Object:  Table [dbo].[Attestation]    Script Date: 30.06.2018 20:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attestation](
	[student] [int] NOT NULL,
	[subj] [int] NOT NULL,
	[sem] [int] NOT NULL,
	[num] [tinyint] NOT NULL,
	[tests] [tinyint] NULL,
	[attendance] [tinyint] NULL,
PRIMARY KEY CLUSTERED 
(
	[student] ASC,
	[subj] ASC,
	[sem] ASC,
	[num] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Departments]    Script Date: 30.06.2018 20:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Departments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Disciplines]    Script Date: 30.06.2018 20:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Disciplines](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[lectureHours] [tinyint] NOT NULL,
	[practiceHours] [tinyint] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExamsCredits]    Script Date: 30.06.2018 20:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ExamsCredits](
	[student] [int] NOT NULL,
	[subj] [int] NOT NULL,
	[sem] [int] NOT NULL,
	[examMark] [tinyint] NULL,
	[passMark] [bit] NULL,
	[teacher] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[student] ASC,
	[subj] ASC,
	[sem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Groups]    Script Date: 30.06.2018 20:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Groups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[number] [char](10) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[semNum] [tinyint] NOT NULL,
	[sem] [int] NOT NULL,
	[department] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Semesters]    Script Date: 30.06.2018 20:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semesters](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[beginDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Statuses]    Script Date: 30.06.2018 20:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Statuses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[entity] [varchar](15) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[statusStr] [varchar](20) COLLATE Cyrillic_General_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Students]    Script Date: 30.06.2018 20:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Students](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[lastName] [varchar](20) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[firstName] [varchar](20) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[patronymic] [varchar](20) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[dob] [date] NOT NULL,
	[groupNumber] [int] NULL,
	[studentStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Subjects]    Script Date: 30.06.2018 20:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subjects](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[discipline] [int] NOT NULL,
	[department] [int] NOT NULL,
	[sem] [tinyint] NOT NULL,
	[exam] [bit] NOT NULL,
	[pass] [bit] NOT NULL,
	[active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 30.06.2018 20:03:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Teachers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[lastName] [varchar](20) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[firstName] [varchar](20) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[patronymic] [varchar](20) COLLATE Cyrillic_General_CI_AS NOT NULL,
	[discipline] [int] NULL,
	[department] [int] NULL,
	[teacherStatus] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Attestation] ([student], [subj], [sem], [num], [tests], [attendance]) VALUES (1, 1, 1, 1, 60, 70)
INSERT [dbo].[Attestation] ([student], [subj], [sem], [num], [tests], [attendance]) VALUES (1, 1, 1, 2, 80, 100)
INSERT [dbo].[Attestation] ([student], [subj], [sem], [num], [tests], [attendance]) VALUES (1, 1, 1, 3, 70, 80)
INSERT [dbo].[Attestation] ([student], [subj], [sem], [num], [tests], [attendance]) VALUES (1, 1, 1, 4, 60, 100)
INSERT [dbo].[Attestation] ([student], [subj], [sem], [num], [tests], [attendance]) VALUES (2, 1, 1, 1, 100, 100)
INSERT [dbo].[Attestation] ([student], [subj], [sem], [num], [tests], [attendance]) VALUES (2, 1, 1, 2, 100, 100)
INSERT [dbo].[Attestation] ([student], [subj], [sem], [num], [tests], [attendance]) VALUES (3, 1, 1, 1, 20, 30)
INSERT [dbo].[Attestation] ([student], [subj], [sem], [num], [tests], [attendance]) VALUES (6, 31, 1, 1, 100, 100)
INSERT [dbo].[Attestation] ([student], [subj], [sem], [num], [tests], [attendance]) VALUES (6, 31, 1, 2, 90, 70)
INSERT [dbo].[Attestation] ([student], [subj], [sem], [num], [tests], [attendance]) VALUES (12, 3, 1, 1, 100, 100)
INSERT [dbo].[Attestation] ([student], [subj], [sem], [num], [tests], [attendance]) VALUES (12, 3, 1, 2, 90, 100)
INSERT [dbo].[Attestation] ([student], [subj], [sem], [num], [tests], [attendance]) VALUES (12, 3, 1, 3, 80, 90)
INSERT [dbo].[Attestation] ([student], [subj], [sem], [num], [tests], [attendance]) VALUES (12, 3, 1, 4, 60, 100)
INSERT [dbo].[Attestation] ([student], [subj], [sem], [num], [tests], [attendance]) VALUES (15, 18, 1, 1, 100, 100)
INSERT [dbo].[Attestation] ([student], [subj], [sem], [num], [tests], [attendance]) VALUES (15, 18, 1, 2, 90, 100)
INSERT [dbo].[Attestation] ([student], [subj], [sem], [num], [tests], [attendance]) VALUES (27, 1, 1, 1, 100, 100)
INSERT [dbo].[Attestation] ([student], [subj], [sem], [num], [tests], [attendance]) VALUES (27, 1, 1, 2, 90, 70)
INSERT [dbo].[Attestation] ([student], [subj], [sem], [num], [tests], [attendance]) VALUES (27, 1, 1, 3, 100, 80)
INSERT [dbo].[Attestation] ([student], [subj], [sem], [num], [tests], [attendance]) VALUES (27, 1, 1, 4, 100, 90)
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([id], [name], [active]) VALUES (3, N'ИБКС', 1)
INSERT [dbo].[Departments] ([id], [name], [active]) VALUES (1, N'ИУС', 1)
INSERT [dbo].[Departments] ([id], [name], [active]) VALUES (4, N'КИТ', 0)
INSERT [dbo].[Departments] ([id], [name], [active]) VALUES (2, N'КСПТ', 1)
SET IDENTITY_INSERT [dbo].[Departments] OFF
SET IDENTITY_INSERT [dbo].[Disciplines] ON 

INSERT [dbo].[Disciplines] ([id], [name], [lectureHours], [practiceHours]) VALUES (1, N'Высшая математика', 32, 36)
INSERT [dbo].[Disciplines] ([id], [name], [lectureHours], [practiceHours]) VALUES (2, N'Физика', 28, 38)
INSERT [dbo].[Disciplines] ([id], [name], [lectureHours], [practiceHours]) VALUES (3, N'Основы алгоритмизации и программирования', 36, 44)
INSERT [dbo].[Disciplines] ([id], [name], [lectureHours], [practiceHours]) VALUES (4, N'Объектно ориентированное программирование', 32, 32)
INSERT [dbo].[Disciplines] ([id], [name], [lectureHours], [practiceHours]) VALUES (5, N'Базы данных', 28, 28)
INSERT [dbo].[Disciplines] ([id], [name], [lectureHours], [practiceHours]) VALUES (6, N'ЭВМ и переферийные устройства', 26, 32)
INSERT [dbo].[Disciplines] ([id], [name], [lectureHours], [practiceHours]) VALUES (7, N'Схемотехника и проектирование цифровых устройств', 32, 24)
INSERT [dbo].[Disciplines] ([id], [name], [lectureHours], [practiceHours]) VALUES (8, N'Информатика', 12, 22)
INSERT [dbo].[Disciplines] ([id], [name], [lectureHours], [practiceHours]) VALUES (9, N'Физическая культура', 5, 40)
INSERT [dbo].[Disciplines] ([id], [name], [lectureHours], [practiceHours]) VALUES (10, N'Математика', 20, 40)
INSERT [dbo].[Disciplines] ([id], [name], [lectureHours], [practiceHours]) VALUES (11, N'ОТУ', 24, 36)
INSERT [dbo].[Disciplines] ([id], [name], [lectureHours], [practiceHours]) VALUES (12, N'Теория вероятности', 23, 46)
INSERT [dbo].[Disciplines] ([id], [name], [lectureHours], [practiceHours]) VALUES (13, N'Компьютерные сети', 29, 31)
INSERT [dbo].[Disciplines] ([id], [name], [lectureHours], [practiceHours]) VALUES (1012, N'История', 10, 20)
SET IDENTITY_INSERT [dbo].[Disciplines] OFF
INSERT [dbo].[ExamsCredits] ([student], [subj], [sem], [examMark], [passMark], [teacher]) VALUES (1, 1, 1, 5, 1, 1)
INSERT [dbo].[ExamsCredits] ([student], [subj], [sem], [examMark], [passMark], [teacher]) VALUES (1, 3, 1, 5, 1, 1)
INSERT [dbo].[ExamsCredits] ([student], [subj], [sem], [examMark], [passMark], [teacher]) VALUES (1, 5, 1, 4, 1, 1)
INSERT [dbo].[ExamsCredits] ([student], [subj], [sem], [examMark], [passMark], [teacher]) VALUES (1, 31, 1, NULL, 1, 12)
INSERT [dbo].[ExamsCredits] ([student], [subj], [sem], [examMark], [passMark], [teacher]) VALUES (2, 1, 1, NULL, 0, 1)
INSERT [dbo].[ExamsCredits] ([student], [subj], [sem], [examMark], [passMark], [teacher]) VALUES (2, 5, 1, 3, 0, 1)
INSERT [dbo].[ExamsCredits] ([student], [subj], [sem], [examMark], [passMark], [teacher]) VALUES (2, 31, 1, NULL, 0, 12)
INSERT [dbo].[ExamsCredits] ([student], [subj], [sem], [examMark], [passMark], [teacher]) VALUES (3, 1, 1, 4, 1, 1)
INSERT [dbo].[ExamsCredits] ([student], [subj], [sem], [examMark], [passMark], [teacher]) VALUES (3, 31, 1, NULL, 1, 12)
INSERT [dbo].[ExamsCredits] ([student], [subj], [sem], [examMark], [passMark], [teacher]) VALUES (4, 1, 1, 5, 1, 1)
INSERT [dbo].[ExamsCredits] ([student], [subj], [sem], [examMark], [passMark], [teacher]) VALUES (4, 31, 1, NULL, 1, 12)
INSERT [dbo].[ExamsCredits] ([student], [subj], [sem], [examMark], [passMark], [teacher]) VALUES (5, 1, 1, 5, 1, 1)
INSERT [dbo].[ExamsCredits] ([student], [subj], [sem], [examMark], [passMark], [teacher]) VALUES (5, 3, 1, 5, 1, 1)
INSERT [dbo].[ExamsCredits] ([student], [subj], [sem], [examMark], [passMark], [teacher]) VALUES (5, 5, 1, 4, 1, 1)
INSERT [dbo].[ExamsCredits] ([student], [subj], [sem], [examMark], [passMark], [teacher]) VALUES (5, 31, 1, NULL, 1, 12)
INSERT [dbo].[ExamsCredits] ([student], [subj], [sem], [examMark], [passMark], [teacher]) VALUES (6, 1, 1, 5, 1, 14)
INSERT [dbo].[ExamsCredits] ([student], [subj], [sem], [examMark], [passMark], [teacher]) VALUES (6, 31, 1, NULL, 1, 12)
INSERT [dbo].[ExamsCredits] ([student], [subj], [sem], [examMark], [passMark], [teacher]) VALUES (7, 1, 1, 4, 1, 1)
INSERT [dbo].[ExamsCredits] ([student], [subj], [sem], [examMark], [passMark], [teacher]) VALUES (10, 1, 1, 5, 1, 1)
INSERT [dbo].[ExamsCredits] ([student], [subj], [sem], [examMark], [passMark], [teacher]) VALUES (11, 1, 1, 4, 1, 1)
INSERT [dbo].[ExamsCredits] ([student], [subj], [sem], [examMark], [passMark], [teacher]) VALUES (15, 18, 1, 5, NULL, 8)
INSERT [dbo].[ExamsCredits] ([student], [subj], [sem], [examMark], [passMark], [teacher]) VALUES (27, 1, 1, 3, 0, 1)
INSERT [dbo].[ExamsCredits] ([student], [subj], [sem], [examMark], [passMark], [teacher]) VALUES (27, 31, 1, NULL, 0, 12)
SET IDENTITY_INSERT [dbo].[Groups] ON 

INSERT [dbo].[Groups] ([id], [number], [semNum], [sem], [department]) VALUES (1, N'13501/1   ', 1, 1, 1)
INSERT [dbo].[Groups] ([id], [number], [semNum], [sem], [department]) VALUES (2, N'13501/2   ', 1, 1, 1)
INSERT [dbo].[Groups] ([id], [number], [semNum], [sem], [department]) VALUES (3, N'13501/3   ', 1, 1, 1)
INSERT [dbo].[Groups] ([id], [number], [semNum], [sem], [department]) VALUES (4, N'23501/1   ', 3, 1, 1)
INSERT [dbo].[Groups] ([id], [number], [semNum], [sem], [department]) VALUES (5, N'23502/1   ', 3, 1, 2)
INSERT [dbo].[Groups] ([id], [number], [semNum], [sem], [department]) VALUES (6, N'23503/1   ', 3, 1, 3)
INSERT [dbo].[Groups] ([id], [number], [semNum], [sem], [department]) VALUES (7, N'23503/2   ', 3, 1, 3)
INSERT [dbo].[Groups] ([id], [number], [semNum], [sem], [department]) VALUES (8, N'33501/22  ', 5, 1, 1)
SET IDENTITY_INSERT [dbo].[Groups] OFF
SET IDENTITY_INSERT [dbo].[Semesters] ON 

INSERT [dbo].[Semesters] ([id], [beginDate], [endDate]) VALUES (1, CAST(0x613A0B00 AS Date), CAST(0xDA3A0B00 AS Date))
INSERT [dbo].[Semesters] ([id], [beginDate], [endDate]) VALUES (2, CAST(0x013B0B00 AS Date), CAST(0x6F3B0B00 AS Date))
INSERT [dbo].[Semesters] ([id], [beginDate], [endDate]) VALUES (3, CAST(0x3C3D0B00 AS Date), CAST(0xCE3D0B00 AS Date))
SET IDENTITY_INSERT [dbo].[Semesters] OFF
SET IDENTITY_INSERT [dbo].[Statuses] ON 

INSERT [dbo].[Statuses] ([id], [entity], [statusStr]) VALUES (5, N'student', N'академичсекий отпуск')
INSERT [dbo].[Statuses] ([id], [entity], [statusStr]) VALUES (2, N'student', N'вечернее отделение')
INSERT [dbo].[Statuses] ([id], [entity], [statusStr]) VALUES (6, N'student', N'выпускник')
INSERT [dbo].[Statuses] ([id], [entity], [statusStr]) VALUES (1, N'student', N'дневное отделение')
INSERT [dbo].[Statuses] ([id], [entity], [statusStr]) VALUES (3, N'student', N'заочное отделение')
INSERT [dbo].[Statuses] ([id], [entity], [statusStr]) VALUES (4, N'student', N'отчислен')
INSERT [dbo].[Statuses] ([id], [entity], [statusStr]) VALUES (8, N'teacher', N'отпуск')
INSERT [dbo].[Statuses] ([id], [entity], [statusStr]) VALUES (7, N'teacher', N'работает')
INSERT [dbo].[Statuses] ([id], [entity], [statusStr]) VALUES (9, N'teacher', N'уволен')
SET IDENTITY_INSERT [dbo].[Statuses] OFF
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (1, N'Александров', N'Александр', N'Александрович', CAST(0xDB200B00 AS Date), 1, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (2, N'Балуев', N'Даниил', N'Иванович', CAST(0xD81E0B00 AS Date), 1, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (3, N'Волошин', N'Максим', N'Алексеев', CAST(0x6B200B00 AS Date), 1, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (4, N'Стародуб', N'Юлия', N'Михайловна', CAST(0xC3200B00 AS Date), 1, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (5, N'Мальцева', N'Валерия', N'Викторовна', CAST(0x0F1D0B00 AS Date), 1, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (6, N'Легких', N'Ирина', N'Сергеевна', CAST(0x331E0B00 AS Date), 2, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (7, N'Яготинская', N'Елена', N'Анатольевна', CAST(0xCB1F0B00 AS Date), 2, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (8, N'Вишенвский', N'Павел', N'Иванович', CAST(0x3E1F0B00 AS Date), 2, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (9, N'Поплавский', N'Вячеслав', N'Евгеньевич', CAST(0x35200B00 AS Date), 2, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (10, N'Базунова', N'Полина', N'Андреевна', CAST(0xD51F0B00 AS Date), 3, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (11, N'Киселев', N'Георгий', N'Георгиевич', CAST(0xE21F0B00 AS Date), 3, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (12, N'Мартынов', N'Алексей', N'Вячеславович', CAST(0x831F0B00 AS Date), 4, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (13, N'Тупикова', N'Ксения', N'Егоровна', CAST(0x9D1C0B00 AS Date), 4, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (14, N'Тихонова', N'Виктория', N'Семеновна', CAST(0x5C1E0B00 AS Date), 5, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (15, N'Колесникова', N'Юлия', N'Тимофеевна', CAST(0xBA1E0B00 AS Date), 6, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (16, N'Роговая', N'Екатерина', N'Дмитриевна', CAST(0x641D0B00 AS Date), 6, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (17, N'Роговой', N'Алексей', N'Всеволодович', CAST(0x091F0B00 AS Date), 6, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (18, N'Сандрова', N'Таисия', N'Макаровна', CAST(0x451E0B00 AS Date), 7, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (19, N'Ковалева', N'Ксения', N'Марковна', CAST(0x6A1E0B00 AS Date), 8, 2)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (20, N'Ровин', N'Никита', N'Леонидович', CAST(0x151A0B00 AS Date), 8, 2)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (21, N'Комардина', N'Елизавета', N'Ильясович', CAST(0x81200B00 AS Date), NULL, 4)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (22, N'Шумилова', N'Инесса', N'Власовна', CAST(0x4A200B00 AS Date), NULL, 4)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (23, N'Карамушкин', N'Сергей', N'Геннадьевич', CAST(0xBC200B00 AS Date), NULL, 5)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (24, N'Погребняк', N'Илья', N'Глебович', CAST(0x0E210B00 AS Date), NULL, 6)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (25, N'Сколовский', N'Руслан', N'Владиславович', CAST(0x0E210B00 AS Date), NULL, 6)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (26, N'Антонов', N'Антон', N'Антонович', CAST(0xE91F0B00 AS Date), 7, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (27, N'Иванов', N'Иван', N'Иванович', CAST(0x781B0B00 AS Date), 1, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (28, N'Петров', N'Петр', N'Петрович', CAST(0xE91C0B00 AS Date), 3, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (29, N'Иванов', N'Иван', N'Иванович', CAST(0xA21A0B00 AS Date), 3, 5)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (30, N'Иванов', N'Иван', N'Иванович', CAST(0xA21A0B00 AS Date), 3, 5)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (31, N'Васильев', N'Анатолий', N'Владимирович', CAST(0xEA1E0B00 AS Date), 3, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (32, N'Карелин', N'Вячеслав', N'Валерьевич', CAST(0x921C0B00 AS Date), 3, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (33, N'Замай', N'Алексей', N'Константинович', CAST(0x921C0B00 AS Date), 3, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (34, N'Игнатьев', N'Федор', N'Анатольевич', CAST(0x44190B00 AS Date), 3, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (35, N'Мкртчян', N'Алина', N'Александровна', CAST(0x7B210B00 AS Date), 3, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (36, N'Алешин', N'Иван', N'Алексеевич', CAST(0xC3150B00 AS Date), 2, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (37, N'Тарасов', N'Александр', N'Валентинович', CAST(0xC11F0B00 AS Date), 1, 1)
INSERT [dbo].[Students] ([id], [lastName], [firstName], [patronymic], [dob], [groupNumber], [studentStatus]) VALUES (38, N'Адреева', N'Антонина', N'Валентиновна', CAST(0xC3150B00 AS Date), 1, 1)
SET IDENTITY_INSERT [dbo].[Students] OFF
SET IDENTITY_INSERT [dbo].[Subjects] ON 

INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (1, 1, 1, 1, 1, 1, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (2, 1, 1, 2, 1, 1, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (3, 1, 1, 3, 0, 1, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (4, 1, 1, 4, 1, 0, 0)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (5, 2, 1, 1, 1, 1, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (6, 2, 1, 2, 1, 1, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (7, 3, 1, 1, 1, 1, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (8, 3, 1, 2, 1, 1, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (9, 4, 1, 2, 1, 1, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (10, 4, 1, 3, 1, 1, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (11, 1, 2, 1, 0, 1, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (12, 1, 2, 2, 0, 1, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (13, 1, 2, 3, 1, 0, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (14, 5, 2, 1, 1, 0, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (15, 5, 2, 2, 1, 0, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (16, 8, 2, 1, 1, 0, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (17, 8, 2, 2, 1, 0, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (18, 6, 3, 3, 1, 0, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (19, 6, 3, 4, 1, 0, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (20, 8, 1, 5, 1, 1, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (21, 8, 1, 6, 1, 1, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (23, 7, 3, 1, 0, 1, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (24, 8, 3, 1, 1, 1, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (25, 2, 3, 1, 1, 0, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (27, 1, 3, 1, 1, 0, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (28, 5, 3, 1, 0, 1, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (31, 9, 1, 1, 0, 1, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (33, 11, 2, 3, 1, 1, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (1033, 13, 1, 5, 1, 1, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (2033, 8, 1, 1, 1, 1, 1)
INSERT [dbo].[Subjects] ([id], [discipline], [department], [sem], [exam], [pass], [active]) VALUES (2034, 1012, 1, 1, 0, 1, 1)
SET IDENTITY_INSERT [dbo].[Subjects] OFF
SET IDENTITY_INSERT [dbo].[Teachers] ON 

INSERT [dbo].[Teachers] ([id], [lastName], [firstName], [patronymic], [discipline], [department], [teacherStatus]) VALUES (1, N'Тышкевич', N'Антон', N'Игоревич', 1, 1, 7)
INSERT [dbo].[Teachers] ([id], [lastName], [firstName], [patronymic], [discipline], [department], [teacherStatus]) VALUES (2, N'Александрова', N'Ольга', N'Всеволодовна', 4, 1, 7)
INSERT [dbo].[Teachers] ([id], [lastName], [firstName], [patronymic], [discipline], [department], [teacherStatus]) VALUES (3, N'Шаляпин', N'Владимир', N'Валентинович', 7, 1, 8)
INSERT [dbo].[Teachers] ([id], [lastName], [firstName], [patronymic], [discipline], [department], [teacherStatus]) VALUES (4, N'Вишневская', N'Татьяна', N'Александровна', 5, 1, 7)
INSERT [dbo].[Teachers] ([id], [lastName], [firstName], [patronymic], [discipline], [department], [teacherStatus]) VALUES (5, N'Анисина', N'Наталья', N'Викторовна', 8, 2, 7)
INSERT [dbo].[Teachers] ([id], [lastName], [firstName], [patronymic], [discipline], [department], [teacherStatus]) VALUES (6, N'Попов', N'Сергей', N'Сергеевич', 2, 2, 7)
INSERT [dbo].[Teachers] ([id], [lastName], [firstName], [patronymic], [discipline], [department], [teacherStatus]) VALUES (7, N'Котляров', N'Всеволод', N'Павлович', 2, 2, 9)
INSERT [dbo].[Teachers] ([id], [lastName], [firstName], [patronymic], [discipline], [department], [teacherStatus]) VALUES (8, N'Хромов', N'Валентин', N'Васильевич', 6, 3, 7)
INSERT [dbo].[Teachers] ([id], [lastName], [firstName], [patronymic], [discipline], [department], [teacherStatus]) VALUES (9, N'Воскобойников', N'Сергей', N'Петрович', 1, 3, 7)
INSERT [dbo].[Teachers] ([id], [lastName], [firstName], [patronymic], [discipline], [department], [teacherStatus]) VALUES (10, N'Зайцев', N'Игорь', N'Владимирович', 8, 4, 9)
INSERT [dbo].[Teachers] ([id], [lastName], [firstName], [patronymic], [discipline], [department], [teacherStatus]) VALUES (11, N'Молодяков', N'Сергей', N'Александрович', 6, 1, 7)
INSERT [dbo].[Teachers] ([id], [lastName], [firstName], [patronymic], [discipline], [department], [teacherStatus]) VALUES (12, N'Федоров', N'Федор', N'Федорович', 9, 1, 7)
INSERT [dbo].[Teachers] ([id], [lastName], [firstName], [patronymic], [discipline], [department], [teacherStatus]) VALUES (13, N'Иночкин', N'Валерий', N'Михайлович', 8, 1, 7)
INSERT [dbo].[Teachers] ([id], [lastName], [firstName], [patronymic], [discipline], [department], [teacherStatus]) VALUES (14, N'Солева', N'Антонина', N'Валентиновна', 1, 1, 7)
INSERT [dbo].[Teachers] ([id], [lastName], [firstName], [patronymic], [discipline], [department], [teacherStatus]) VALUES (16, N'Петров', N'Александр', N'Владимирович', 1, 3, 7)
INSERT [dbo].[Teachers] ([id], [lastName], [firstName], [patronymic], [discipline], [department], [teacherStatus]) VALUES (25, N'Зайцев', N'Игорь', N'Владимирович', 12, 1, 9)
SET IDENTITY_INSERT [dbo].[Teachers] OFF
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Departme__90A6A2BA13ACA860]    Script Date: 30.06.2018 20:03:20 ******/
ALTER TABLE [dbo].[Departments] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC,
	[active] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Discipli__72E12F1B5806B7FC]    Script Date: 30.06.2018 20:03:20 ******/
ALTER TABLE [dbo].[Disciplines] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Groups__40F4E58ADA553D38]    Script Date: 30.06.2018 20:03:20 ******/
ALTER TABLE [dbo].[Groups] ADD UNIQUE NONCLUSTERED 
(
	[number] ASC,
	[sem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Semester__38E0B0EAF999C172]    Script Date: 30.06.2018 20:03:20 ******/
ALTER TABLE [dbo].[Semesters] ADD UNIQUE NONCLUSTERED 
(
	[beginDate] ASC,
	[endDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [UQ__Statuses__11B738877BB67483]    Script Date: 30.06.2018 20:03:20 ******/
ALTER TABLE [dbo].[Statuses] ADD UNIQUE NONCLUSTERED 
(
	[entity] ASC,
	[statusStr] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__Subjects__6BC45573551AFC1C]    Script Date: 30.06.2018 20:03:20 ******/
ALTER TABLE [dbo].[Subjects] ADD UNIQUE NONCLUSTERED 
(
	[discipline] ASC,
	[department] ASC,
	[sem] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Attestation]  WITH CHECK ADD FOREIGN KEY([student])
REFERENCES [dbo].[Students] ([id])
GO
ALTER TABLE [dbo].[Attestation]  WITH CHECK ADD FOREIGN KEY([subj])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[Attestation]  WITH CHECK ADD FOREIGN KEY([sem])
REFERENCES [dbo].[Semesters] ([id])
GO
ALTER TABLE [dbo].[ExamsCredits]  WITH CHECK ADD FOREIGN KEY([student])
REFERENCES [dbo].[Students] ([id])
GO
ALTER TABLE [dbo].[ExamsCredits]  WITH CHECK ADD FOREIGN KEY([teacher])
REFERENCES [dbo].[Teachers] ([id])
GO
ALTER TABLE [dbo].[ExamsCredits]  WITH CHECK ADD FOREIGN KEY([subj])
REFERENCES [dbo].[Subjects] ([id])
GO
ALTER TABLE [dbo].[ExamsCredits]  WITH CHECK ADD FOREIGN KEY([sem])
REFERENCES [dbo].[Semesters] ([id])
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD FOREIGN KEY([department])
REFERENCES [dbo].[Departments] ([id])
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD FOREIGN KEY([sem])
REFERENCES [dbo].[Semesters] ([id])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([groupNumber])
REFERENCES [dbo].[Groups] ([id])
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD FOREIGN KEY([studentStatus])
REFERENCES [dbo].[Statuses] ([id])
GO
ALTER TABLE [dbo].[Subjects]  WITH CHECK ADD FOREIGN KEY([department])
REFERENCES [dbo].[Departments] ([id])
GO
ALTER TABLE [dbo].[Subjects]  WITH CHECK ADD FOREIGN KEY([discipline])
REFERENCES [dbo].[Disciplines] ([id])
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD FOREIGN KEY([department])
REFERENCES [dbo].[Departments] ([id])
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD FOREIGN KEY([discipline])
REFERENCES [dbo].[Disciplines] ([id])
GO
ALTER TABLE [dbo].[Teachers]  WITH CHECK ADD FOREIGN KEY([teacherStatus])
REFERENCES [dbo].[Statuses] ([id])
GO
ALTER TABLE [dbo].[ExamsCredits]  WITH CHECK ADD CHECK  (([examMark]>=(2) AND [examMark]<=(5)))
GO
ALTER TABLE [dbo].[Groups]  WITH CHECK ADD CHECK  (([semNum]>=(1) AND [semNum]<=(6)))
GO
ALTER TABLE [dbo].[Subjects]  WITH CHECK ADD CHECK  (([sem]>=(1) AND [sem]<=(6)))
GO
USE [master]
GO
ALTER DATABASE [DeanOffice] SET  READ_WRITE 
GO
