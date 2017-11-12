---------------practica 1 generar base de datos---------------------

CREATE DATABASE [ConsulSimi]

--------practica 2 generar tablas-----------------------------------

CREATE TABLE [dbo].[Medico](
	[IdMedico] [int] IDENTITY(1,1) NOT NULL,
	[IdEmpleado] [uniqueidentifier] NULL,
	[Cedula] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdMedico] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Laboratorio](
	[IdLaboratiorio] [int] IDENTITY(1,1) NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[LicenciaLaboratorio] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdLaboratiorio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Estatus](
	[IdEstatus] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEstatus] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Estado](
	[IdDireccion] [int] IDENTITY(1,1) NOT NULL,
	[Estado] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDireccion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Empresa](
	[IdEmpresa] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdEmpresa] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[DireccionSucursales](
	[IdDireccionSucursal] [int] IDENTITY(1,1) NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[CalleNum] [varchar](50) NOT NULL,
	[Municipio] [varchar](50) NOT NULL,
	[IdEstado] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDireccionSucursal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
CREATE TABLE [dbo].[ContactoSucursal](
	[IdContactoSucursal] [uniqueidentifier] NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[Telefono] [float] NOT NULL,
	[Correo] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdContactoSucursal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[ContactoPersona](
	[IdContactoPersona] [uniqueidentifier] NOT NULL,
	[IdPersona] [uniqueidentifier] NOT NULL,
	[Telefono] [float] NOT NULL,
	[Correo] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdContactoPersona] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Consultorio](
	[IdConsultorio] [int] IDENTITY(1,1) NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[NumConsultorio] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdConsultorio] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Prescripcion](
	[IdPrescripcion] [uniqueidentifier] NOT NULL,
	[IdConsulta] [uniqueidentifier] NOT NULL,
	[IdMedicamento] [uniqueidentifier] NOT NULL,
	[Cantidad] [int] NOT NULL,
	[Indicaciones] [varchar](300) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPrescripcion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Paciente](
	[IdPaciente] [uniqueidentifier] NOT NULL,
	[IdPersona] [uniqueidentifier] NOT NULL,
	[Peso] [float] NOT NULL,
	[Altura] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPaciente] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[OIEmpleados](
	[IdOIEmpleados] [uniqueidentifier] NOT NULL,
	[IdEmpleado] [uniqueidentifier] NOT NULL,
	[FechaEntrada] [date] NOT NULL,
	[FechaSalida] [date] NULL
) ON [PRIMARY]

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
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Categoria](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Sucursal](
	[IdSucursal] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[IdEmpresa] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdSucursal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[PuestoEmpleado](
	[IdNivelEmpleado] [int] IDENTITY(1,1) NOT NULL,
	[Puesto] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdNivelEmpleado] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

CREATE TABLE [dbo].[Proveedor](
	[IdProveedor] [int] IDENTITY(1,1) NOT NULL,
	[IdSucursal] [int] NOT NULL,
	[LicenciaProveedor] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdProveedor] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
CREATE TABLE [dbo].[DireccionPersona](
	[IdDireccion] [int] IDENTITY(1,1) NOT NULL,
	[IdPersona] [uniqueidentifier] NOT NULL,
	[CalleNum] [varchar](50) NOT NULL,
	[Municipio] [varchar](50) NOT NULL,
	[IdEstado] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IdDireccion] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]




----------practica 4 inserts ----------------------------------------------------
SET IDENTITY_INSERT [dbo].[Medico] on
INSERT [dbo].[Medico] ([IdMedico], [IdEmpleado], [Cedula]) VALUES (1, N'b7c35eff-3e36-43fc-b654-2825e8a149f5', N'NOMESELAESTRUCTURADELACEDULA')
set identity_insert [dbo].[Medico] off

