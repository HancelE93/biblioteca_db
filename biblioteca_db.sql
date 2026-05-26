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

--Parte 5: Consultas SQL
-- Consulta 1
-- Mostrar título, autor, país y año de publicación
select l.titulo,a.nombre,a.pais,la.anio_publicacion
from libro_autor la inner join libros l
on la.la_libro_codigo_fk = l.codigo
inner join autores a on la.la_autor_id_fk = a.id;

-- Consulta 2
-- Libros publicados después del 2020
select l.titulo,la.anio_publicacion
from libro_autor la inner join libros l
on la.la_libro_codigo_fk = l.codigo
where la.anio_publicacion > 2020;

-- Consulta 3
-- Mostrar autores de un país específico
select *
from autores
where pais = 'Colombia';

-- Consulta 4
-- Ordenar libros por año de publicación descendente
select l.titulo,la.anio_publicacion
from libro_autor la inner join libros l
on la.la_libro_codigo_fk = l.codigo
order by la.anio_publicacion desc;

-- Consulta 5
-- Contar cuántos libros tiene cada autor
select a.nombre,
count(la.la_libro_codigo_fk) as cantidad_libros
from autores a inner join libro_autor la
on a.id = la.la_autor_id_fk
group by a.nombre;


--Parte 6: Modificación de la Tabla
-- Agregar nueva columna precio
alter table libros
add column precio double precision;

-- Actualizar precios de 3 libros
update libros set precio = 15.50
where codigo = 'L1';

update libros set precio = 20.00
where codigo = 'L2';

update libros set precio = 35.75
where codigo = 'L3';

-- Mostrar título y precio
select titulo,precio from libros;