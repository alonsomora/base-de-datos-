
create procedure reporteObesidad (@numero float )
as begin 
select * from dbo.HistorialPaciente
		where peso>@numero
	end 
GO
exec reporteObesidad 50.00

create procedure PersonasTerminales (@valor varchar(255))
as 
begin
		select * from dbo.VentasNueva
		where Estatus=@valor
		end
go

exec PersonasTerminales 'terminal'

create procedure reporteMedico (@valor varchar(255))
as begin 
		select * from dbo.VentasNueva
		where IdMedico=@valor
		end
	go

	exec reporteMedico '10691E0D-A44B-42AC-8E83-19D1B3EDBD0E'

create procedure reporteSucursal (@valor varchar(255),@valor2 varchar(255))
as begin 
		select * from dbo.SucursalMedicamento
		where IdMedicamento=@valor and IdSucursal=@valor2
		end 
	go
	
	exec reporteSucursal 'D425F1B2-0434-402E-A4F3-A39F04671DC5', '839D9496-C895-4B32-B382-FF07A1A74900'

create procedure reporteMedicoComunicacion(@valor varchar(255))
as begin 
		select * from dbo.comunicacionMedicos
		where IdMedico=@valor
		end 

	go 

	exec reporteMedicoComunicacion '267E0BF6-1C2E-4BDB-B247-F7AEE777A262'


create trigger DsiparadorConsulta
on Paciente 
after insert as begin select * from inserted 
end 

insert into Paciente(IdPaciente,Nombre,Apellidos,Edad,peso,altura)
values(newid(),'juan','Lopez',33,50.00,70.00)

 
create trigger StatusNuevo 
on Estatus 
after insert as begin select Estatus from inserted
end 

 insert into Estatus(IdEstatus,Estatus)
 values(newid(),'coma')

 create trigger	disparadorCorreoMedico
 on CorreoMedico
 instead of update
 as 
if update (Correo)
	begin
		select Correo from inserted
		end
else 
	begin select * from CorreoMedico
	end


update CorreoMedico
set Correo='otro@gmail.com'
where Correo='laura@gmail.com'


create function costoTotal(@c1 float, @c2 float)
returns float
as begin 
		return @c1 + @c2
		end  

		select dbo.costoTotal(33.55,11.53)