INSERT [dbo].[Medicamento] ([IdMedicamento], [Nombre], [Descripcion], [IdCategoria], [IdProveedor], [IdLaboratorio], [NombreGen], [PrecioBase]) VALUES (N'ccec63fe-313d-4fb4-8e9c-032ca3446326', N'Rosel', N'Fiebre, estornudos y cuerpo cortado, 500mg', 1, 6, 4, N'Clorfenamina, Anamtadina, Paracetamol', 28)
INSERT [dbo].[Medicamento] ([IdMedicamento], [Nombre], [Descripcion], [IdCategoria], [IdProveedor], [IdLaboratorio], [NombreGen], [PrecioBase]) VALUES (N'c5367b46-6dcc-4df3-9fc1-15bedab7f024', N'Paracetamol', N'Dolor de cabeza y fiebre, 500mg', 1, 5, 3, N'Paracetamol', 7)
INSERT [dbo].[Medicamento] ([IdMedicamento], [Nombre], [Descripcion], [IdCategoria], [IdProveedor], [IdLaboratorio], [NombreGen], [PrecioBase]) VALUES (N'c576a7b2-099d-4a6f-9f76-a8c8656f435c', N'Clonacepam', N'Para dormir, 2mg', 3, 6, 4, N'Ribotrilp', 81)
INSERT [dbo].[Medicamento] ([IdMedicamento], [Nombre], [Descripcion], [IdCategoria], [IdProveedor], [IdLaboratorio], [NombreGen], [PrecioBase]) VALUES (N'8e22cc6d-7860-480a-81b6-ad0f41327474', N'Clamoxin', N'Infecciones respiratorias, 875/125mg', 2, 5, 3, N'Amoxicilina / acido clabulanico', 98)
INSERT [dbo].[Medicamento] ([IdMedicamento], [Nombre], [Descripcion], [IdCategoria], [IdProveedor], [IdLaboratorio], [NombreGen], [PrecioBase]) VALUES (N'66e60bf8-203e-4a4f-b912-b146fe03d8f5', N'Ibuprofeno', N'Dolo de cabeza, 500mg', 4, 6, 4, N'Ibuprofeno', 55)
INSERT [dbo].[Medicamento] ([IdMedicamento], [Nombre], [Descripcion], [IdCategoria], [IdProveedor], [IdLaboratorio], [NombreGen], [PrecioBase]) VALUES (N'ed796c91-f6b0-4e72-88e3-bc4b53138ba0', N'Metformina', N'Diabetes, 850mg', 4, 6, 4, N'Glucobance', 55)

SET IDENTITY_INSERT [dbo].[Estatus] ON
INSERT [dbo].[Estatus] ([IdEstatus], [Descripcion]) VALUES (1, N'Pendiente')
INSERT [dbo].[Estatus] ([IdEstatus], [Descripcion]) VALUES (2, N'Activa')
INSERT [dbo].[Estatus] ([IdEstatus], [Descripcion]) VALUES (3, N'Terminada')
SET IDENTITY_INSERT [dbo].[Estatus] OFF

SET IDENTITY_INSERT [dbo].[Estado] ON
INSERT [dbo].[Estado] ([IdDireccion], [Estado]) VALUES (1, N'Nuevo Leon')
SET IDENTITY_INSERT [dbo].[Estado] OFF

SET IDENTITY_INSERT [dbo].[Empresa] ON
INSERT [dbo].[Empresa] ([IdEmpresa], [Nombre]) VALUES (1, N'Missalvacion')
INSERT [dbo].[Empresa] ([IdEmpresa], [Nombre]) VALUES (2, N'LabCorp')
INSERT [dbo].[Empresa] ([IdEmpresa], [Nombre]) VALUES (3, N'TransDrugs')
SET IDENTITY_INSERT [dbo].[Empresa] OFF

