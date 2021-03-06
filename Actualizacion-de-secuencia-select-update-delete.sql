USE [master]
GO
/****** Object:  Database [Farmacia]    Script Date: 28-10-17 2:33:52 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'Farmacia')
BEGIN
CREATE DATABASE [Farmacia]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Farmacia', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Farmacia.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Farmacia_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Farmacia_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
ALTER DATABASE [Farmacia] SET AUTO_CLOSE OFF 
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
ALTER DATABASE [Farmacia] SET  DISABLE_BROKER 
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
/****** Object:  Table [dbo].[Consulta]    Script Date: 28-10-17 2:33:52 ******/
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
/****** Object:  Table [dbo].[Consultorio]    Script Date: 28-10-17 2:33:52 ******/
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
/****** Object:  Table [dbo].[CorreoMedico]    Script Date: 28-10-17 2:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CorreoMedico]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CorreoMedico](
	[IdMedico] [uniqueidentifier] NOT NULL,
	[Correo] [varchar](255) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CorreoPaciente]    Script Date: 28-10-17 2:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CorreoPaciente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CorreoPaciente](
	[IdPaciente] [uniqueidentifier] NOT NULL,
	[Correo] [varchar](1) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estatus]    Script Date: 28-10-17 2:33:52 ******/
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
/****** Object:  Table [dbo].[HistorialMedico]    Script Date: 28-10-17 2:33:52 ******/
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
PRIMARY KEY CLUSTERED 
(
	[IdHistorialMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Laboratorio]    Script Date: 28-10-17 2:33:52 ******/
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
/****** Object:  Table [dbo].[Medicamento]    Script Date: 28-10-17 2:33:52 ******/
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
	[IdProveedor] [uniqueidentifier] NOT NULL,
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
/****** Object:  Table [dbo].[Medico]    Script Date: 28-10-17 2:33:52 ******/
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
/****** Object:  Table [dbo].[MedSucursal]    Script Date: 28-10-17 2:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedSucursal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedSucursal](
	[IdSucursal] [uniqueidentifier] NULL,
	[IdMedicamento] [uniqueidentifier] NULL,
	[Cantidad] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 28-10-17 2:33:52 ******/
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
/****** Object:  Table [dbo].[Padecimiento]    Script Date: 28-10-17 2:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Padecimiento]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Padecimiento](
	[IdPadecimiento] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Descripcion] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPadecimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 28-10-17 2:33:52 ******/
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
PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 28-10-17 2:33:52 ******/
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
/****** Object:  Table [dbo].[TelefonoPaciente]    Script Date: 28-10-17 2:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TelefonoPaciente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TelefonoPaciente](
	[IdPaciente] [uniqueidentifier] NOT NULL,
	[Telefono] [int] NOT NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[TelfenoMedico]    Script Date: 28-10-17 2:33:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TelfenoMedico]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TelfenoMedico](
	[IdMedico] [uniqueidentifier] NOT NULL,
	[Telefono] [int] NOT NULL
) ON [PRIMARY]
END
GO
INSERT [dbo].[Consulta] ([IdConsulta], [IdPaciente], [IdMedico], [Fecha], [Hora], [IdConsultorio], [IdEstatus], [Costo], [Descripcion]) VALUES (N'c4091f6c-8787-41ba-a36a-56faeb8131f5', N'14792b77-f7e0-40c2-b7f0-a8d28fc46dd3', N'267e0bf6-1c2e-4bdb-b247-f7aee777a262', CAST(N'2017-07-05' AS Date), CAST(N'10:00:00.1923000' AS Time), N'49222854-5187-4c0b-9153-99843678ee4a', N'482824d0-0405-4d92-998b-f386bb583f78', 89, N'el costo de la consuolta es cara')
INSERT [dbo].[Consulta] ([IdConsulta], [IdPaciente], [IdMedico], [Fecha], [Hora], [IdConsultorio], [IdEstatus], [Costo], [Descripcion]) VALUES (N'd9497165-d5d5-4b6b-8358-7f254b89e469', N'50112074-0ebb-4ced-a687-24ca2d380b70', N'10691e0d-a44b-42ac-8e83-19d1b3edbd0e', CAST(N'2017-12-10' AS Date), CAST(N'10:30:00' AS Time), N'b88c9a4c-0db8-4e05-b89e-6fe1949455cf', N'93a5875a-3b15-4fc3-8ba4-9b9a70855507', 89, N'el costo de la consuolta es cara')
INSERT [dbo].[Consultorio] ([IdConsultorio], [IdSucursal]) VALUES (N'b88c9a4c-0db8-4e05-b89e-6fe1949455cf', N'839d9496-c895-4b32-b382-ff07a1a74900')
INSERT [dbo].[Consultorio] ([IdConsultorio], [IdSucursal]) VALUES (N'49222854-5187-4c0b-9153-99843678ee4a', N'839d9496-c895-4b32-b382-ff07a1a74900')
INSERT [dbo].[CorreoMedico] ([IdMedico], [Correo]) VALUES (N'267e0bf6-1c2e-4bdb-b247-f7aee777a262', N'laura@gmail.com')
INSERT [dbo].[CorreoMedico] ([IdMedico], [Correo]) VALUES (N'267e0bf6-1c2e-4bdb-b247-f7aee777a262', N'laura.11@hotmail.com')
INSERT [dbo].[CorreoMedico] ([IdMedico], [Correo]) VALUES (N'267e0bf6-1c2e-4bdb-b247-f7aee777a262', N'laura_rifa@outlook')
INSERT [dbo].[CorreoMedico] ([IdMedico], [Correo]) VALUES (N'10691e0d-a44b-42ac-8e83-19d1b3edbd0e', N'Alonso_cero@gmail.com')
INSERT [dbo].[Estatus] ([IdEstatus], [Estatus]) VALUES (N'93a5875a-3b15-4fc3-8ba4-9b9a70855507', N'salida')
INSERT [dbo].[Estatus] ([IdEstatus], [Estatus]) VALUES (N'482824d0-0405-4d92-998b-f386bb583f78', N'Terminal')
INSERT [dbo].[HistorialMedico] ([IdHistorialMedico], [IdPaciente], [IdPadecimiento], [IdMedico], [FechaDiagnostico], [Notas]) VALUES (N'18d6e5da-a41f-4cbd-8bb3-b03eb6f9c75a', N'50112074-0ebb-4ced-a687-24ca2d380b70', N'6b93bfce-4503-4fb9-85d0-685f36b6b3bd', N'10691e0d-a44b-42ac-8e83-19d1b3edbd0e', CAST(N'2017-08-05' AS Date), N'probre del chavo')
INSERT [dbo].[HistorialMedico] ([IdHistorialMedico], [IdPaciente], [IdPadecimiento], [IdMedico], [FechaDiagnostico], [Notas]) VALUES (N'69ad5619-b6a1-46cc-865a-bc336f5b1df1', N'14792b77-f7e0-40c2-b7f0-a8d28fc46dd3', N'6b93bfce-4503-4fb9-85d0-685f36b6b3bd', N'10691e0d-a44b-42ac-8e83-19d1b3edbd0e', CAST(N'2017-12-09' AS Date), N'su primera cita')
INSERT [dbo].[HistorialMedico] ([IdHistorialMedico], [IdPaciente], [IdPadecimiento], [IdMedico], [FechaDiagnostico], [Notas]) VALUES (N'4c15be3e-e09f-4ef6-bd91-c85d6feb6bd0', N'50112074-0ebb-4ced-a687-24ca2d380b70', N'6b93bfce-4503-4fb9-85d0-685f36b6b3bd', N'10691e0d-a44b-42ac-8e83-19d1b3edbd0e', CAST(N'2017-08-10' AS Date), N'no se pudo hacer nada ya con este paciente lo sentimos.')
INSERT [dbo].[HistorialMedico] ([IdHistorialMedico], [IdPaciente], [IdPadecimiento], [IdMedico], [FechaDiagnostico], [Notas]) VALUES (N'b2afcad9-ae6a-4efb-afdc-d6dd2527d85e', N'50112074-0ebb-4ced-a687-24ca2d380b70', N'6b93bfce-4503-4fb9-85d0-685f36b6b3bd', N'10691e0d-a44b-42ac-8e83-19d1b3edbd0e', CAST(N'2017-05-05' AS Date), N'probre del chavo')
INSERT [dbo].[HistorialMedico] ([IdHistorialMedico], [IdPaciente], [IdPadecimiento], [IdMedico], [FechaDiagnostico], [Notas]) VALUES (N'667f9e52-23cc-4bd6-9ced-dfbbde622d94', N'14792b77-f7e0-40c2-b7f0-a8d28fc46dd3', N'6b93bfce-4503-4fb9-85d0-685f36b6b3bd', N'10691e0d-a44b-42ac-8e83-19d1b3edbd0e', CAST(N'2017-08-09' AS Date), N'su primera cita')
INSERT [dbo].[Laboratorio] ([IdLaboratorio], [Nombre], [Licencia]) VALUES (N'47af84fb-5309-4a28-aee7-32216c6fc732', N'Netor', 183954)
INSERT [dbo].[Laboratorio] ([IdLaboratorio], [Nombre], [Licencia]) VALUES (N'8b2907be-00bc-4c63-a193-a6109e7abd4a', N'Reform', 77474)
INSERT [dbo].[Laboratorio] ([IdLaboratorio], [Nombre], [Licencia]) VALUES (N'33bc5b47-4e08-44bc-94de-cf538e53ede1', N'Fedor', 19284)
INSERT [dbo].[Medicamento] ([IdMedicamento], [Nombre], [Descripcion], [IdProveedor], [PrecioBase], [IdLaboratorio], [NomGernerico]) VALUES (N'd425f1b2-0434-402e-a4f3-a39f04671dc5', N'treda', N'cura malestares estomacales', N'c898ea11-487b-4393-81b3-98c0fab586ed', 15, N'47af84fb-5309-4a28-aee7-32216c6fc732', N'e')
INSERT [dbo].[Medicamento] ([IdMedicamento], [Nombre], [Descripcion], [IdProveedor], [PrecioBase], [IdLaboratorio], [NomGernerico]) VALUES (N'bfcf88ee-0f73-45d3-8b35-d8af99cd8812', N'trida', N'cura malestares mentales', N'c898ea11-487b-4393-81b3-98c0fab586ed', 15, N'47af84fb-5309-4a28-aee7-32216c6fc732', N't')
INSERT [dbo].[Medico] ([IdMedico], [Cedula], [Nombre], [Apellidos]) VALUES (N'10691e0d-a44b-42ac-8e83-19d1b3edbd0e', 222, N'Alonso', N'Morales ramirez')
INSERT [dbo].[Medico] ([IdMedico], [Cedula], [Nombre], [Apellidos]) VALUES (N'267e0bf6-1c2e-4bdb-b247-f7aee777a262', 666, N'Laura', N'Rufo Martinez')
INSERT [dbo].[MedSucursal] ([IdSucursal], [IdMedicamento], [Cantidad]) VALUES (N'8ba53b71-4c46-4653-9e1d-3aaa02993d12', N'bfcf88ee-0f73-45d3-8b35-d8af99cd8812', 22)
INSERT [dbo].[MedSucursal] ([IdSucursal], [IdMedicamento], [Cantidad]) VALUES (N'8ba53b71-4c46-4653-9e1d-3aaa02993d12', N'd425f1b2-0434-402e-a4f3-a39f04671dc5', 22)
INSERT [dbo].[MedSucursal] ([IdSucursal], [IdMedicamento], [Cantidad]) VALUES (N'8ba53b71-4c46-4653-9e1d-3aaa02993d12', N'bfcf88ee-0f73-45d3-8b35-d8af99cd8812', 22)
INSERT [dbo].[MedSucursal] ([IdSucursal], [IdMedicamento], [Cantidad]) VALUES (N'839d9496-c895-4b32-b382-ff07a1a74900', N'd425f1b2-0434-402e-a4f3-a39f04671dc5', 33)
INSERT [dbo].[MedSucursal] ([IdSucursal], [IdMedicamento], [Cantidad]) VALUES (N'839d9496-c895-4b32-b382-ff07a1a74900', N'bfcf88ee-0f73-45d3-8b35-d8af99cd8812', 10)
INSERT [dbo].[Paciente] ([IdPaciente], [Nombre], [Apellidos], [Edad], [peso], [altura]) VALUES (N'50112074-0ebb-4ced-a687-24ca2d380b70', N'Jose', N'Carrizales', 23, 88.2, 1.8)
INSERT [dbo].[Paciente] ([IdPaciente], [Nombre], [Apellidos], [Edad], [peso], [altura]) VALUES (N'14792b77-f7e0-40c2-b7f0-a8d28fc46dd3', N'Arturo', N'Alvaro Lopez', 44, 68.33, 1.6)
INSERT [dbo].[Padecimiento] ([IdPadecimiento], [Nombre], [Descripcion]) VALUES (N'6b93bfce-4503-4fb9-85d0-685f36b6b3bd', N'VIH', N'enfermedad terminal')
INSERT [dbo].[Padecimiento] ([IdPadecimiento], [Nombre], [Descripcion]) VALUES (N'6b6a2666-0ebd-43b6-90f2-d0ca8cbd302e', N'Gripe', N'escurrimiento nasal')
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [RFC]) VALUES (N'c898ea11-487b-4393-81b3-98c0fab586ed', N'Honestech', 475647)
INSERT [dbo].[Proveedor] ([IdProveedor], [Nombre], [RFC]) VALUES (N'371e4e67-a9e4-441f-a5a3-ac90ccd3e18e', N'Sunset', 12884)
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre]) VALUES (N'8ba53b71-4c46-4653-9e1d-3aaa02993d12', N'Infoteca')
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre]) VALUES (N'839d9496-c895-4b32-b382-ff07a1a74900', N'Tolko')
INSERT [dbo].[TelefonoPaciente] ([IdPaciente], [Telefono]) VALUES (N'50112074-0ebb-4ced-a687-24ca2d380b70', 1223993)
INSERT [dbo].[TelefonoPaciente] ([IdPaciente], [Telefono]) VALUES (N'14792b77-f7e0-40c2-b7f0-a8d28fc46dd3', 19394933)
INSERT [dbo].[TelfenoMedico] ([IdMedico], [Telefono]) VALUES (N'10691e0d-a44b-42ac-8e83-19d1b3edbd0e', 8181818)
INSERT [dbo].[TelfenoMedico] ([IdMedico], [Telefono]) VALUES (N'267e0bf6-1c2e-4bdb-b247-f7aee777a262', 1334445)
INSERT [dbo].[TelfenoMedico] ([IdMedico], [Telefono]) VALUES (N'10691e0d-a44b-42ac-8e83-19d1b3edbd0e', 8181818)
INSERT [dbo].[TelfenoMedico] ([IdMedico], [Telefono]) VALUES (N'267e0bf6-1c2e-4bdb-b247-f7aee777a262', 1334445)
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Consulta_IdConsultorio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_IdConsultorio] FOREIGN KEY([IdConsultorio])
REFERENCES [dbo].[Consultorio] ([IdConsultorio])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Consulta_IdConsultorio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [FK_Consulta_IdConsultorio]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Consulta_IdEstatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_IdEstatus] FOREIGN KEY([IdEstatus])
REFERENCES [dbo].[Estatus] ([IdEstatus])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Consulta_IdEstatus]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [FK_Consulta_IdEstatus]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Consulta_IdMedico]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_IdMedico] FOREIGN KEY([IdMedico])
REFERENCES [dbo].[Medico] ([IdMedico])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Consulta_IdMedico]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [FK_Consulta_IdMedico]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Consulta_IdPaciente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta]  WITH CHECK ADD  CONSTRAINT [FK_Consulta_IdPaciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdPaciente])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Consulta_IdPaciente]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consulta]'))
ALTER TABLE [dbo].[Consulta] CHECK CONSTRAINT [FK_Consulta_IdPaciente]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Consultorio_IdSucursal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consultorio]'))
ALTER TABLE [dbo].[Consultorio]  WITH CHECK ADD  CONSTRAINT [FK_Consultorio_IdSucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Consultorio_IdSucursal]') AND parent_object_id = OBJECT_ID(N'[dbo].[Consultorio]'))
ALTER TABLE [dbo].[Consultorio] CHECK CONSTRAINT [FK_Consultorio_IdSucursal]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CorreoMedico_IdMedico]') AND parent_object_id = OBJECT_ID(N'[dbo].[CorreoMedico]'))
ALTER TABLE [dbo].[CorreoMedico]  WITH CHECK ADD  CONSTRAINT [FK_CorreoMedico_IdMedico] FOREIGN KEY([IdMedico])
REFERENCES [dbo].[Medico] ([IdMedico])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CorreoMedico_IdMedico]') AND parent_object_id = OBJECT_ID(N'[dbo].[CorreoMedico]'))
ALTER TABLE [dbo].[CorreoMedico] CHECK CONSTRAINT [FK_CorreoMedico_IdMedico]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CorreoEmpleado_IdPaciente]') AND parent_object_id = OBJECT_ID(N'[dbo].[CorreoPaciente]'))
ALTER TABLE [dbo].[CorreoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_CorreoEmpleado_IdPaciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdPaciente])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CorreoEmpleado_IdPaciente]') AND parent_object_id = OBJECT_ID(N'[dbo].[CorreoPaciente]'))
ALTER TABLE [dbo].[CorreoPaciente] CHECK CONSTRAINT [FK_CorreoEmpleado_IdPaciente]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistorialMedico_IdMedico]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistorialMedico]'))
ALTER TABLE [dbo].[HistorialMedico]  WITH CHECK ADD  CONSTRAINT [FK_HistorialMedico_IdMedico] FOREIGN KEY([IdMedico])
REFERENCES [dbo].[Medico] ([IdMedico])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistorialMedico_IdMedico]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistorialMedico]'))
ALTER TABLE [dbo].[HistorialMedico] CHECK CONSTRAINT [FK_HistorialMedico_IdMedico]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistorialMedico_IdPaciente]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistorialMedico]'))
ALTER TABLE [dbo].[HistorialMedico]  WITH CHECK ADD  CONSTRAINT [FK_HistorialMedico_IdPaciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdPaciente])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistorialMedico_IdPaciente]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistorialMedico]'))
ALTER TABLE [dbo].[HistorialMedico] CHECK CONSTRAINT [FK_HistorialMedico_IdPaciente]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistorialMedico_IdPadecimiento]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistorialMedico]'))
ALTER TABLE [dbo].[HistorialMedico]  WITH CHECK ADD  CONSTRAINT [FK_HistorialMedico_IdPadecimiento] FOREIGN KEY([IdPadecimiento])
REFERENCES [dbo].[Padecimiento] ([IdPadecimiento])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_HistorialMedico_IdPadecimiento]') AND parent_object_id = OBJECT_ID(N'[dbo].[HistorialMedico]'))
ALTER TABLE [dbo].[HistorialMedico] CHECK CONSTRAINT [FK_HistorialMedico_IdPadecimiento]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Medicamento_IdLaboratorio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Medicamento]'))
ALTER TABLE [dbo].[Medicamento]  WITH CHECK ADD  CONSTRAINT [FK_Medicamento_IdLaboratorio] FOREIGN KEY([IdLaboratorio])
REFERENCES [dbo].[Laboratorio] ([IdLaboratorio])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Medicamento_IdLaboratorio]') AND parent_object_id = OBJECT_ID(N'[dbo].[Medicamento]'))
ALTER TABLE [dbo].[Medicamento] CHECK CONSTRAINT [FK_Medicamento_IdLaboratorio]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Medicamento_IdProveedor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Medicamento]'))
ALTER TABLE [dbo].[Medicamento]  WITH CHECK ADD  CONSTRAINT [FK_Medicamento_IdProveedor] FOREIGN KEY([IdProveedor])
REFERENCES [dbo].[Proveedor] ([IdProveedor])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Medicamento_IdProveedor]') AND parent_object_id = OBJECT_ID(N'[dbo].[Medicamento]'))
ALTER TABLE [dbo].[Medicamento] CHECK CONSTRAINT [FK_Medicamento_IdProveedor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MedSucursal_IdMedicamento]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedSucursal]'))
ALTER TABLE [dbo].[MedSucursal]  WITH CHECK ADD  CONSTRAINT [FK_MedSucursal_IdMedicamento] FOREIGN KEY([IdMedicamento])
REFERENCES [dbo].[Medicamento] ([IdMedicamento])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MedSucursal_IdMedicamento]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedSucursal]'))
ALTER TABLE [dbo].[MedSucursal] CHECK CONSTRAINT [FK_MedSucursal_IdMedicamento]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MedSucursal_IdSucursal]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedSucursal]'))
ALTER TABLE [dbo].[MedSucursal]  WITH CHECK ADD  CONSTRAINT [FK_MedSucursal_IdSucursal] FOREIGN KEY([IdSucursal])
REFERENCES [dbo].[Sucursal] ([IdSucursal])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MedSucursal_IdSucursal]') AND parent_object_id = OBJECT_ID(N'[dbo].[MedSucursal]'))
ALTER TABLE [dbo].[MedSucursal] CHECK CONSTRAINT [FK_MedSucursal_IdSucursal]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TelefonoPaciente_IdPaciente]') AND parent_object_id = OBJECT_ID(N'[dbo].[TelefonoPaciente]'))
ALTER TABLE [dbo].[TelefonoPaciente]  WITH CHECK ADD  CONSTRAINT [FK_TelefonoPaciente_IdPaciente] FOREIGN KEY([IdPaciente])
REFERENCES [dbo].[Paciente] ([IdPaciente])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TelefonoPaciente_IdPaciente]') AND parent_object_id = OBJECT_ID(N'[dbo].[TelefonoPaciente]'))
ALTER TABLE [dbo].[TelefonoPaciente] CHECK CONSTRAINT [FK_TelefonoPaciente_IdPaciente]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TelefonoMedico_IdMedico]') AND parent_object_id = OBJECT_ID(N'[dbo].[TelfenoMedico]'))
ALTER TABLE [dbo].[TelfenoMedico]  WITH CHECK ADD  CONSTRAINT [FK_TelefonoMedico_IdMedico] FOREIGN KEY([IdMedico])
REFERENCES [dbo].[Medico] ([IdMedico])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TelefonoMedico_IdMedico]') AND parent_object_id = OBJECT_ID(N'[dbo].[TelfenoMedico]'))
ALTER TABLE [dbo].[TelfenoMedico] CHECK CONSTRAINT [FK_TelefonoMedico_IdMedico]
GO
USE [master]
GO
ALTER DATABASE [Farmacia] SET  READ_WRITE 
GO
