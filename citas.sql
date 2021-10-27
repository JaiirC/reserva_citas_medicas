/* creacion de base datos*/
 create database prueba2;

/*creacion de las tablas*/
 create table paciente(ci_paciente varchar(10) not null,
					   nombre_paciente varchar(10) not null,
					   apellido_paciente varchar(10) not null,
					   direccion_paciente varchar(10) not null,
					   tlf_paciente varchar(10) not null,
					   primary key (ci_paciente)
					  );
					  
					  
/*agregar otra columna*/			
 alter table paciente add provincia varchar (20) not null;
 /*cambiar de nombre*/
 alter table paciente rename column provincia to ciudad;
 
 

 create table medico(ci_medico varchar(10) not null,
					   nombre_medico varchar(10) not null,
					   apellido_medico varchar(10) not null,
					   especialidad varchar(10) not null,
					   tlf_medico varchar(10) not null,
					   primary key (ci_medico)
					  );

/* Insertar datos en tabla medico*/
/*metodo corto*/
insert into medico values ('1721901302','Juan','Perez','Pediatra','0999841214');
/*metodo largo*/
insert into medico (ci_medico,nombre_medico,apellido_medico, especialidad, tlf_medico) values ('1721901303','Pedro','Castillo','pediatra','0987654321');
select * from medico;
/*metodo masivo*/
insert into medico values ('17788714'|| generate_series(1,9), 
						  'Juan' || generate_series(1,9), 
						   'Perez' || generate_series(1,9), 
						   'Pediatra'|| generate_series(1,9), 
						   '099984121'|| generate_series(1,9)
						  );
	
	
	
  create table especialidad(id_especialidad varchar(10) not null,
							nombre varchar(10) not null,
							primary key (id_especialidad)
						   );
																					
 create table citas(codigo integer not null,
					fecha date not null,
					hora time not null,
					ci_paciente varchar(10),
					id_em integer not null,
					primary key (codigo));
					
 alter table citas add foreign key (ci_paciente) references paciente(ci_paciente);
 alter table citas add foreign key (id_em) references especialidadMedico(id_em);
 
					
 create table especialidadMedico(id_em integer not null,
								 horarioini time not null,
								 horariofin time not null,
								 ci_medico varchar(10) not null,
								 id_especialidad varchar(10) not null,
								 primary key(id_em));
 alter table especialidadMedico add foreign key (ci_medico) references medico(ci_medico);	
 alter table especialidadMedico add foreign key (id_especialidad) references especialidad(id_especialidad);	
 
						

						   