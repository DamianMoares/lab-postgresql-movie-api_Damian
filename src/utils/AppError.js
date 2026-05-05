// src/utils/AppError.js
// Clase para manejar errores personalizados en la aplicación

class AppError extends Error {
  constructor(mensaje, statusCode) {
    super(mensaje)
    this.statusCode = statusCode
    this.isOperational = true

    Error.captureStackTrace(this, this.constructor)
  }
}

module.exports = AppError
