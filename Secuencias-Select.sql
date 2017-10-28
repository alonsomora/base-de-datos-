SELECT IdConsulta from Consulta 
order by IdMedico DESC;

select max(costo) as Maximo, count(costo) as total, avg(costo) as promedio
from Consulta

select min(Costo) as minimo, sum(costo) as suma, avg(costo) as promedio
from Consulta

select * from Consulta
 where Costo>10.00

 select * from Consulta
 where IdPaciente='50112074-0EBB-4CED-A687-24CA2D380B70'

 select count(Costo) 
 from Consulta
 having count(Costo)<30.00
 
 select count(costo)
 from Consulta
 having count(costo)>35.00

select count(IdConsulta) as numeroConsultas, Hora
from Consulta 
group by Hora;

select top 1 IdPaciente
from Consulta

select top 2 IdPaciente
From Consulta 
order by Idpaciente Asc
 
 select count(IdConsultorio) as Cantidad,IdConsultorio from Consultorio
 group by IdConsultorio 
 
 select count(IdConsultorio) as cantidadSucursales, min(IdConsultorio) as minimo, max(IdConsultorio)
 from Consultorio

 SELECT count(IdSucursal) as cantidadSucursal, min(IdSucursal), max(IdSucursal)
 from Consultorio
 
 select * from Consultorio
 where IdSucursal='B88C9A4C-0DB8-4E05-B89E-6FE1949455CF'
 select * from Consultorio
 where IdSucursal='49222854-5187-4C0B-9153-99843678EE4A'
 
 select count(IdSucursal) as cantidadSucursales from Consultorio
 having count(IdSucursal)>1
select count (IdConsultorio) as cantidadConsultorio from Consultorio
HAVING COUNT(IdConsultorio)>=2

select top 2 IdSucursal
from Consultorio
order by IdSucursal ASC

 select count(IdMedico) as CantidadMedic,IdMedico from CorreoMedico
 group by IdMedico
 
 select count(correo) as cantidaddecoreos 
 from correoMedico 


 SELECT count(IdMedico) as cantidadMedicos, min(IdMedico) as minimoMedic, max(IdMedico) as maximMedic
 from CorreoMedico
 
 select * from CorreoMedico
 where IdMedico='267E0BF6-1C2E-4BDB-B247-F7AEE777A262'
 select * from CorreoMedico
 where IdMedico='10691E0D-A44B-42AC-8E83-19D1B3EDBD0E'
 
 select count(IdMedico) as cantidadcorreos from CorreoMedico
 having count(IdMedico)>1
select count (correo) as correos from correoMedico
HAVING COUNT(correo)>=2


select top 2 IdMedico
from CorreoMedico
order by IdMedico ASC

 select count(IdPaciente) as CantidadPacient,IdPaciente from CorreoPaciente
 group by IdPaciente
 
 select count(IdPaciente) as cantidadMedicos, min(IdPaciente) as minimoCorro, max(IdPaciente) as maximoCorreo
 from CorreoPaciente

 
 select count(IdPaciente) as cantidadPacientes from CorreoPaciente
 having count(IdPaciente)>1
select count (correo) as correos from CorreoPaciente
HAVING COUNT(correo)>=2


select top 2 IdPaciente
from CorreoPaciente
order by IdPaciente ASC

select count(IdEstatus) as cantidadEstatus, estatus from Estatus
group by Estatus
select count(IdEstatus) as cantidadEstatus, min(IdEstatus) as minimoEstatus, Max(IdEstatus) as maximoEstatus
from Estatus
select count(IdEstatus) as cantidadEstatus
from Estatus

select * from Estatus
 where IdEstatus='93A5875A-3B15-4FC3-8BA4-9B9A70855507'
 select * from Estatus
 where IdEstatus='482824D0-0405-4D92-998B-F386BB583F78'
 
 select count(IdEstatus) as cantidadEstatus from Estatus
 having count(IdEstatus)>1
select count (IdEstatus) as Estatus from Estatus
HAVING COUNT(IdEstatus)>=2


select top 2 IdEstatus
from Estatus
order by IdEstatus ASC

select count(IdHistorialMedico) as cantidadhISTORIALES,IdHistorialMedico from HistorialMedico
group by IdHistorialMedico
select count(IdHistorialMedico) as cantidadHistoriales, min(IdHistorialMedico) as minimoHistoriales, Max(IdHistorialMedico) as maximoHistoriales
from HistorialMedico
select count(IdHistorialMedico) as cantidadHistoriales
from HistorialMedico

