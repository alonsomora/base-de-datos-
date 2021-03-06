USE [master]
GO
/****** Object:  Database [ConsulSimi]    Script Date: 11-11-17 21:50:13 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'ConsulSimi')
BEGIN
CREATE DATABASE [ConsulSimi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ConsulSimi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ConsulSimi.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ConsulSimi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\ConsulSimi_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [ConsulSimi] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ConsulSimi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ConsulSimi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ConsulSimi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ConsulSimi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ConsulSimi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ConsulSimi] SET ARITHABORT OFF 
GO
ALTER DATABASE [ConsulSimi] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [ConsulSimi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ConsulSimi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ConsulSimi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ConsulSimi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ConsulSimi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ConsulSimi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ConsulSimi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ConsulSimi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ConsulSimi] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ConsulSimi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ConsulSimi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ConsulSimi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ConsulSimi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ConsulSimi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ConsulSimi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ConsulSimi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ConsulSimi] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ConsulSimi] SET  MULTI_USER 
GO
ALTER DATABASE [ConsulSimi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ConsulSimi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ConsulSimi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ConsulSimi] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ConsulSimi] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ConsulSimi]
GO
/****** Object:  UserDefinedFunction [dbo].[AguaCorpHom]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AguaCorpHom]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[AguaCorpHom](@Peso float)
returns float
begin
return (0.6 * @Peso)
end' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[AguaCorpMuj]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AguaCorpMuj]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[AguaCorpMuj](@Peso float)
returns float
begin
return (0.5 * @Peso)
end
' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[AlcoholemiaHom]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AlcoholemiaHom]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[AlcoholemiaHom](@GrAlc float, @PesoKg float)
returns float
begin
return (@GrAlc) / (@PesoKg * .7)
end' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[AlcoholemiaMuj]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AlcoholemiaMuj]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[AlcoholemiaMuj](@GrAlc float, @PesoKg float)
returns float
begin
return (@GrAlc) / (@PesoKg * .6)
end' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[CalDisolucionMed]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CalDisolucionMed]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[CalDisolucionMed](@TotalMed float, @Diluyente float, @Dosis float)
returns float
begin 
return (@Dosis * @Diluyente) / @TotalMed
end' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[DescuentoMedicina]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DescuentoMedicina]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[DescuentoMedicina] (@cMed float, @Descuento float)
returns float
begin
return (@cMed) - (@Descuento * @cMed)
end
' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[ImpuestoSal]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ImpuestoSal]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[ImpuestoSal](@Salario float)
returns float
begin
return (@salario) - (@salario * 0.10)
end' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[IndiceTabaquico]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IndiceTabaquico]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[IndiceTabaquico](@cigFumDia int, @añosFumando int)
returns float 
begin
return (@cigFumDia * @añosFumando) / 20
end' 
END

GO
/****** Object:  UserDefinedFunction [dbo].[MIC]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MIC]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
BEGIN
execute dbo.sp_executesql @statement = N'create function [dbo].[MIC](@AltMt float, @Peso float) 
returns float
begin
return (@Peso)/(@Altmt * @Altmt)
end
' 
END

GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Categoria]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Consulta]    Script Date: 11-11-17 21:50:13 ******/
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
	[IdMedico] [int] NULL,
	[FechaHora] [datetime] NOT NULL,
	[IdConsultorio] [int] NULL,
	[IdEstatus] [varchar](50) NOT NULL,
	[Notas] [varchar](300) NULL,
	[Costo] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdConsulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Consultorio]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Consultorio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Consultorio](
	[IdConsultorio] [int] IDENTITY(1,1) NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[NumConsultorio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdConsultorio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[ContactoPersona]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContactoPersona]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ContactoPersona](
	[IdContactoPersona] [uniqueidentifier] NOT NULL,
	[IdPersona] [uniqueidentifier] NOT NULL,
	[Telefono] [float] NOT NULL,
	[Correo] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdContactoPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ContactoSucursal]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ContactoSucursal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ContactoSucursal](
	[IdContactoSucursal] [uniqueidentifier] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[Telefono] [float] NOT NULL,
	[Correo] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdContactoSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DireccionPersona]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DireccionPersona]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DireccionPersona](
	[IdDireccion] [int] IDENTITY(1,1) NOT NULL,
	[IdPersona] [uniqueidentifier] NOT NULL,
	[CalleNum] [varchar](50) NOT NULL,
	[Municipio] [varchar](50) NOT NULL,
	[IdEstado] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DireccionSucursales]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DireccionSucursales]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DireccionSucursales](
	[IdDireccionSucursal] [int] IDENTITY(1,1) NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[CalleNum] [varchar](50) NOT NULL,
	[Municipio] [varchar](50) NOT NULL,
	[IdEstado] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDireccionSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empleado]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empleado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Empleado](
	[IdEmpleado] [uniqueidentifier] NOT NULL,
	[IdPersona] [uniqueidentifier] NOT NULL,
	[Sueldo] [float] NOT NULL,
	[Encargado] [varchar](50) NOT NULL,
	[Contraseña] [varchar](50) NOT NULL,
	[PuestoEmpleado] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empresa]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empresa]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Empresa](
	[IdEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estado]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Estado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Estado](
	[IdDireccion] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Estatus]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Estatus]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Estatus](
	[IdEstatus] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEstatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Laboratorio]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Laboratorio]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Laboratorio](
	[IdLaboratiorio] [int] IDENTITY(1,1) NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[LicenciaLaboratorio] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLaboratiorio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Medicamento]    Script Date: 11-11-17 21:50:13 ******/
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
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[IdLaboratorio] [int] NOT NULL,
	[NombreGen] [varchar](50) NOT NULL,
	[PrecioBase] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMedicamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MedicamentoBorrado]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MedicamentoBorrado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MedicamentoBorrado](
	[IdMedicamentoBorrado] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[IdProveedor] [int] NOT NULL,
	[IdLaboratorio] [int] NOT NULL,
	[NombreGen] [varchar](50) NOT NULL,
	[PrecioBase] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMedicamentoBorrado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Medico]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Medico]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Medico](
	[IdMedico] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [uniqueidentifier] NULL,
	[Cedula] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMedico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OIEmpleados]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[OIEmpleados]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[OIEmpleados](
	[IdOIEmpleados] [uniqueidentifier] NOT NULL,
	[IdEmpleado] [uniqueidentifier] NOT NULL,
	[FechaEntrada] [date] NOT NULL,
	[FechaSalida] [date] NULL
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Paciente]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Paciente](
	[IdPaciente] [uniqueidentifier] NOT NULL,
	[IdPersona] [uniqueidentifier] NOT NULL,
	[Peso] [float] NOT NULL,
	[Altura] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
/****** Object:  Table [dbo].[Persona]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Persona]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Persona](
	[IdPersona] [uniqueidentifier] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[ApPaterno] [varchar](50) NOT NULL,
	[ApMaterno] [varchar](50) NOT NULL,
	[FechaNac] [date] NOT NULL,
	[Edad]  AS (datediff(year,[FechaNac],getdate())),
PRIMARY KEY CLUSTERED 
(
	[IdPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Prescripcion]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Prescripcion]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Prescripcion](
	[IdPrescripcion] [uniqueidentifier] NOT NULL,
	[IdConsulta] [uniqueidentifier] NOT NULL,
	[IdMedicamento] [uniqueidentifier] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Indicaciones] [varchar](300) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPrescripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Proveedor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Proveedor](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[LicenciaProveedor] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PuestoEmpleado]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PuestoEmpleado]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PuestoEmpleado](
	[IdNivelEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[Puesto] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdNivelEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sucursal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sucursal](
	[IdSucursal] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[IdEmpresa] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[categoriaMedicamento]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[categoriaMedicamento]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[categoriaMedicamento] as 
select m.IdMedicamento,m.Nombre,m.PrecioBase,c.IdCategoria,c.Descripcion
from Medicamento m 
inner join Categoria as c on m.IdCategoria=c.IdCategoria' 
GO
/****** Object:  View [dbo].[ComunicacionSucursal]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ComunicacionSucursal]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[ComunicacionSucursal] as 
select t.IdEmpresa,t.IdSucursal,t.Nombre,h.Correo,h.Telefono
from Sucursal t
inner join ContactoSucursal as h on t.IdSucursal=h.IdSucursal ' 
GO
/****** Object:  View [dbo].[ConsultaPaciente]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ConsultaPaciente]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[ConsultaPaciente] as
select k.Nombre,k.ApMaterno,k.ApPaterno,k.Edad,e.IdPaciente,e.Peso,e.Altura,m.IdConsulta,m.FechaHora,m.IdConsultorio,m.Costo,m.Notas
from Consulta m 
inner join Paciente as e on e.IdPaciente = m.IdPaciente
inner join Persona as k on e.IdPersona=k.IdPersona' 
GO
/****** Object:  View [dbo].[direccionPaciente]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[direccionPaciente]'))
EXEC dbo.sp_executesql @statement = N'create view  [dbo].[direccionPaciente] as
select m.IdPersona,m.IdPaciente,p.Nombre,p.ApPaterno,p.ApMaterno,d.CalleNum,d.Municipio,d.IdEstado
from Paciente m 
inner join Persona p on m.IdPersona=p.IdPersona
inner join DireccionPersona as d on p.IdPersona=d.IdPersona' 
GO
/****** Object:  View [dbo].[DireccionSucursal]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[DireccionSucursal]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[DireccionSucursal] as 
select s.Nombre,d.IdSucursal,d.CalleNum,d.IdEstado,d.Municipio 
from Sucursal s
inner join DireccionSucursales as d on s.IdSucursal=d.IdSucursal' 
GO
/****** Object:  View [dbo].[empresaSucursal]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[empresaSucursal]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[empresaSucursal] as
select p.IdEmpresa,p.Nombre,o.IdSucursal,o.Nombre as nombreSucursal
from Empresa as p
inner join Sucursal as o on p.IdEmpresa=o.IdEmpresa' 
GO
/****** Object:  View [dbo].[infoMedico]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[infoMedico]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[infoMedico] as 
select u.Nombre,u.ApPaterno,u.ApMaterno, k.IdMedico,k.IdEmpleado,l.PuestoEmpleado
from Medico k 
inner join Empleado as l on k.IdEmpleado = l.IdEmpleado
inner join Persona as u on l.IdPersona = u.IdPersona' 
GO
/****** Object:  View [dbo].[infoPersona]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[infoPersona]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[infoPersona]	 as
select e.Nombre,e.ApMaterno,e.ApPaterno,v.Peso,v.Altura,k.Telefono,k.Correo
from Persona e
inner join Paciente as v on e.IdPersona = v.IdPersona  
inner join ContactoPersona as k on e.IdPersona = k.IdPersona' 
GO
/****** Object:  View [dbo].[proveedorSucursal]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[proveedorSucursal]'))
EXEC dbo.sp_executesql @statement = N'create view [dbo].[proveedorSucursal] as
select p.IdProveedor,p.LicenciaProveedor,s.IdSucursal,s.IdEmpresa
from Proveedor p
inner join Sucursal as s on p.IdSucursal=s.IdSucursal' 
GO
SET IDENTITY_INSERT [dbo].[Categoria] ON 

INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (1, N'VentaLibre')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (2, N'Antibioticos')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (3, N'Pscotropicos')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (4, N'Cronico')
SET IDENTITY_INSERT [dbo].[Categoria] OFF
INSERT [dbo].[Consulta] ([IdConsulta], [IdPaciente], [IdMedico], [FechaHora], [IdConsultorio], [IdEstatus], [Notas], [Costo]) VALUES (N'225bb75b-01a7-4cfd-a834-14b20b30e3c2', N'6e634df6-19a6-48c3-bea9-3f683c8b451c', 1, CAST(N'2017-05-11 07:30:00.000' AS DateTime), 1, N'3', N'Dolor de cabeza izzi', 300)
SET IDENTITY_INSERT [dbo].[Consultorio] ON 

INSERT [dbo].[Consultorio] ([IdConsultorio], [IdSucursal], [NumConsultorio]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [dbo].[Consultorio] OFF
INSERT [dbo].[ContactoPersona] ([IdContactoPersona], [IdPersona], [Telefono], [Correo]) VALUES (N'f4ebe999-b454-48ed-865f-208df6acb95d', N'953ae812-a5fe-4e51-a4ec-befed6dd01cd', 81124512475, N'Dinora@gmail.com')
INSERT [dbo].[ContactoPersona] ([IdContactoPersona], [IdPersona], [Telefono], [Correo]) VALUES (N'96b8a2fa-bb7b-4304-9548-275c9ae2f160', N'0f441dcb-643d-4d56-b9ba-17b40f4885ee', 8125649525, N'nancy@gmail.com')
INSERT [dbo].[ContactoPersona] ([IdContactoPersona], [IdPersona], [Telefono], [Correo]) VALUES (N'3ee92d83-2266-46d2-87d0-3eca651e82f2', N'60ef99dc-b7c1-4795-b470-62f0545ad3dc', 8112361254, N'Angelica@gmail.com')
INSERT [dbo].[ContactoPersona] ([IdContactoPersona], [IdPersona], [Telefono], [Correo]) VALUES (N'2907824f-ca15-46d4-a4f5-75f30d4af10a', N'76f51205-9938-4076-a004-3bcbf929c28e', 8145256574, N'Mau@gmail.com')
INSERT [dbo].[ContactoPersona] ([IdContactoPersona], [IdPersona], [Telefono], [Correo]) VALUES (N'e7cc05d0-7bab-46cd-bfd3-7b338008a9d0', N'127d6cf2-97db-4ccf-8c09-edb230e50e63', 86197219726, N'Brandon@gmail.com')
INSERT [dbo].[ContactoPersona] ([IdContactoPersona], [IdPersona], [Telefono], [Correo]) VALUES (N'3b4bfa06-9d57-46a2-9864-8bb0edc3a5a2', N'c213ba90-cf82-4a0f-aaf6-c47b09041750', 81461237516, N'Fatima@gmail.com')
INSERT [dbo].[ContactoPersona] ([IdContactoPersona], [IdPersona], [Telefono], [Correo]) VALUES (N'9c7ddcbd-e8fe-44a0-ac94-93f729e1564e', N'a3e4e040-36ba-45ed-a0b8-997e5c57f50b', 8116421527, N'Angel@gmail.com')
INSERT [dbo].[ContactoPersona] ([IdContactoPersona], [IdPersona], [Telefono], [Correo]) VALUES (N'28baa62b-4766-469e-85c4-b74f11f14601', N'a738a865-a13a-4167-af8b-403efd85d57a', 8165754295, N'Karla@gmail.com')
INSERT [dbo].[ContactoPersona] ([IdContactoPersona], [IdPersona], [Telefono], [Correo]) VALUES (N'b0300bd8-97b1-4d2d-b5c3-c03c2cf910d4', N'93ce6098-5da4-44e0-aa1b-a292ed3c52b1', 8136491546, N'Jesus@gmail.com')
INSERT [dbo].[ContactoPersona] ([IdContactoPersona], [IdPersona], [Telefono], [Correo]) VALUES (N'f36c3217-554e-4a33-946d-fe4c93c84edb', N'cb6ffff7-04d5-4ec4-a899-e6a096810c67', 81367619754, N'Hilder@gmail.com')
INSERT [dbo].[ContactoSucursal] ([IdContactoSucursal], [IdSucursal], [Telefono], [Correo]) VALUES (N'b17de1e1-5612-464c-8b9e-17757153af5a', 1, 8123654852, N'Missalvacion@gmail.com')
INSERT [dbo].[ContactoSucursal] ([IdContactoSucursal], [IdSucursal], [Telefono], [Correo]) VALUES (N'fabe0da5-d5d7-4fe4-a292-3917088a168b', 3, 8123544852, N'San_Nicolas@gmail.com')
INSERT [dbo].[ContactoSucursal] ([IdContactoSucursal], [IdSucursal], [Telefono], [Correo]) VALUES (N'33c6abea-a461-4517-8e6c-841392beb6f8', 6, 8133331885, N'TransDrugs_Juarez@gmail.com')
INSERT [dbo].[ContactoSucursal] ([IdContactoSucursal], [IdSucursal], [Telefono], [Correo]) VALUES (N'c7d4105d-a602-4a6d-b35d-8e68f849130a', 5, 8123453352, N'TransDrugs_Monterrey@gmail.com')
INSERT [dbo].[ContactoSucursal] ([IdContactoSucursal], [IdSucursal], [Telefono], [Correo]) VALUES (N'2a6859e2-3449-4fcf-8ae7-af85314ae19a', 4, 8143231285, N'Lab_Estanzuela@gmail.com')
INSERT [dbo].[ContactoSucursal] ([IdContactoSucursal], [IdSucursal], [Telefono], [Correo]) VALUES (N'bd1411e7-0eef-4299-9fbd-dc0b1727aa64', 2, 8123651885, N'LasTorres@gmail.com')
SET IDENTITY_INSERT [dbo].[DireccionPersona] ON 

INSERT [dbo].[DireccionPersona] ([IdDireccion], [IdPersona], [CalleNum], [Municipio], [IdEstado]) VALUES (1, N'0f441dcb-643d-4d56-b9ba-17b40f4885ee', N'San Sebastian 304', N'Juarez', N'1')
INSERT [dbo].[DireccionPersona] ([IdDireccion], [IdPersona], [CalleNum], [Municipio], [IdEstado]) VALUES (2, N'76f51205-9938-4076-a004-3bcbf929c28e', N'San Jorge 324', N'Juarez', N'1')
INSERT [dbo].[DireccionPersona] ([IdDireccion], [IdPersona], [CalleNum], [Municipio], [IdEstado]) VALUES (3, N'a738a865-a13a-4167-af8b-403efd85d57a', N'Santa Cecilia', N'Juarez', N'1')
INSERT [dbo].[DireccionPersona] ([IdDireccion], [IdPersona], [CalleNum], [Municipio], [IdEstado]) VALUES (4, N'60ef99dc-b7c1-4795-b470-62f0545ad3dc', N'Tepeyac 615', N'Independencia', N'1')
INSERT [dbo].[DireccionPersona] ([IdDireccion], [IdPersona], [CalleNum], [Municipio], [IdEstado]) VALUES (5, N'a3e4e040-36ba-45ed-a0b8-997e5c57f50b', N'Pablo ll', N'Independencia', N'1')
INSERT [dbo].[DireccionPersona] ([IdDireccion], [IdPersona], [CalleNum], [Municipio], [IdEstado]) VALUES (6, N'93ce6098-5da4-44e0-aa1b-a292ed3c52b1', N'Jimenez 403', N'Guadalupe', N'1')
INSERT [dbo].[DireccionPersona] ([IdDireccion], [IdPersona], [CalleNum], [Municipio], [IdEstado]) VALUES (7, N'953ae812-a5fe-4e51-a4ec-befed6dd01cd', N'Agistin Melgar 304', N'Guadalupe', N'1')
INSERT [dbo].[DireccionPersona] ([IdDireccion], [IdPersona], [CalleNum], [Municipio], [IdEstado]) VALUES (8, N'c213ba90-cf82-4a0f-aaf6-c47b09041750', N'Jose Agustin Melgar 304', N'Monterrey', N'1')
INSERT [dbo].[DireccionPersona] ([IdDireccion], [IdPersona], [CalleNum], [Municipio], [IdEstado]) VALUES (9, N'cb6ffff7-04d5-4ec4-a899-e6a096810c67', N'Av. Guerrero 105', N'San Nicolas', N'1')
INSERT [dbo].[DireccionPersona] ([IdDireccion], [IdPersona], [CalleNum], [Municipio], [IdEstado]) VALUES (10, N'127d6cf2-97db-4ccf-8c09-edb230e50e63', N'Privada Famosa 102', N'San Nicolas', N'1')
SET IDENTITY_INSERT [dbo].[DireccionPersona] OFF
SET IDENTITY_INSERT [dbo].[DireccionSucursales] ON 

INSERT [dbo].[DireccionSucursales] ([IdDireccionSucursal], [IdSucursal], [CalleNum], [Municipio], [IdEstado]) VALUES (1, 1, N'Privada Famosa 102', N'San Nicolas', N'1')
INSERT [dbo].[DireccionSucursales] ([IdDireccionSucursal], [IdSucursal], [CalleNum], [Municipio], [IdEstado]) VALUES (2, 2, N'Privada Famosa 103', N'San Nicolas', N'1')
INSERT [dbo].[DireccionSucursales] ([IdDireccionSucursal], [IdSucursal], [CalleNum], [Municipio], [IdEstado]) VALUES (3, 3, N'San Nicolas 1102', N'San Nicolas', N'1')
INSERT [dbo].[DireccionSucursales] ([IdDireccionSucursal], [IdSucursal], [CalleNum], [Municipio], [IdEstado]) VALUES (4, 4, N'Estanzuela 103', N'Estanzuela', N'1')
INSERT [dbo].[DireccionSucursales] ([IdDireccionSucursal], [IdSucursal], [CalleNum], [Municipio], [IdEstado]) VALUES (5, 5, N'Monterrey 2102', N'Monterrey', N'1')
INSERT [dbo].[DireccionSucursales] ([IdDireccionSucursal], [IdSucursal], [CalleNum], [Municipio], [IdEstado]) VALUES (6, 6, N'Juarez 1033', N'Juarez', N'1')
SET IDENTITY_INSERT [dbo].[DireccionSucursales] OFF
INSERT [dbo].[Empleado] ([IdEmpleado], [IdPersona], [Sueldo], [Encargado], [Contraseña], [PuestoEmpleado]) VALUES (N'b7c35eff-3e36-43fc-b654-2825e8a149f5', N'cb6ffff7-04d5-4ec4-a899-e6a096810c67', 10000, N'CB6FFFF7-04D5-4EC4-A899-E6A096810C67', N'123asdf', 3)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdPersona], [Sueldo], [Encargado], [Contraseña], [PuestoEmpleado]) VALUES (N'e9e724a4-ffc3-4d1d-9c25-cbd46f4a4bb2', N'127d6cf2-97db-4ccf-8c09-edb230e50e63', 5000, N'CB6FFFF7-04D5-4EC4-A899-E6A096810C67', N'123asdf', 2)
SET IDENTITY_INSERT [dbo].[Empresa] ON 

INSERT [dbo].[Empresa] ([IdEmpresa], [Nombre]) VALUES (1, N'Missalvacion')
INSERT [dbo].[Empresa] ([IdEmpresa], [Nombre]) VALUES (2, N'LabCorp')
INSERT [dbo].[Empresa] ([IdEmpresa], [Nombre]) VALUES (3, N'TransDrugs')
SET IDENTITY_INSERT [dbo].[Empresa] OFF
SET IDENTITY_INSERT [dbo].[Estado] ON 

INSERT [dbo].[Estado] ([IdDireccion], [Estado]) VALUES (1, N'Nuevo Leon')
SET IDENTITY_INSERT [dbo].[Estado] OFF
SET IDENTITY_INSERT [dbo].[Estatus] ON 

INSERT [dbo].[Estatus] ([IdEstatus], [Descripcion]) VALUES (1, N'Pendiente')
INSERT [dbo].[Estatus] ([IdEstatus], [Descripcion]) VALUES (2, N'Activa')
INSERT [dbo].[Estatus] ([IdEstatus], [Descripcion]) VALUES (3, N'Terminada')
SET IDENTITY_INSERT [dbo].[Estatus] OFF
INSERT [dbo].[Medicamento] ([IdMedicamento], [Nombre], [Descripcion], [IdCategoria], [IdProveedor], [IdLaboratorio], [NombreGen], [PrecioBase]) VALUES (N'ccec63fe-313d-4fb4-8e9c-032ca3446326', N'Rosel', N'Fiebre, estornudos y cuerpo cortado, 500mg', 1, 6, 4, N'Clorfenamina, Anamtadina, Paracetamol', 28)
INSERT [dbo].[Medicamento] ([IdMedicamento], [Nombre], [Descripcion], [IdCategoria], [IdProveedor], [IdLaboratorio], [NombreGen], [PrecioBase]) VALUES (N'c5367b46-6dcc-4df3-9fc1-15bedab7f024', N'Paracetamol', N'Dolor de cabeza y fiebre, 500mg', 1, 5, 3, N'Paracetamol', 7)
INSERT [dbo].[Medicamento] ([IdMedicamento], [Nombre], [Descripcion], [IdCategoria], [IdProveedor], [IdLaboratorio], [NombreGen], [PrecioBase]) VALUES (N'c576a7b2-099d-4a6f-9f76-a8c8656f435c', N'Clonacepam', N'Para dormir, 2mg', 3, 6, 4, N'Ribotrilp', 81)
INSERT [dbo].[Medicamento] ([IdMedicamento], [Nombre], [Descripcion], [IdCategoria], [IdProveedor], [IdLaboratorio], [NombreGen], [PrecioBase]) VALUES (N'8e22cc6d-7860-480a-81b6-ad0f41327474', N'Clamoxin', N'Infecciones respiratorias, 875/125mg', 2, 5, 3, N'Amoxicilina / acido clabulanico', 98)
INSERT [dbo].[Medicamento] ([IdMedicamento], [Nombre], [Descripcion], [IdCategoria], [IdProveedor], [IdLaboratorio], [NombreGen], [PrecioBase]) VALUES (N'66e60bf8-203e-4a4f-b912-b146fe03d8f5', N'Ibuprofeno', N'Dolo de cabeza, 500mg', 4, 6, 4, N'Ibuprofeno', 55)
SET IDENTITY_INSERT [dbo].[Medico] ON 

INSERT [dbo].[Medico] ([IdMedico], [IdEmpleado], [Cedula]) VALUES (1, N'b7c35eff-3e36-43fc-b654-2825e8a149f5', N'NOMESELAESTRUCTURADELACEDULA')
SET IDENTITY_INSERT [dbo].[Medico] OFF
INSERT [dbo].[OIEmpleados] ([IdOIEmpleados], [IdEmpleado], [FechaEntrada], [FechaSalida]) VALUES (N'561e0330-6f42-41d8-b3ff-a0644e5eb8c0', N'b7c35eff-3e36-43fc-b654-2825e8a149f5', CAST(N'2017-11-01' AS Date), NULL)
INSERT [dbo].[OIEmpleados] ([IdOIEmpleados], [IdEmpleado], [FechaEntrada], [FechaSalida]) VALUES (N'bfa1c0db-0692-41e2-8394-199f655f7de4', N'e9e724a4-ffc3-4d1d-9c25-cbd46f4a4bb2', CAST(N'2017-11-01' AS Date), NULL)
INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'1ed752ed-8c91-4263-baeb-2b8898fb6461', N'76f51205-9938-4076-a004-3bcbf929c28e', 95, 1.72)
INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'6e634df6-19a6-48c3-bea9-3f683c8b451c', N'c213ba90-cf82-4a0f-aaf6-c47b09041750', 68, 1.62)
INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'ea148232-9491-4457-aa2a-488d5aeeabed', N'0f441dcb-643d-4d56-b9ba-17b40f4885ee', 52, 1.51)
INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'e0920ee9-b1cc-4b4a-9857-741c9c2fe448', N'80de71f7-6575-4554-8c6e-804546324896', 105, 1.73)
INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'b93ebc94-7bd9-40dc-a830-94992c8229fa', N'60ef99dc-b7c1-4795-b470-62f0545ad3dc', 64, 1.5)
INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'0a5c14be-4059-43e4-8c30-bc548c6dcdec', N'a738a865-a13a-4167-af8b-403efd85d57a', 60, 1.6)
INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'df9c0e5b-26cf-46ed-a69a-bea5bf26890f', N'a3e4e040-36ba-45ed-a0b8-997e5c57f50b', 100, 1.7)
INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'ed1693cf-097c-4cae-8ce4-e8ec45d7b0b1', N'953ae812-a5fe-4e51-a4ec-befed6dd01cd', 91, 1.56)
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'0f441dcb-643d-4d56-b9ba-17b40f4885ee', N'Nancy', N'Rodulfo', N'Mazuca', CAST(N'1998-03-28' AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'76f51205-9938-4076-a004-3bcbf929c28e', N'Mau', N'A.K.A.', N'Aczecino', CAST(N'1991-06-02' AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'a738a865-a13a-4167-af8b-403efd85d57a', N'Karla', N'Gomez', N'Ortiz', CAST(N'2001-05-03' AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'60ef99dc-b7c1-4795-b470-62f0545ad3dc', N'Angelica', N'Mazuca', N'Cortez', CAST(N'1971-06-12' AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'a3e4e040-36ba-45ed-a0b8-997e5c57f50b', N'Angel', N'Pacheco', N'Mazuca', CAST(N'1997-12-02' AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'93ce6098-5da4-44e0-aa1b-a292ed3c52b1', N'Jesus', N'Pacheco', N'Mazuca', CAST(N'2000-09-19' AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'953ae812-a5fe-4e51-a4ec-befed6dd01cd', N'Dinora', N'Mazuca', N'Cortez', CAST(N'1974-11-19' AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'c213ba90-cf82-4a0f-aaf6-c47b09041750', N'Fatima', N'Garcia', N'Campos', CAST(N'1998-02-28' AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'cb6ffff7-04d5-4ec4-a899-e6a096810c67', N'Hilder', N'Pacheco', N'Navarro', CAST(N'1974-06-27' AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'127d6cf2-97db-4ccf-8c09-edb230e50e63', N'Brandon', N'Torres', N'Lopez', CAST(N'2001-12-07' AS Date))
INSERT [dbo].[Prescripcion] ([IdPrescripcion], [IdConsulta], [IdMedicamento], [Cantidad], [Indicaciones]) VALUES (N'f651ceb1-4d6b-4b3c-8157-6b6c37ab9af6', N'225bb75b-01a7-4cfd-a834-14b20b30e3c2', N'c5367b46-6dcc-4df3-9fc1-15bedab7f024', 2, N'Casa 6 horas por 3 dias')
SET IDENTITY_INSERT [dbo].[Proveedor] ON 

INSERT [dbo].[Proveedor] ([IdProveedor], [IdSucursal], [LicenciaProveedor]) VALUES (1, 3, N'lic.SectorPrivado')
INSERT [dbo].[Proveedor] ([IdProveedor], [IdSucursal], [LicenciaProveedor]) VALUES (2, 3, N'lic.SectorPublico')
INSERT [dbo].[Proveedor] ([IdProveedor], [IdSucursal], [LicenciaProveedor]) VALUES (5, 3, N'lic.SectorPrivado')
SET IDENTITY_INSERT [dbo].[Proveedor] OFF
SET IDENTITY_INSERT [dbo].[PuestoEmpleado] ON 

INSERT [dbo].[PuestoEmpleado] ([IdNivelEmpleado], [Puesto]) VALUES (1, N'Secretaria')
INSERT [dbo].[PuestoEmpleado] ([IdNivelEmpleado], [Puesto]) VALUES (2, N'Almacen')
INSERT [dbo].[PuestoEmpleado] ([IdNivelEmpleado], [Puesto]) VALUES (3, N'Medico')
INSERT [dbo].[PuestoEmpleado] ([IdNivelEmpleado], [Puesto]) VALUES (4, N'Sistemas')
SET IDENTITY_INSERT [dbo].[PuestoEmpleado] OFF
SET IDENTITY_INSERT [dbo].[Sucursal] ON 

INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [IdEmpresa]) VALUES (1, N'Missalvacion', 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [IdEmpresa]) VALUES (2, N'Las Torres', 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [IdEmpresa]) VALUES (3, N'San Nicolas', 2)
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [IdEmpresa]) VALUES (4, N'Lab Estanzuela', 2)
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [IdEmpresa]) VALUES (5, N'TransDrugs Monterrey', 3)
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [IdEmpresa]) VALUES (6, N'TransDrugs Juarez', 3)
SET IDENTITY_INSERT [dbo].[Sucursal] OFF
/****** Object:  StoredProcedure [dbo].[ActualizarMedicamentoByID]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ActualizarMedicamentoByID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[ActualizarMedicamentoByID] AS' 
END
GO
ALTER PROCEDURE [dbo].[ActualizarMedicamentoByID]
@ID uniqueidentifier,
@Nombre varchar(50),
@Descripcion varchar(50),
@IdCategoria int, 
@IdProvedor int, 
@IdLaboratorio int,
@NombreGenerico  varchar(50),
@PrecioBase float
AS
BEGIN
	Update Medicamento
	set Nombre = @Nombre,Descripcion = @Descripcion,IdCategoria = @IdCategoria,IdProveedor = @IdProvedor, IdLaboratorio = @IdLaboratorio,
	NombreGen = @NombreGenerico, PrecioBase = @PrecioBase
	where IdMedicamento = @ID
END

GO
/****** Object:  StoredProcedure [dbo].[BorrarMedicamentoByID]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BorrarMedicamentoByID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[BorrarMedicamentoByID] AS' 
END
GO
ALTER PROCEDURE [dbo].[BorrarMedicamentoByID]
@ID uniqueidentifier
AS
BEGIN
	Delete Medicamento
	where IdMedicamento = @ID
END
GO
/****** Object:  StoredProcedure [dbo].[BorrarPersonaByID]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BorrarPersonaByID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[BorrarPersonaByID] AS' 
END
GO
ALTER PROCEDURE [dbo].[BorrarPersonaByID]
@ID uniqueidentifier
AS
BEGIN
	Delete Persona
	where IdPersona = @ID
END

GO
/****** Object:  StoredProcedure [dbo].[consultasFases]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[consultasFases]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[consultasFases] AS' 
END
GO
ALTER procedure [dbo].[consultasFases] (@valor int)
as 
begin
		select * from dbo.Consulta
		where IdEstatus=@valor
		end
GO
/****** Object:  StoredProcedure [dbo].[reporteObesidad]    Script Date: 11-11-17 21:50:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[reporteObesidad]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[reporteObesidad] AS' 
END
GO
ALTER procedure [dbo].[reporteObesidad] (@numero float )
as begin 
select * from dbo.Paciente
		where peso>@numero
	end 
GO
USE [master]
GO
ALTER DATABASE [ConsulSimi] SET  READ_WRITE 
GO
