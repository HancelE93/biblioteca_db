--Parte 1: Se crea la base de datos biblioteca_db

-- Parte 2: Crear tabla libros
create table libros (
	codigo varchar(5) primary key,
	titulo varchar(50) not null,
	paginas int not null
);

-- Crear tabla autores
create table autores (
	id int primary key,
	nombre varchar(50) not null,
	pais varchar(30) not null
);

-- Parte 3: Tabla de rompimiento
create table libro_autor (
	la_libro_codigo_fk varchar(5) not null,
	la_autor_id_fk int not null,
	anio_publicacion int not null,

	constraint libro_fk foreign key (la_libro_codigo_fk)
	references libros(codigo),

	constraint autor_fk foreign key (la_autor_id_fk)
	references autores(id),

	constraint libro_autor_pk 
	primary key (la_libro_codigo_fk, la_autor_id_fk)
);

select * from libros;
select * from autores;
select * from libro_autor;