INSERT [dbo].[Empleado] ([IdEmpleado], [IdPersona], [Sueldo], [Encargado], [Contraseña], [PuestoEmpleado]) VALUES (N'b7c35eff-3e36-43fc-b654-2825e8a149f5', N'cb6ffff7-04d5-4ec4-a899-e6a096810c67', 10000, N'CB6FFFF7-04D5-4EC4-A899-E6A096810C67', N'123asdf', 3)
INSERT [dbo].[Empleado] ([IdEmpleado], [IdPersona], [Sueldo], [Encargado], [Contraseña], [PuestoEmpleado]) VALUES (N'e9e724a4-ffc3-4d1d-9c25-cbd46f4a4bb2', N'127d6cf2-97db-4ccf-8c09-edb230e50e63', 5000, N'CB6FFFF7-04D5-4EC4-A899-E6A096810C67', N'123asdf', 2)
SET IDENTITY_INSERT [dbo].[DireccionSucursales] ON
INSERT [dbo].[DireccionSucursales] ([IdDireccionSucursal], [IdSucursal], [CalleNum], [Municipio], [IdEstado]) VALUES (1, 1, N'Privada Famosa 102', N'San Nicolas', N'1')
INSERT [dbo].[DireccionSucursales] ([IdDireccionSucursal], [IdSucursal], [CalleNum], [Municipio], [IdEstado]) VALUES (2, 2, N'Privada Famosa 103', N'San Nicolas', N'1')
INSERT [dbo].[DireccionSucursales] ([IdDireccionSucursal], [IdSucursal], [CalleNum], [Municipio], [IdEstado]) VALUES (3, 3, N'San Nicolas 1102', N'San Nicolas', N'1')
INSERT [dbo].[DireccionSucursales] ([IdDireccionSucursal], [IdSucursal], [CalleNum], [Municipio], [IdEstado]) VALUES (4, 4, N'Estanzuela 103', N'Estanzuela', N'1')
INSERT [dbo].[DireccionSucursales] ([IdDireccionSucursal], [IdSucursal], [CalleNum], [Municipio], [IdEstado]) VALUES (5, 5, N'Monterrey 2102', N'Monterrey', N'1')
INSERT [dbo].[DireccionSucursales] ([IdDireccionSucursal], [IdSucursal], [CalleNum], [Municipio], [IdEstado]) VALUES (6, 6, N'Juarez 1033', N'Juarez', N'1')
SET IDENTITY_INSERT [dbo].[DireccionSucursales] OFF

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

INSERT [dbo].[ContactoSucursal] ([IdContactoSucursal], [IdSucursal], [Telefono], [Correo]) VALUES (N'b17de1e1-5612-464c-8b9e-17757153af5a', 1, 8123654852, N'Missalvacion@gmail.com')
INSERT [dbo].[ContactoSucursal] ([IdContactoSucursal], [IdSucursal], [Telefono], [Correo]) VALUES (N'fabe0da5-d5d7-4fe4-a292-3917088a168b', 3, 8123544852, N'San_Nicolas@gmail.com')
INSERT [dbo].[ContactoSucursal] ([IdContactoSucursal], [IdSucursal], [Telefono], [Correo]) VALUES (N'33c6abea-a461-4517-8e6c-841392beb6f8', 6, 8133331885, N'TransDrugs_Juarez@gmail.com')
INSERT [dbo].[ContactoSucursal] ([IdContactoSucursal], [IdSucursal], [Telefono], [Correo]) VALUES (N'c7d4105d-a602-4a6d-b35d-8e68f849130a', 5, 8123453352, N'TransDrugs_Monterrey@gmail.com')
INSERT [dbo].[ContactoSucursal] ([IdContactoSucursal], [IdSucursal], [Telefono], [Correo]) VALUES (N'2a6859e2-3449-4fcf-8ae7-af85314ae19a', 4, 8143231285, N'Lab_Estanzuela@gmail.com')
INSERT [dbo].[ContactoSucursal] ([IdContactoSucursal], [IdSucursal], [Telefono], [Correo]) VALUES (N'bd1411e7-0eef-4299-9fbd-dc0b1727aa64', 2, 8123651885, N'LasTorres@gmail.com')



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

