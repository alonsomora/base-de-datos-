USE [master]
GO
/****** Object:  Database [empresa]    Script Date: 16-09-17 5:59:18 ******/
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'empresa')
BEGIN
CREATE DATABASE [empresa]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'empresa', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\empresa.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'empresa_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\empresa_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
ALTER DATABASE [empresa] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [empresa].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [empresa] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [empresa] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [empresa] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [empresa] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [empresa] SET ARITHABORT OFF 
GO
ALTER DATABASE [empresa] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [empresa] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [empresa] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [empresa] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [empresa] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [empresa] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [empresa] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [empresa] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [empresa] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [empresa] SET  DISABLE_BROKER 
GO
ALTER DATABASE [empresa] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [empresa] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [empresa] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [empresa] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [empresa] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [empresa] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [empresa] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [empresa] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [empresa] SET  MULTI_USER 
GO
ALTER DATABASE [empresa] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [empresa] SET DB_CHAINING OFF 
GO
ALTER DATABASE [empresa] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [empresa] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [empresa] SET DELAYED_DURABILITY = DISABLED 
GO
USE [empresa]
GO
/****** Object:  Table [dbo].[Accesorios]    Script Date: 16-09-17 5:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Accesorios]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Accesorios](
	[nombre] [varchar](1) NOT NULL,
	[Caracteristicas] [text] NOT NULL,
	[Precio] [float] NOT NULL,
	[Codigo] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Autos]    Script Date: 16-09-17 5:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Autos]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Autos](
	[Modelo] [varchar](1) NOT NULL,
	[Marca] [varchar](1) NOT NULL,
	[Precio] [float] NOT NULL,
	[Matricula] [uniqueidentifier] NOT NULL,
	[Fecha_entrada] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 16-09-17 5:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Clientes]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Clientes](
	[ID_cliente] [uniqueidentifier] NOT NULL,
	[Primer_nombre] [varchar](1) NOT NULL,
	[Segundo_nombre] [varchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 16-09-17 5:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Empleados]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Empleados](
	[Nombre] [varchar](1) NOT NULL,
	[Matricula] [uniqueidentifier] NOT NULL,
	[Hora_ingreso] [tinyint] NOT NULL,
	[Hora_salida] [tinyint] NOT NULL,
	[Salario] [tinyint] NOT NULL,
	[Tiempo_trabajado]  AS ([Hora_salida]-[Hora_ingreso]),
PRIMARY KEY CLUSTERED 
(
	[Matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Provedores]    Script Date: 16-09-17 5:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Provedores]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Provedores](
	[Nombre_Provedor] [varchar](1) NOT NULL,
	[Codigo_Provedor] [uniqueidentifier] NOT NULL,
	[Marca_Auto] [varchar](1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo_Provedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sucursal]    Script Date: 16-09-17 5:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Sucursal]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Sucursal](
	[Nombre] [varchar](1) NOT NULL,
	[Lugar] [varchar](1) NOT NULL,
	[Codigo_Postal] [bit] NOT NULL,
	[Codigo_Sucursal] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo_Sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ventas]    Script Date: 16-09-17 5:59:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Ventas]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Ventas](
	[Nombre_Empleado] [varchar](1) NOT NULL,
	[Hora_venta] [time](7) NOT NULL,
	[Articulo] [varchar](1) NOT NULL,
	[Codigo_Venta] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Codigo_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Index [IDX_Accesorio]    Script Date: 16-09-17 5:59:19 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Accesorios]') AND name = N'IDX_Accesorio')
CREATE NONCLUSTERED INDEX [IDX_Accesorio] ON [dbo].[Accesorios]
(
	[Codigo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [inx_Autos]    Script Date: 16-09-17 5:59:19 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Autos]') AND name = N'inx_Autos')
CREATE NONCLUSTERED INDEX [inx_Autos] ON [dbo].[Autos]
(
	[Matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IDX_clientes]    Script Date: 16-09-17 5:59:19 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Clientes]') AND name = N'IDX_clientes')
CREATE NONCLUSTERED INDEX [IDX_clientes] ON [dbo].[Clientes]
(
	[Primer_nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Empleados]    Script Date: 16-09-17 5:59:19 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Empleados]') AND name = N'IDX_Empleados')
CREATE NONCLUSTERED INDEX [IDX_Empleados] ON [dbo].[Empleados]
(
	[Matricula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Provedor]    Script Date: 16-09-17 5:59:19 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Provedores]') AND name = N'IDX_Provedor')
CREATE NONCLUSTERED INDEX [IDX_Provedor] ON [dbo].[Provedores]
(
	[Codigo_Provedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Sucursal]    Script Date: 16-09-17 5:59:19 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Sucursal]') AND name = N'IDX_Sucursal')
CREATE NONCLUSTERED INDEX [IDX_Sucursal] ON [dbo].[Sucursal]
(
	[Codigo_Sucursal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Ventas]    Script Date: 16-09-17 5:59:19 ******/
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Ventas]') AND name = N'IDX_Ventas')
CREATE NONCLUSTERED INDEX [IDX_Ventas] ON [dbo].[Ventas]
(
	[Codigo_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [empresa] SET  READ_WRITE 
GO
