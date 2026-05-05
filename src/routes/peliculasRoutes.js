// src/routes/peliculasRoutes.js
// Rutas para el endpoint de películas
const express = require('express')
const router = express.Router()
const {
  obtenerTodas,
  obtenerPorId,
  crear,
  actualizar,
  eliminar,
  obtenerResenas,
  crearResena
} = require('../controllers/PeliculaController')

// Rutas de películas
router.get('/', obtenerTodas)
router.post('/', crear)

// Rutas con parámetro :id
router.get('/:id', obtenerPorId)
router.put('/:id', actualizar)
router.delete('/:id', eliminar)

// Rutas de reseñas
router.get('/:id/resenas', obtenerResenas)
router.post('/:id/resenas', crearResena)

module.exports = router
