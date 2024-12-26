const express = require("express");
const app = express();
const port = 3000;

// Ruta principal
app.get("/", (req, res) => {
  res.send("¡Hola desde Node.js en Jenkins!");
});

// Iniciar el servidor
app.listen(port, () => {
  console.log(`La aplicación está corriendo en http://localhost:${port}`);
});
