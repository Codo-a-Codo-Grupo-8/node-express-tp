
const express = require('express');
const app = express();
const port = 3000;


app.use(express.json());


const viviendasRoutes = require('./routes/viviendas');
const propietariosRoutes = require('./routes/propietarios');

app.use('/viviendas', viviendasRoutes);
app.use('/propietarios', propietariosRoutes);

app.listen(port, () => {
    console.log(`Server corriendo en el puerto ${port}`);
});
