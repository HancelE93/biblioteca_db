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

-- Parte 4: Insertar Datos
-- Insertar libros
insert into libros (codigo, titulo, paginas) values
('L1', 'Cien Años', 350),
('L2', 'El Principito', 120),
('L3', 'Don Quijote', 500),
('L4', 'Harry Potter', 420);

-- Insertar autores
insert into autores (id, nombre, pais) values
(1, 'Gabriel Garcia Marquez', 'Colombia'),
(2, 'Miguel de Cervantes', 'España'),
(3, 'J. K. Rowling', 'Inglaterra');

-- Insertar relaciones libro_autor
insert into libro_autor 
(la_libro_codigo_fk, la_autor_id_fk, anio_publicacion)
values
('L1', 1, 1967),
('L2', 1, 1943),
('L3', 2, 1605),
('L4', 3, 1997),
('L1', 2, 2000);
