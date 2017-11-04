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
inner join Estatus as k on e.IdEstatus = k.IdEstatus,
) 









create view VentasNueva as
select e.*   , v.IdMedico AS NombreMedico, v.Cedula, v.Apellidos, v.Nombre, k.Estatus
from Consulta e
inner join Medico as v on e.IdMedico = v.IdMedico  
inner join Estatus as k on e.IdEstatus = k.IdEstatus

select NombreMedico from VentasNueva
where Cedula=222


create view comunicacionMedicos as
select e.Correo, m.Apellidos,m.Cedula,m.IdMedico,m.Nombre,f.Telefono
from Medico M
inner join CorreoMedico as e on e.IdMedico = m.IdMedico
inner join TelfenoMedico as f on e.IdMedico = F.IdMedico

select IdMedico from comunicacionMedicos
where cedula=666

create view HistorialPaciente as 

select p.Nombre, p.peso, p.IdPaciente, h.IdPadecimiento,h.FechaDiagnostico,h.Notas,h.IdHistorialMedico
from Paciente as P
inner join HistorialMedico as H on p.IdPaciente = h.IdPaciente
inner join Padecimiento as l on l.IdPadecimiento= h.IdPadecimiento

select IdPaciente from HistorialPaciente
where Nombre='jose'


create view SucursalMedicamento as

select k.IdMedicamento,k.Nombre,k.PrecioBase,p.IdSucursal
from Medicamento as k
inner join MedSucursal as p on IdSucursal= p.IdSucursal

select IdSucursal from SucursalMedicamento
where IdSucursal='8BA53B71-4C46-4653-9E1D-3AAA02993D12'


create view labProveedor as 

select k.Nombre,k.IdMedicamento,k.PrecioBase,l.IdProveedor
from Medicamento as k
inner join Proveedor as l on l.IdProveedor = k.IdProveedor

select IdMedicamento from labProveedor
where IdMedicamento='D425F1B2-0434-402E-A4F3-A39F04671DC5'

select IdMedicamento
from MedSucursal 
where IdMedicamento='BFCF88EE-0F73-45D3-8B35-D8AF99CD8812'

select *
from (
select IdMedicamento
from MedSucursal 
where IdMedicamento='BFCF88EE-0F73-45D3-8B35-D8AF99CD8812'
)


 with otro as (
select IdMedicamento
FROM Medicamento
where IdMedicamento='BFCF88EE-0F73-45D3-8B35-D8AF99CD8812'
)
select *
from otro

select*
from CorreoMedico

select *
into #tiap
from CorreoMedico

update #tiap
set Correo='laura@hotmail.com'
where Correo='laura@gmail.com'


