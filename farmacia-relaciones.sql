USE [master]
GO
/****** Object:  Database [Farmacia ]    Script Date: 07/10/2017 09:52:29 a.m. ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Farmacia ')
BEGIN
CREATE DATABASE [Farmacia ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Farmacia', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Farmacia .mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Farmacia _log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Farmacia _log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [Farmacia ] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Farmacia ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Farmacia ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Farmacia ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Farmacia ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Farmacia ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Farmacia ] SET ARITHABORT OFF 
GO
ALTER DATABASE [Farmacia ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Farmacia ] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Farmacia ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Farmacia ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Farmacia ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Farmacia ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Farmacia ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Farmacia ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Farmacia ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Farmacia ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Farmacia ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Farmacia ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Farmacia ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Farmacia ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Farmacia ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Farmacia ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Farmacia ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Farmacia ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Farmacia ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Farmacia ] SET  MULTI_USER 
GO
ALTER DATABASE [Farmacia ] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Farmacia ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Farmacia ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Farmacia ] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Farmacia ]
GO
/****** Object:  Table [dbo].[Consulta]    Script Date: 07/10/2017 09:52:29 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Consulta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Consulta](
	[IdConsulta] [uniqueidentifier] NOT NULL,
	[IdPaciente] [uniqueidentifier] NOT NULL,
	[IdMedico] [uniqueidentifier] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
	[IdFecha] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[HistorialMedico]    Script Date: 07/10/2017 09:52:29 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HistorialMedico]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HistorialMedico](
	[IdHistoralMedico] [uniqueidentifier] NOT NULL,
	[IdPaciente] [uniqueidentifier] NOT NULL,
	[IdTratamiento] [uniqueidentifier] NOT NULL,
	[IdMedico] [uniqueidentifier] NOT NULL,
	[FechaDiagnostico] [date] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 07/10/2017 09:52:29 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Medico]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Medico](
	[IdMedico] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](1) NOT NULL,
	[ApPaterno] [varchar](1) NOT NULL,
	[ApMaterno] [varchar](1) NOT NULL,
	[Cedula] [uniqueidentifier] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[paciente]    Script Date: 07/10/2017 09:52:29 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[paciente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[paciente](
	[IdPaciente] [uniqueidentifier] NOT NULL,
	[nombre] [varchar](1) NOT NULL,
	[ApPaterno] [varchar](1) NOT NULL,
	[ApMaterno] [varchar](1) NOT NULL,
	[Edad] [int] NOT NULL,
	[Peso] [int] NOT NULL,
	[Altura] [int] NOT NULL,
	[FechaNa] [date] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tratamiento]    Script Date: 07/10/2017 09:52:29 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[tratamiento]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[tratamiento](
	[Idtratamiento] [uniqueidentifier] NOT NULL,
	[nombre] [varchar](1) NOT NULL,
	[Idproducto] [uniqueidentifier] NOT NULL,
	[Duracion] [int] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [Farmacia ] SET  READ_WRITE 
GO