select * from HistorialMedico
 where IdHistorialMedico='18D6E5DA-A41F-4CBD-8BB3-B03EB6F9C75A'
 select * from HistorialMedico
 where IdPaciente='50112074-0EBB-4CED-A687-24CA2D380B70'
 
 select count(IdHistorialMedico) as cantidadHistoriales from HistorialMedico
 having count(IdHistorialMedico)>1
select count (IdPaciente) as pacientesHistoriales from HistorialMedico
HAVING COUNT(IdPaciente)>3


select top 2 IdHistorialMedico
from HistorialMedico
order by IdHistorialMedico ASC

select count(IdLaboratorio) as cantidadhlaboratorios,IdLaboratorio from Laboratorio
group by IdLaboratorio
select count(IdLaboratorio) as cantidadLab, min(IdLaboratorio) as minimoLab, Max(IdLaboratorio) as maximoLab
from Laboratorio
select count(Nombre) as cantidadNombre
from Laboratorio

select * from Laboratorio
 where Nombre='Reform'
 select * from Laboratorio
 where IdLaboratorio='33BC5B47-4E08-44BC-94DE-CF538E53EDE1'
 
 select count(IdLaboratorio) as cantidadLab from Laboratorio
 having count(IdLaboratorio)>1
select count (Nombre) as cantidadNombres from Laboratorio
HAVING COUNT(IdLaboratorio)>3


select top 10 IdLaboratorio
from Laboratorio
order by  IdLaboratorio ASC

select count(IdMedicamento) as cantidadMedica,IdMedicamento from Medicamento
group by IdMedicamento
select count(IdMedicamento) as cantidadMedicamento, min(IdMedicamento) as minimoMeciamento, Max(IdMedicamento) as maximoMeicamento
from Medicamento
select count(IdMedicamento) as cantidadMeicamentos, avg(PrecioBase) as promediopreciobase, sum(PrecioBase) as preciobase
from Medicamento

select * from Medicamento
 where Nombre='treda'
 select * from Medicamento
 where IdProveedor='C898EA11-487B-4393-81B3-98C0FAB586ED'
 
 select count(IdMedicamento) as cantidadMeciamento from Medicamento
 having count(IdMedicamento)>1
select count (Nombre) as cantidadNombres from Medicamento
HAVING COUNT(IdMedicamento)>3


select top 10 IdMedicamento
from Medicamento
order by  IdMedicamento ASC


select count(IdMedico) as cantidadMedicos,IdMedico from Medico
group by IdMedico
select count(IdMedico) as cantidadMedicos, min(IdMedico) as minimoMedicos, Max(IdMedico) as maximoMedicos
from Medico 
select count(Nombre) as cantidadNombres
from Medico

select * from Medico
 where Nombre='Alonso'
 select * from Medico
 where IdMedico='267E0BF6-1C2E-4BDB-B247-F7AEE777A262'
 
 select count(IdMedico) as cantidadMedicos from Medico
 having count(IdMedico)>1
select count (Nombre) as cantidadNombres from Medico
HAVING COUNT(IdMedico)>3


select top 10 IdMedico
from Medico
order by  IdMedico ASC

select count(IdSucursal) as cantidadSucursal,IdSucursal from MedSucursal
group by IdSucursal
select count(Cantidad) as cantidadproductos, min(cantidad) as minimoProductos, Max(Cantidad) as maximoProductos
from MedSucursal
select count(Cantidad) as cantidadProductos, avg(Cantidad) as promedioProductos, sum(Cantidad) as sumaProductos
from MedSucursal

select * from MedSucursal
 where Cantidad=22
 select * from MedSucursal
 where IdSucursal='839D9496-C895-4B32-B382-FF07A1A74900'
 
 select count(IdSucursal) as cantidadSucursales from MedSucursal
 having count(IdSucursal)>1
select count (IdMedicamento) as cantidadMedicamentos from MedSucursal
HAVING COUNT(IdMedicamento)>3


select top 10 IdSucursal
from MedSucursal
order by  IdSucursal ASC

select count(IdPaciente) as cantidadPacientes,IdPaciente from Paciente
group by IdPaciente
select count(peso) as cantidaddePesoTotal, min(peso) as minimoPeso, Max(peso) as maximoPeso
from Paciente
select count(peso) as cantidadDePesoTotal, avg(peso) as promedioPeso, sum(peso) as sumaPeso
from Paciente

select * from Paciente
 where peso=82.2
 select * from Paciente
 where IdPaciente='14792B77-F7E0-40C2-B7F0-A8D28FC46DD3'
 
 select count(IdPaciente) as cantidadPacientes from Paciente
 having count(IdPaciente)>1
