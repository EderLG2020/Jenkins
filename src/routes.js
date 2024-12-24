const express = require('express');
const router = express.Router();

// Ruta de ejemplo
router.get('/hello', (req, res) => {
    res.json({ message: '¡Hola desde la API!' });
});

module.exports = router;
