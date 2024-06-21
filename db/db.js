const { connect } = require('http2');
const mysql = require('mysql2');


const db = mysql.createConnection({
    host: 'mysql-danielprg.alwaysdata.net',
    user: 'danielprg', 
    password: 'damispi1010', 
    database: 'danielprg_vivienda'
   
});

db.connect((err) => {
    if (err) {
        console.error('Error de coneccion a la  database:', err);
        return;
    }
    console.log('Conectado a la  database');
});
module.exports=db