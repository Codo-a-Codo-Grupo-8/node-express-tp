
const express = require('express');
const app = express();
const dotenv=require('dotenv');
const port = 3000;
const path = require('path');
const cors = require('cors');


dotenv.config();

app.use(cors());
app.use(express.json());
app.use(express.static(path.join(__dirname, 'public')));

const viviendasRoutes = require('./routes/viviendas');
const propietariosRoutes = require('./routes/propietarios');
const authTokenRouter = require('./routes/auth_token');

app.use('/viviendas', viviendasRoutes);
app.use('/propietarios', propietariosRoutes);
app.use('/auth_token', authTokenRouter)

app.listen(port, () => {
    console.log(`Server corriendo en el puerto ${port}`);
});
