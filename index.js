// index.js
// Punto de entrada de la aplicación
require('dotenv').config()
const express = require('express')
const peliculasRoutes = require('./src/routes/peliculasRoutes')
const peliculaService = require('./src/services/PeliculaService')

// Conectar a la base de datos
require('./src/config/db')

const app = express()
const PORT = process.env.PORT || 3000

// Middleware
app.use(express.json())

// Rutas
app.use('/api/peliculas', peliculasRoutes)

// Ruta de estadísticas (separada según el README)
app.get('/api/estadisticas', async (req, res, next) => {
  try {
    const stats = await peliculaService.obtenerEstadisticas()
    res.json(stats)
  } catch (err) {
    next(err)
  }
})

// Middleware de manejo de errores
app.use((err, req, res, next) => {
  console.error(err.stack)
  res.status(err.statusCode || 500).json({
    error: err.message || 'Error interno del servidor'
  })
})

// Iniciar servidor
app.listen(PORT, () => {
  console.log(`Servidor en http://localhost:${PORT}`)
})