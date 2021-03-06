USE [master]
GO
/****** Object:  Database [Farmacia]    Script Date: 21-10-17 3:58:31 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Farmacia')
BEGIN
CREATE DATABASE [Farmacia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Farmacia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Farmacia.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Farmacia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Farmacia_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [Farmacia] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Farmacia].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Farmacia] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Farmacia] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Farmacia] SET ARITHABORT OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Farmacia] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Farmacia] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Farmacia] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Farmacia] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Farmacia] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Farmacia] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Farmacia] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Farmacia] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Farmacia] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Farmacia] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Farmacia] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Farmacia] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Farmacia] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Farmacia] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Farmacia] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Farmacia] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Farmacia] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Farmacia] SET  MULTI_USER 
GO
ALTER DATABASE [Farmacia] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Farmacia] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Farmacia] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Farmacia] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Farmacia] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Farmacia]
GO
/****** Object:  Table [dbo].[Consulta]    Script Date: 21-10-17 3:58:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Consulta]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Consulta](
	[IdConsulta] [uniqueidentifier] NOT NULL,
	[IdPaciente] [uniqueidentifier] NOT NULL,
	[IdMedico] [uniqueidentifier] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Hora] [time](7) NOT NULL,
	[IdConsultorio] [uniqueidentifier] NOT NULL,
	[IdEstatus] [uniqueidentifier] NOT NULL,
	[Costo] [float] NOT NULL,
	[Descripcion] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdConsulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Consultorio]    Script Date: 21-10-17 3:58:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Consultorio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Consultorio](
	[IdConsultorio] [uniqueidentifier] NOT NULL,
	[IdSucursal] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdConsultorio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Estatus]    Script Date: 21-10-17 3:58:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Estatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Estatus](
	[IdEstatus] [uniqueidentifier] NOT NULL,
	[Estatus] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEstatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[HistorialMedico]    Script Date: 21-10-17 3:58:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[HistorialMedico]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[HistorialMedico](
	[IdHistorialMedico] [uniqueidentifier] NOT NULL,
	[IdPaciente] [uniqueidentifier] NOT NULL,
	[IdPadecimiento] [uniqueidentifier] NOT NULL,
	[IdMedico] [uniqueidentifier] NOT NULL,
	[FechaDiagnostico] [date] NOT NULL,
	[Notas] [varchar](255) NOT NULL,
 CONSTRAINT [PK_HistorialMedico] PRIMARY KEY CLUSTERED 
(
	[IdHistorialMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Laboratorio]    Script Date: 21-10-17 3:58:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratorio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Laboratorio](
	[IdLaboratorio] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Licencia] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLaboratorio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Medicamento]    Script Date: 21-10-17 3:58:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Medicamento]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Medicamento](
	[IdMedicamento] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Descripcion] [varchar](255) NOT NULL,
	[IdProvedor] [uniqueidentifier] NOT NULL,
	[PrecioBase] [float] NOT NULL,
	[IdLaboratorio] [uniqueidentifier] NOT NULL,
	[NomGernerico] [varchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMedicamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 21-10-17 3:58:31 ******/
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
	[Cedula] [int] NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Apellidos] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MedSucursal]    Script Date: 21-10-17 3:58:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedSucursal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedSucursal](
	[IdMedicamento] [uniqueidentifier] NOT NULL,
	[IdSucursal] [uniqueidentifier] NOT NULL,
	[Cantidad] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 21-10-17 3:58:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paciente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Paciente](
	[IdPaciente] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Apellidos] [varchar](255) NOT NULL,
	[Edad] [int] NOT NULL,
	[peso] [float] NOT NULL,
	[altura] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Padecimient]    Script Date: 21-10-17 3:58:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Padecimient]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Padecimient](
	[IdPadecimiento] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Descripcion] [varchar](255) NOT NULL,
 CONSTRAINT [PK_Padecimient] PRIMARY KEY CLUSTERED 
