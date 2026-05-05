// src/controllers/PeliculaController.js
// Controlador para manejar las peticiones HTTP de películas
const peliculaService = require('../services/PeliculaService')

const obtenerTodas = async (req, res, next) => {
  try {
    const { genero, buscar } = req.query
    const peliculas = await peliculaService.obtenerTodas({ genero, buscar })
    res.json(peliculas)
  } catch (err) {
    next(err)
  }
}

const obtenerPorId = async (req, res, next) => {
  try {
    const pelicula = await peliculaService.obtenerPorId(Number(req.params.id))
    res.json(pelicula)
  } catch (err) {
    next(err)
  }
}

const crear = async (req, res, next) => {
  try {
    const pelicula = await peliculaService.crear(req.body)
    res.status(201).json(pelicula)
  } catch (err) {
    next(err)
  }
}

const actualizar = async (req, res, next) => {
  try {
    const pelicula = await peliculaService.actualizar(Number(req.params.id), req.body)
    res.json(pelicula)
  } catch (err) {
    next(err)
  }
}

const eliminar = async (req, res, next) => {
  try {
    const pelicula = await peliculaService.eliminar(Number(req.params.id))
    res.json(pelicula)
  } catch (err) {
    next(err)
  }
}

const obtenerEstadisticas = async (req, res, next) => {
  try {
    const stats = await peliculaService.obtenerEstadisticas()
    res.json(stats)
  } catch (err) {
    next(err)
  }
}

// =====================
// Reseñas
// =====================
const obtenerResenas = async (req, res, next) => {
  try {
    const resenas = await peliculaService.obtenerResenas(Number(req.params.id))
    res.json(resenas)
  } catch (err) {
    next(err)
  }
}

const crearResena = async (req, res, next) => {
  try {
    const resena = await peliculaService.crearResena(Number(req.params.id), req.body)
    res.status(201).json(resena)
  } catch (err) {
    next(err)
  }
}

module.exports = {
  obtenerTodas,
  obtenerPorId,
  crear,
  actualizar,
  eliminar,
  obtenerEstadisticas,
  obtenerResenas,
  crearResena
}