SET IDENTITY_INSERT [dbo].[Consultorio] ON
INSERT [dbo].[Consultorio] ([IdConsultorio], [IdSucursal], [NumConsultorio]) VALUES (1, 1, 1)
SET IDENTITY_INSERT [dbo].[Consultorio] OFF
SET ANSI_PADDING OFF

INSERT [dbo].[Prescripcion] ([IdPrescripcion], [IdConsulta], [IdMedicamento], [Cantidad], [Indicaciones]) VALUES (N'f651ceb1-4d6b-4b3c-8157-6b6c37ab9af6', N'225bb75b-01a7-4cfd-a834-14b20b30e3c2', N'c5367b46-6dcc-4df3-9fc1-15bedab7f024', 2, N'Casa 6 horas por 3 dias')

SET ANSI_PADDING OFF

INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'0f441dcb-643d-4d56-b9ba-17b40f4885ee', N'Nancy', N'Rodulfo', N'Mazuca', CAST(0x83210B00 AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'76f51205-9938-4076-a004-3bcbf929c28e', N'Mau', N'A.K.A.', N'Aczecino', CAST(0xC8170B00 AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'a738a865-a13a-4167-af8b-403efd85d57a', N'Karla', N'Gomez', N'Ortiz', CAST(0xEF250B00 AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'60ef99dc-b7c1-4795-b470-62f0545ad3dc', N'Angelica', N'Mazuca', N'Cortez', CAST(0x49FB0A00 AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'a3e4e040-36ba-45ed-a0b8-997e5c57f50b', N'Angel', N'Pacheco', N'Mazuca', CAST(0x0F210B00 AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'93ce6098-5da4-44e0-aa1b-a292ed3c52b1', N'Jesus', N'Pacheco', N'Mazuca', CAST(0x0D250B00 AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'953ae812-a5fe-4e51-a4ec-befed6dd01cd', N'Dinora', N'Mazuca', N'Cortez', CAST(0x31000B00 AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'c213ba90-cf82-4a0f-aaf6-c47b09041750', N'Fatima', N'Garcia', N'Campos', CAST(0x67210B00 AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'cb6ffff7-04d5-4ec4-a899-e6a096810c67', N'Hilder', N'Pacheco', N'Navarro', CAST(0xA0FF0A00 AS Date))
INSERT [dbo].[Persona] ([IdPersona], [Nombre], [ApPaterno], [ApMaterno], [FechaNac]) VALUES (N'127d6cf2-97db-4ccf-8c09-edb230e50e63', N'Brandon', N'Torres', N'Lopez', CAST(0xC9260B00 AS Date))

INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'1ed752ed-8c91-4263-baeb-2b8898fb6461', N'76f51205-9938-4076-a004-3bcbf929c28e', 95, 1.72)
INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'6e634df6-19a6-48c3-bea9-3f683c8b451c', N'c213ba90-cf82-4a0f-aaf6-c47b09041750', 68, 1.62)
INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'ea148232-9491-4457-aa2a-488d5aeeabed', N'0f441dcb-643d-4d56-b9ba-17b40f4885ee', 52, 1.51)
INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'e0920ee9-b1cc-4b4a-9857-741c9c2fe448', N'80de71f7-6575-4554-8c6e-804546324896', 105, 1.73)
INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'b93ebc94-7bd9-40dc-a830-94992c8229fa', N'60ef99dc-b7c1-4795-b470-62f0545ad3dc', 64, 1.5)
INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'0a5c14be-4059-43e4-8c30-bc548c6dcdec', N'a738a865-a13a-4167-af8b-403efd85d57a', 60, 1.6)
INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'df9c0e5b-26cf-46ed-a69a-bea5bf26890f', N'a3e4e040-36ba-45ed-a0b8-997e5c57f50b', 100, 1.7)
INSERT [dbo].[Paciente] ([IdPaciente], [IdPersona], [Peso], [Altura]) VALUES (N'ed1693cf-097c-4cae-8ce4-e8ec45d7b0b1', N'953ae812-a5fe-4e51-a4ec-befed6dd01cd', 91, 1.56)