(
	[IdPadecimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 21-10-17 3:58:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proveedor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Proveedor](
	[IdProveedor] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[RFC] [int] NOT NULL,
 CONSTRAINT [PK_Proveedor] PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 21-10-17 3:58:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sucursal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sucursal](
	[IdSucursal] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Consulta_Consultorio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_Consultorio] FOREIGN KEY([IdConsultorio])
REFERENCES [dbo].[Consultorio] ([IdConsultorio])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Consulta_Consultorio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [FK_Consulta_Consultorio]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Consulta_Estatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_Estatus] FOREIGN KEY([IdEstatus])
REFERENCES [dbo].[Estatus] ([IdEstatus])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Consulta_Estatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [FK_Consulta_Estatus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Consulta_Medico]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_Medico] FOREIGN KEY([IdMedico])
REFERENCES [dbo].[Medico] ([IdMedico])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Consulta_Medico]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [FK_Consulta_Medico]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Consulta_Paciente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_Paciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdPaciente])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Consulta_Paciente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [FK_Consulta_Paciente]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Consultorio_Sucursal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consultorio]'))
ALTER TABLE [dbo].[Consultorio]  WITH CHECK ADD  CONSTRAINT [FK_Consultorio_Sucursal] FOREIGN KEY([IdConsultorio])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Consultorio_Sucursal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consultorio]'))
ALTER TABLE [dbo].[Consultorio] CHECK CONSTRAINT [FK_Consultorio_Sucursal]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistorialMedico_Medico]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistorialMedico]'))
ALTER TABLE [dbo].[HistorialMedico]  WITH CHECK ADD  CONSTRAINT [FK_HistorialMedico_Medico] FOREIGN KEY([IdMedico])
REFERENCES [dbo].[Medico] ([IdMedico])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistorialMedico_Medico]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistorialMedico]'))
ALTER TABLE [dbo].[HistorialMedico] CHECK CONSTRAINT [FK_HistorialMedico_Medico]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistorialMedico_Paciente]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistorialMedico]'))
ALTER TABLE [dbo].[HistorialMedico]  WITH CHECK ADD  CONSTRAINT [FK_HistorialMedico_Paciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdPaciente])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistorialMedico_Paciente]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistorialMedico]'))
ALTER TABLE [dbo].[HistorialMedico] CHECK CONSTRAINT [FK_HistorialMedico_Paciente]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistorialMedico_Padecimient]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistorialMedico]'))
ALTER TABLE [dbo].[HistorialMedico]  WITH CHECK ADD  CONSTRAINT [FK_HistorialMedico_Padecimient] FOREIGN KEY([IdPadecimiento])
REFERENCES [dbo].[Padecimient] ([IdPadecimiento])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistorialMedico_Padecimient]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistorialMedico]'))
ALTER TABLE [dbo].[HistorialMedico] CHECK CONSTRAINT [FK_HistorialMedico_Padecimient]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Medicamento_Laboratorio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Medicamento]'))
ALTER TABLE [dbo].[Medicamento]  WITH CHECK ADD  CONSTRAINT [FK_Medicamento_Laboratorio] FOREIGN KEY([IdLaboratorio])
REFERENCES [dbo].[Laboratorio] ([IdLaboratorio])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Medicamento_Laboratorio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Medicamento]'))
ALTER TABLE [dbo].[Medicamento] CHECK CONSTRAINT [FK_Medicamento_Laboratorio]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Medicamento_Proveedor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Medicamento]'))
ALTER TABLE [dbo].[Medicamento]  WITH CHECK ADD  CONSTRAINT [FK_Medicamento_Proveedor] FOREIGN KEY([IdProvedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Medicamento_Proveedor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Medicamento]'))
ALTER TABLE [dbo].[Medicamento] CHECK CONSTRAINT [FK_Medicamento_Proveedor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MedSucursal_Medicamento]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedSucursal]'))
ALTER TABLE [dbo].[MedSucursal]  WITH CHECK ADD  CONSTRAINT [FK_MedSucursal_Medicamento] FOREIGN KEY([IdMedicamento])
REFERENCES [dbo].[Medicamento] ([IdMedicamento])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MedSucursal_Medicamento]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedSucursal]'))
ALTER TABLE [dbo].[MedSucursal] CHECK CONSTRAINT [FK_MedSucursal_Medicamento]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MedSucursal_Sucursal]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedSucursal]'))
ALTER TABLE [dbo].[MedSucursal]  WITH CHECK ADD  CONSTRAINT [FK_MedSucursal_Sucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MedSucursal_Sucursal]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedSucursal]'))
ALTER TABLE [dbo].[MedSucursal] CHECK CONSTRAINT [FK_MedSucursal_Sucursal]
GO
USE [master]
GO
ALTER DATABASE [Farmacia] SET  READ_WRITE 
GO
