-- database/02-insertar-datos-prueba.sql
-- Script para insertar datos de prueba

-- Géneros
INSERT INTO generos (nombre, slug) VALUES
  ('Ciencia Ficción', 'ciencia-ficcion'),
  ('Crimen', 'crimen'),
  ('Fantasía', 'fantasia'),
  ('Thriller', 'thriller'),
  ('Drama', 'drama');

-- Directores
INSERT INTO directores (nombre, nacionalidad, fecha_nac) VALUES
  ('Christopher Nolan', 'Británico', '1970-07-30'),
  ('Quentin Tarantino', 'Estadounidense', '1963-03-27'),
  ('Peter Jackson', 'Neozelandés', '1961-10-31'),
  ('Denis Villeneuve', 'Canadiense', '1967-10-03');

-- Películas (usando los IDs de directores y géneros)
INSERT INTO peliculas (titulo, anio, nota, director_id, genero_id) VALUES
  ('Inception', 2010, 8.8, 1, 1),
  ('The Dark Knight', 2008, 9.0, 1, 4),
  ('Pulp Fiction', 1994, 8.9, 2, 2),
  ('Inglourious Basterds', 2009, 8.3, 2, 2),
  ('El Señor de los Anillos', 2001, 8.8, 3, 3),
  ('Blade Runner 2049', 2017, 8.0, 4, 1),
  ('Dune', 2021, 8.1, 4, 1);

-- Reseñas
INSERT INTO resenas (pelicula_id, autor, texto, puntuacion) VALUES
  (1, 'María García', 'Una obra maestra del cine moderno', 10),
  (1, 'Carlos López', 'Confusa al principio pero brillante', 8),
  (2, 'Ana Martínez', 'El mejor superhéroe del cine', 10),
  (3, 'Luis Fernández', 'Clásico imprescindible', 9),
  (6, 'Carmen Ruiz', 'Visualmente impresionante', 8);

-- Verificar los datos
SELECT p.titulo, d.nombre AS director, g.nombre AS genero, p.nota
FROM peliculas p
JOIN directores d ON p.director_id = d.id
JOIN generos g ON p.genero_id = g.id
ORDER BY p.nota DESC;