INSERT [dbo].[OIEmpleados] ([IdOIEmpleados], [IdEmpleado], [FechaEntrada], [FechaSalida]) VALUES (N'561e0330-6f42-41d8-b3ff-a0644e5eb8c0', N'b7c35eff-3e36-43fc-b654-2825e8a149f5', CAST(0x793D0B00 AS Date), NULL)
INSERT [dbo].[OIEmpleados] ([IdOIEmpleados], [IdEmpleado], [FechaEntrada], [FechaSalida]) VALUES (N'bfa1c0db-0692-41e2-8394-199f655f7de4', N'e9e724a4-ffc3-4d1d-9c25-cbd46f4a4bb2', CAST(0x793D0B00 AS Date), NULL)
SET ANSI_PADDING OFF

INSERT [dbo].[Consulta] ([IdConsulta], [IdPaciente], [IdMedico], [FechaHora], [IdConsultorio], [IdEstatus], [Notas], [Costo]) VALUES (N'225bb75b-01a7-4cfd-a834-14b20b30e3c2', N'6e634df6-19a6-48c3-bea9-3f683c8b451c', 1, CAST(0x0000A770007B98A0 AS DateTime), 1, N'3', N'Dolor de cabeza izzi', 300)
SET IDENTITY_INSERT [dbo].[Categoria] ON
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (1, N'VentaLibre')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (2, N'Antibioticos')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (3, N'Pscotropicos')
INSERT [dbo].[Categoria] ([IdCategoria], [Descripcion]) VALUES (4, N'Cronico')
SET IDENTITY_INSERT [dbo].[Categoria] off
SET IDENTITY_INSERT [dbo].[Sucursal] ON
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [IdEmpresa]) VALUES (1, N'Missalvacion', 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [IdEmpresa]) VALUES (2, N'Las Torres', 1)
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [IdEmpresa]) VALUES (3, N'San Nicolas', 2)
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [IdEmpresa]) VALUES (4, N'Lab Estanzuela', 2)
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [IdEmpresa]) VALUES (5, N'TransDrugs Monterrey', 3)
INSERT [dbo].[Sucursal] ([IdSucursal], [Nombre], [IdEmpresa]) VALUES (6, N'TransDrugs Juarez', 3)
SET IDENTITY_INSERT [dbo].[Sucursal] OFF
set identity_insert dbo.proveedor on 

insert into Proveedor(IdProveedor,IdSucursal,LicenciaProveedor)
values(1,3,'lic.SectorPrivado')
insert into Proveedor(IdProveedor,IdSucursal,LicenciaProveedor)
values(5,3,'lic.SectorPrivado')
insert into Proveedor(IdProveedor,IdSucursal,LicenciaProveedor)
values(2,3,'lic.SectorPublico')
set identity_insert dbo.proveedor off

SET IDENTITY_INSERT [dbo].[PuestoEmpleado] ON
INSERT [dbo].[PuestoEmpleado] ([IdNivelEmpleado], [Puesto]) VALUES (1, N'Secretaria')
INSERT [dbo].[PuestoEmpleado] ([IdNivelEmpleado], [Puesto]) VALUES (2, N'Almacen')
INSERT [dbo].[PuestoEmpleado] ([IdNivelEmpleado], [Puesto]) VALUES (3, N'Medico')
INSERT [dbo].[PuestoEmpleado] ([IdNivelEmpleado], [Puesto]) VALUES (4, N'Sistemas')
SET IDENTITY_INSERT [dbo].[PuestoEmpleado] OFF
-----------------practica 5 selects--------------------------------------------------

