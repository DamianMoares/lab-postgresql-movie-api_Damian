-- database/01-crear-base-datos.sql
-- Script para crear la base de datos y el esquema

-- Crear la base de datos
CREATE DATABASE peliculas_db;

-- Conectarse a la base de datos
\c peliculas_db

-- Tabla de géneros (primero, porque peliculas la referencia)
CREATE TABLE generos (
  id    SERIAL PRIMARY KEY,
  nombre VARCHAR(50) UNIQUE NOT NULL,
  slug   VARCHAR(50) UNIQUE NOT NULL
);

-- Tabla de directores
CREATE TABLE directores (
  id           SERIAL PRIMARY KEY,
  nombre       VARCHAR(100) NOT NULL,
  nacionalidad VARCHAR(50),
  fecha_nac    DATE
);

-- Tabla principal de películas
CREATE TABLE peliculas (
  id          SERIAL PRIMARY KEY,
  titulo      VARCHAR(255) NOT NULL,
  anio        INTEGER NOT NULL CHECK (anio >= 1888 AND anio <= 2100),
  nota        DECIMAL(3,1) CHECK (nota >= 0 AND nota <= 10),
  director_id INTEGER REFERENCES directores(id) ON DELETE SET NULL,
  genero_id   INTEGER REFERENCES generos(id) ON DELETE SET NULL,
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- Índices para búsquedas frecuentes
CREATE INDEX idx_peliculas_director ON peliculas(director_id);
CREATE INDEX idx_peliculas_genero ON peliculas(genero_id);

-- Tabla de reseñas
CREATE TABLE resenas (
  id          SERIAL PRIMARY KEY,
  pelicula_id INTEGER NOT NULL REFERENCES peliculas(id) ON DELETE CASCADE,
  autor       VARCHAR(100) NOT NULL,
  texto       TEXT NOT NULL,
  puntuacion  INTEGER NOT NULL CHECK (puntuacion >= 1 AND puntuacion <= 10),
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- Verificar las tablas creadas
\dt
