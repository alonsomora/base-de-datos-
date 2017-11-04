insert into Estatus (IdEstatus, Estatus)
 values 
 (NEWID(), 'Vegetal'),
 (NEWid(), 'por_salir'),
 (NEWID(), 'sin_enfermedad'),
  (newid(), 'ligero_malestar')

  update Estatus
  set Estatus = 'bienestar'
  where idEstatus= 'DABF7F48-CDF3-4434-8738-29675FE50450'
  update Estatus
  set Estatus = 'Estado_vegetal'
  where IdEstatus ='BE5AC6E2-F8D0-4FB4-912F-C282CC42EFEF'
  update Estatus 
  set Estatus ='salida'
  where IdEstatus ='93A5875A-3B15-4FC3-8BA4-9B9A70855507'

  delete from Estatus
  where IdEstatus ='BE5AC6E2-F8D0-4FB4-912F-C282CC42EFEF'
  delete from Estatus
  where IdEstatus ='BF849ADB-447F-4F79-A1C7-5F743E3D7F6A'
  delete from Estatus 
  where IdEstatus ='DABF7F48-CDF3-4434-8738-29675FE50450'


  insert into Medico
  (IdMedico,Cedula,Nombre,Apellidos)
  values (Newid(),222,'Alonso','Morales ramirez'),
  (newid(), 333,'oscar','Granado Vazques'),
  (newid(), 444,'Jahir','Sebastian Vazquez'),
  (newid(), 555,'Ulises','Del Angel Marin'),
  (newid(), 666,'Ramira', 'Rufo Martinez')

  update Medico
  set nombre='Laura'
  where Nombre = 'Ramira'
  update Medico
  set nombre='Luis'
  where Nombre='Ulises'
  update Medico
  set Nombre='Juan'
  where Nombre='Jahir'

  delete from Medico
  where Nombre='Luis'
  delete from Medico
  where Nombre='Juan'
  delete from Medico
  where Nombre='Oscar'



  insert into CorreoMedico
  (IdMedico,Correo)
  values('10691E0D-A44B-42AC-8E83-19D1B3EDBD0E','Alonso_@hotmail.com'),
  ('267E0BF6-1C2E-4BDB-B247-F7AEE777A262','laura@gmail.com'),
  ('267E0BF6-1C2E-4BDB-B247-F7AEE777A262','laura.11@hotmail.com'),
  ('267E0BF6-1C2E-4BDB-B247-F7AEE777A262', 'laura_rifa@outlook'),
  ('10691E0D-A44B-42AC-8E83-19D1B3EDBD0E','Alonso_cero@gmail.com')

  update CorreoMedico
  set Correo='ne@gmail.com'
  where Correo='Alonso_@hotmail.com'
  update CorreoMedico
  set Correo='ahora@gmail.com'
  where Correo='laura.11@hotamil.com'
  update CorreoMedico
  set Correo='Alonso_cero@gmail.com'
  where Correo='Alonso_cero@gmail.com'

  delete from CorreoMedico
  where Correo='Alonso_caro@gmail.com'
  delete from CorreoMedico
  where Correo='ahora"gmail.com'
  delete from CorreoMedico
  where Correo='ne@gmail.com'


  insert into TelfenoMedico
  (IdMedico,Telefono)
  values('10691E0D-A44B-42AC-8E83-19D1B3EDBD0E',8181818),
  ('267E0BF6-1C2E-4BDB-B247-F7AEE777A262',1334445),
  ('267E0BF6-1C2E-4BDB-B247-F7AEE777A262',81817915),
  ('267E0BF6-1C2E-4BDB-B247-F7AEE777A262', 17568990),
  ('10691E0D-A44B-42AC-8E83-19D1B3EDBD0E',18259300)

  update TelfenoMedico
  set Telefono=195833
  where Telefono=18259300
  update TelfenoMedico
  set 
  Telefono=89181922
  where Telefono=81817915
  update TelfenoMedico
  set Telefono=127758
  where Telefono=17568990

  delete from TelfenoMedico
  where Telefono=127758
  delete from TelfenoMedico
  where Telefono=89181922
  delete from TelfenoMedico
  where 
  Telefono=195833

  insert into Paciente (IdPaciente,Nombre,Apellidos,Edad,peso,altura)
  values (newid(),'Luis','Carrizales',23,88.2,1.80),
  (NEWID(),'Arturo','Alvaro Lopez', 44,68.33,1.60),
  (NEWID(),'Ana','Martinez Loro',35,70.22,17.00),
  (NewId(), 'Raul','Martinez cano',32,68.00,1.70)

  update Paciente 
  set Nombre = 'Carlos'
  where Nombre = 'Luis'
  update Paciente 
  set Nombre= 'Omar'
  where Nombre='Ana'
  update Paciente 
  set Nombre='Lauro'
  where Nombre='Raul'
  delete from Paciente 
  where Nombre='Lauro'
  delete from Paciente 
  where Nombre='Omar'
  delete from paciente 
  where Nombre ='Carlos'


  insert into TelefonoPaciente
  (IdPaciente,Telefono)
  values('50112074-0EBB-4CED-A687-24CA2D380B70',1818828),
  ('50112074-0EBB-4CED-A687-24CA2D380B70',1223993),
  ('50112074-0EBB-4CED-A687-24CA2D380B70',19399489),
  ('14792B77-F7E0-40C2-B7F0-A8D28FC46DD3',19394933),
  ('14792B77-F7E0-40C2-B7F0-A8D28FC46DD3',12213131)

  update TelefonoPaciente
  set Telefono= 1121111
  where Telefono=19399489
  update TelefonoPaciente
  set Telefono=1932929
  where Telefono=12213131
  update TelefonoPaciente
  set Telefono=1289984
  where Telefono=1818828

  delete from TelefonoPaciente
  where Telefono=1932929
  delete from TelefonoPaciente
  where Telefono=1289984
  Delete from TelefonoPaciente
  where Telefono=1121111

  insert into Sucursal(IdSucursal,Nombre)
  values(newid(),'San francisco'),
  (newid(),'San villas'),
  (newid(),'Tolko'),
  (newid(),'Palce'),
  (newid(),'infosec')

	update Sucursal
	set Nombre='Mento'
	where Nombre='San francisco'
	update Sucursal
	set Nombre='Parras'
	where Nombre='Palce'
	update Sucursal
	set Nombre='Infoteca'
	where Nombre='infosec'
	
	delete from Sucursal
	where Nombre='Parras'
	delete from Sucursal
	where Nombre='San villas'
	delete From Sucursal
	where Nombre='Mento'

  insert into Consultorio
	(IdConsultorio,IdSucursal)
	VALUES (newid(),'8BA53B71-4C46-4653-9E1D-3AAA02993D12'),
	(newid(),'8BA53B71-4C46-4653-9E1D-3AAA02993D12'),
	(newid(),'839D9496-C895-4B32-B382-FF07A1A74900'),
	(newid(),'839D9496-C895-4B32-B382-FF07A1A74900'),
	(newid(),'839D9496-C895-4B32-B382-FF07A1A74900')

	update Consultorio
	set IdSucursal='839D9496-C895-4B32-B382-FF07A1A74900'
	where IdConsultorio='24987FF1-8918-4620-90BD-2CAA9FB96D14'

	update Consultorio
	set IdSucursal='839D9496-C895-4B32-B382-FF07A1A74900'
	where IdConsultorio ='E799BA1E-CD6A-4227-B95C-3538562EEDE2'

	update Consultorio 
	set IdSucursal= '8BA53B71-4C46-4653-9E1D-3AAA02993D12'
	where IdConsultorio ='C904C65F-5F4E-46A8-857B-8C8E86B6335A'

	delete from Consultorio 
	where IdConsultorio ='C904C65F-5F4E-46A8-857B-8C8E86B6335A'
	delete from Consultorio
	where IdConsultorio ='E799BA1E-CD6A-4227-B95C-3538562EEDE2'
	delete from Consultorio
	where IdConsultorio='24987FF1-8918-4620-90BD-2CAA9FB96D14'

	insert into Proveedor
	(IdProveedor, Nombre,RFC)
	values(newid(),'Texty', 1345983),
	(newid(),'Tapesco',739374),
	(newid(),'Taclaxco',759832),
	(newid(),'Plumbe',919293),
	(newid(),'Flapeco',8493095)

	update Proveedor
	set Nombre='Flapico'
	where Nombre='Flapeco'
	update Proveedor 
	set Nombre='Textly'
	where Nombre='Texty'
	update Proveedor
	set Nombre='Tapleco'
	where Nombre='Tapesco'

	delete from Proveedor
	where Nombre='Flapico'
	delete from Proveedor 
	where Nombre='Textly'
	delete from Proveedor
	where Nombre='Tapleco'


insert into Consulta 
(IdConsulta,IdPaciente,IdMedico,Fecha,Hora,IdConsultorio,IdEstatus,Costo,Descripcion)

values(newid(),'50112074-0EBB-4CED-A687-24CA2D380B70','10691E0D-A44B-42AC-8E83-19D1B3EDBD0E','2017/05/05','10:00','B88C9A4C-0DB8-4E05-B89E-6FE1949455CF','93A5875A-3B15-4FC3-8BA4-9B9A70855507',89.00,'el costo de la consuolta es cara')