SELECT peso from Paciente 
order by peso DESC;

select max(Peso) as Maximo, count(peso) as total, avg(Peso) as promedio
from Paciente

select min(Peso) as minimo, sum(Peso) as suma, avg(Peso) as promedio
from Paciente

select * from Paciente
 where Peso>10.00

 select * from Paciente
 where IdPaciente='EA148232-9491-4457-AA2A-488D5AEEABED'

 select count(IdPaciente) 
 from Paciente
 having count(Peso)<30.00
 
 select count(IdPaciente)
 from Paciente
 having count(Peso)<60.00

select count(IdMedicamento) as numeroMedicamento,PrecioBase
from Medicamento
group by PrecioBase;


select top 5 IdPaciente
from Paciente

select top 3 IdPaciente
From Paciente
order by Peso Asc
 
 select count(IdMedicamento) as Cantidad,IdMedicamento from Medicamento
 group by IdMedicamento
 
 select count(IdSucursal) as cantidadSucursales, min(IdSucursal) as minimo, max(IdSucursal)
 from Sucursal

 SELECT count(IdSucursal) as cantidadSucursal, min(IdSucursal), max(IdSucursal)
 from Consultorio
 
 select count(IdCategoria) as cantidadCategorias from Categoria
 having count(IdCategoria)>1

select count (IdConsultorio) as cantidadConsultorio from Consultorio
HAVING COUNT(IdConsultorio)>=1

select top 2 IdSucursal,Nombre
from Sucursal
order by IdSucursal ASC

 select count(IdPersona) as CantidadMedic,IdPersona from ContactoPersona
 group by IdPersona
 
 select count(correo) as cantidaddecoreos 
 from ContactoPersona


 SELECT count(IdSucursal) as cantidadMedicos, min(IdSucursal) as minimoMedic, max(IdSucursal) as maximMedic
 from ContactoSucursal
 
 select count(IdSucursal) as cantidadcorreos from ContactoSucursal
 having count(IdSucursal)>1
select count (Correo) as correos from ContactoPersona
HAVING COUNT(correo)>=2


select top 2 IdMedico
from Medico
order by IdMedico ASC

 select count(IdPersona) as CantidadPacient,IdPersona from ContactoPersona
 group by IdPersona
 
 select count(IdPersona) as cantidadMedicos, min(IdPersona) as minimoCorro, max(IdPersona) as maximoCorreo
 from ContactoPersona

 
 select count(IdEmpleado) as cantidadPacientes from Empleado
 having count(IdEmpleado)>1
select count (IdEmpleado) as correos from Empleado
HAVING COUNT(IdEmpleado)>=2


select top 3 IdEmpleado
from Empleado
order by Sueldo ASC

select count(IdEmpleado) as cantidadEstatus,IdEmpleado from Empleado
group by Sueldo
select count(IdEmpleado) as cantidadEstatus, min(IdEmpleado) as minimoEstatus, Max(IdEmpleado) as maximoEstatus
from Empleado
select count(IdEstatus) as cantidadEstatus
from Estatus

select * from Empleado
 where IdEmpleado='B7C35EFF-3E36-43FC-B654-2825E8A149F5'
 select * from Empresa
 where IdEmpresa=1
 

-----------------practica 6 vistas----------------------------------------------------


create view infoPersona	 as
select e.Nombre,e.ApMaterno,e.ApPaterno,v.Peso,v.Altura,k.Telefono,k.Correo
from Persona e
inner join Paciente as v on e.IdPersona = v.IdPersona  
inner join ContactoPersona as k on e.IdPersona = k.IdPersona

select * from infoPersona

create view infoMedico as 
select u.Nombre,u.ApPaterno,u.ApMaterno, k.IdMedico,k.IdEmpleado,l.PuestoEmpleado
from Medico k 
inner join Empleado as l on k.IdEmpleado = l.IdEmpleado
inner join Persona as u on l.IdPersona = u.IdPersona

