const { connect } = require('http2');
const mysql = require('mysql2');


const db = mysql.createConnection({
    host: 'localhost',
    user: 'DanielSpinella', 
    password: 'Damispi2525', 
    database: 'viviendas_db'
   
});

db.connect((err) => {
    if (err) {
        console.error('Error de coneccion a la  database:', err);
        return;
    }
    console.log('Conectado a la  database');
});
module.exports=db