select count (altura) as cantidaddeAlturaTotal from Paciente
HAVING COUNT(altura)>3


select top 10 IdPaciente
from Paciente
order by  IdPaciente ASC

select count(IdPadecimiento) as cantidadPadecimientos,IdPadecimiento from Padecimiento
group by IdPadecimiento
select count(IdPadecimiento) as cantidadDePadecimientos, min(IdPadecimiento) as minimoPadecimientos, Max(IdPadecimiento) as maximoPadecimientos
from Padecimiento
select count(Nombre) as cantidadNombre
from Padecimiento

select * from Padecimiento
 where Nombre='VIH'
 select * from Padecimiento
 where IdPadecimiento='6B6A2666-0EBD-43B6-90F2-D0CA8CBD302E'
 
 select count(IdPadecimiento) as cantidadPadecimientos from Padecimiento
 having count(IdPadecimiento)>1
select count (Nombre) as cantidadDeNombres from Padecimiento
HAVING COUNT(Nombre)>3


select top 10 Idpadecimiento
from Padecimiento
order by  IdPadecimiento ASC

select count(IdProveedor) as cantidadProveedores,IdProveedor from Proveedor
group by IdProveedor
select count(IdProveedor) as cantidadDeProveedores, min(IdProveedor) as minimoProvedores, Max(IdProveedor) as maximoProveedores
from Proveedor
select count(Nombre) as cantidadProveedores
from Proveedor

select * from Proveedor
 where Nombre='Honestech'
 select * from Proveedor
 where IdProveedor='371E4E67-A9E4-441F-A5A3-AC90CCD3E18E'
 
 select count(IdProveedor) as cantidadProveedores from Proveedor
 having count(IdProveedor)>1
select count (Nombre) as cantidadDeNombres from Proveedor
HAVING COUNT(Nombre)>3


select top 10 IdProveedor
from Proveedor
order by  IdProveedor ASC


select count(IdSucursal) as cantidasSUCURSALES,IdSucursal from Sucursal
group by IdSucursal
select count(IdSucursal) as cantidadDeSucursales, min(IdSucursal) as minimoSucursales, Max(IdSucursal) as maximoSucursales
from Sucursal
select count(Nombre) as cantidadNombres
from Sucursal

select * from Sucursal
 where Nombre='Infoteca'
 select * from Sucursal
 where IdSucursal='839D9496-C895-4B32-B382-FF07A1A74900'
 
 select count(IdSucursal) as cantidadSucursales from Sucursal
 having count(IdSucursal)>1
select count (Nombre) as cantidadDeNombres from Sucursal
HAVING COUNT(Nombre)>3


select top 10 IdSucursal
from Sucursal
order by  IdSucursal ASC


select count(IdPaciente) as cantidasPacienteConCel,IdPaciente from TelefonoPaciente
group by IdPaciente
select count(IdPaciente) as cantidadDePacientesCelular, min(IdPaciente) as minimPacientesCel, Max(IdPaciente) as maximoPacientesCel
from TelefonoPaciente
select count(IdPaciente) as cantidadPersonasCelular, sum(Telefono) as sumaCel, avg(Telefono) as PromedioCel
from TelefonoPaciente

select * from TelefonoPaciente
 where Telefono=19394933
 select * from TelefonoPaciente
 where IdPaciente='50112074-0EBB-4CED-A687-24CA2D380B70'
 
 select count(IdPaciente) as cantidadPacientesCel from TelefonoPaciente
 having count(IdPaciente)>1
select count (telefono) as cantidadDeTelefonos from TelefonoPaciente
HAVING COUNT(Telefono)>3


select top 10 IdPaciente
from TelefonoPaciente
order by  IdPaciente ASC

select count(IdMedico) as cantidasMedicosConCel,IdMedico from TelfenoMedico
group by IdMedico
select count(IdMedico) as cantidadDeMedicosCelular, min(IdMedico) as minimMedicosCel, Max(IdMedico) as maximoMedicosCel
from TelfenoMedico
select count(IdMedico) as cantidadMedicoCelular, max(Telefono) as maxiCel, sum(telefono) as sumacel
from TelfenoMedico

select * from TelfenoMedico
 where Telefono=8181818
 select * from TelfenoMedico
 where IdMedico='10691E0D-A44B-42AC-8E83-19D1B3EDBD0E'
 
 select count(IdMedico) as cantidadMedicosCel from TelfenoMedico
 having count(IdMedico)>1
select count (telefono) as cantidadDeTelefonos from TelfenoMedico
HAVING COUNT(Telefono)>3


select top 10 IdMedico
from TelfenoMedico
order by  IdMedico ASC