Select* from infoMedico 
create view ComunicacionSucursal as 
select t.IdEmpresa,t.IdSucursal,t.Nombre,h.Correo,h.Telefono
from Sucursal t
inner join ContactoSucursal as h on t.IdSucursal=h.IdSucursal 
select * from ComunicacionSucursal

create view ConsultaPaciente as
select k.Nombre,k.ApMaterno,k.ApPaterno,k.Edad,e.IdPaciente,e.Peso,e.Altura,m.IdConsulta,m.FechaHora,m.IdConsultorio,m.Costo,m.Notas
from Consulta m 
inner join Paciente as e on e.IdPaciente = m.IdPaciente
inner join Persona as k on e.IdPersona=k.IdPersona

select * from ConsultaPaciente

create view  direccionPaciente as
select m.IdPersona,m.IdPaciente,p.Nombre,p.ApPaterno,p.ApMaterno,d.CalleNum,d.Municipio,d.IdEstado
from Paciente m 
inner join Persona p on m.IdPersona=p.IdPersona
inner join DireccionPersona as d on p.IdPersona=d.IdPersona
select * from direccionPaciente



create view categoriaMedicamento as 
select m.IdMedicamento,m.Nombre,m.PrecioBase,c.IdCategoria,c.Descripcion
from Medicamento m 
inner join Categoria as c on m.IdCategoria=c.IdCategoria
 
select * FROM categoriaMedicamento 

create view DireccionSucursal as 
select s.Nombre,d.IdSucursal,d.CalleNum,d.IdEstado,d.Municipio 
from Sucursal s
inner join DireccionSucursales as d on s.IdSucursal=d.IdSucursal
select *from DireccionSucursal

create view empresaSucursal as
select p.IdEmpresa,p.Nombre,o.IdSucursal,o.Nombre as nombreSucursal
from Empresa as p
inner join Sucursal as o on p.IdEmpresa=o.IdEmpresa

select * from empresaSucursal

create view proveedorSucursal as
select p.IdProveedor,p.LicenciaProveedor,s.IdSucursal,s.IdEmpresa
from Proveedor p
inner join Sucursal as s on p.IdSucursal=s.IdSucursal
select * from proveedorSucursal


select e.*, v.*
from Consulta e
left join Medico as v on e.IdMedico = v.IdMedico 
 
select e.*, v.*
from Consulta e
right join Medico as v on e.IdMedico = v.IdMedico  

select *
from 
(
select e.* , v.*, k.*
from Consulta e
inner join Medico as v on e.IdMedico = v.IdMedico  
inner join Estatus as k on e.IdEstatus = k.IdEstatus
)

-----------practica 7 procedures-fuctions-triggers------------------------------------------------------------------

create function CalDisolucionMed(@TotalMed float, @Diluyente float, @Dosis float)
returns float
begin 
return (@Dosis * @Diluyente) / @TotalMed
end


create function ImpuestoSal(@Salario float)
returns float
begin
return (@salario) - (@salario * 0.10)
end


create function DescuentoMedicina (@cMed float, @Descuento float)
returns float
begin
return (@cMed) - (@Descuento * @cMed)
end



create function MIC(@AltMt float, @Peso float) 
returns float
begin
return (@Peso)/(@Altmt * @Altmt)
end


create function IndiceTabaquico(@cigFumDia int, @añosFumando int)
returns float 
begin
return (@cigFumDia * @añosFumando) / 20
end
	


create function AlcoholemiaHom(@GrAlc float, @PesoKg float)
returns float
begin
return (@GrAlc) / (@PesoKg * .7)
end

	
create function AlcoholemiaMuj(@GrAlc float, @PesoKg float)
returns float
begin
return (@GrAlc) / (@PesoKg * .6)
end

create function AguaCorpHom(@Peso float)
returns float
begin
return (0.6 * @Peso)
end

create function AguaCorpMuj(@Peso float)
returns float
begin
return (0.5 * @Peso)
end


CREATE PROCEDURE BorrarMedicamentoByID
@ID uniqueidentifier
AS
BEGIN
	Delete Medicamento
	where IdMedicamento = @ID
END

exec BorrarMedicamentoByID 'ed796c91-f6b0-4e72-88e3-bc4b53138ba0'


CREATE PROCEDURE ActualizarMedicamentoByID
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

exec ActualizarMedicamentoByID 'ba1c2675-c141-4fbe-ab32-ddcd82e6ba7d','MedActualizado','DescripcionActualizada',1,1,1,'NombreGen Actualizado',100

CREATE PROCEDURE BorrarPersonaByID
@ID uniqueidentifier
AS
BEGIN
	Delete Persona
	where IdPersona = @ID
END

exec BorrarPersonaByID '127d6cf2-97db-4ccf-8c09-edb230e50e63'

CREATE PROCEDURE ActualizarPersonaByID
@ID uniqueidentifier,
@Nombre varchar(50),
@ApPaterno varchar(50),
@ApMaterno varchar(50), 
@FechaNacimiento DATE
AS
BEGIN
	Update Persona
	set Nombre = @Nombre ,ApPaterno = @ApPaterno,ApMaterno = @ApMaterno,FechaNac = @FechaNacimiento
	where IdPersona = @ID
END

exec ActualizarPersonaByID '127d6cf2-97db-4ccf-8c09-edb230e50e63','NombreActualizado','ApPaternoAct','ApMaternoAct','2001-12-07'

CREATE PROCEDURE ActualizarEstatusByID
@ID INT,
@Descripcion varchar(50)
AS
BEGIN
	Update Estatus
	set Descripcion = @Descripcion
	where IdEstatus = @ID
END

exec ActualizarEstatusByID 1,'Actualizado'


CREATE PROCEDURE BorrarEstatusByID
@ID INT
AS
BEGIN
	Delete Estatus
	where IdEstatus = @ID
END

exec BorrarEstatusByID 1

CREATE PROCEDURE ActualizarEstadoByID
@ID INT,
@Estado varchar(50)
AS
BEGIN
	Update Estado
	set Estado = @Estado
	where IdDireccion = @ID
END

exec ActualizarEstadoByID 1,'Culiacan'

CREATE PROCEDURE BorrarEstadoByID
@ID INT
AS
BEGIN
	Delete Estado
	where IdDireccion = @ID
END

exec BorrarEstadoByID 1

CREATE PROCEDURE ActualizarConsultorioByID
@ID INT,
@IdSucursal INT,
@NumeroConsultorio INT
AS
BEGIN
	Update Consultorio
	set IdSucursal = @IdSucursal, NumConsultorio = @NumeroConsultorio
	where IdConsultorio = @ID
END

exec ActualizarConsultorioByID 1,2,20

CREATE PROCEDURE BorrarConsultorioByID
@ID INT
AS
BEGIN
	Delete Consultorio
	where IdConsultorio = @ID
END

exec BorrarConsultorioByID 1

CREATE PROCEDURE BorrarConsultaByID
@ID UNIQUEIDENTIFIER
AS
BEGIN
	Delete Consulta
	where IdConsulta = @ID
END

exec BorrarConsultaByID '225bb75b-01a7-4cfd-a834-14b20b30e3c2'
CREATE PROCEDURE ActualizarCategoriaByID
@ID INT,
@Descripcion VARCHAR(50)
AS
BEGIN
	Update Categoria
	set Descripcion = @Descripcion
	where IdCategoria = @ID
END

exec ActualizarCategoriaByID 1, 'actualuzadicimo'


CREATE PROCEDURE BorrarCategoriaByID
@ID INT
AS
BEGIN
	Delete Categoria
	where IdCategoria = @ID
END

exec BorrarCategoriaByID 1