const express = require('express');

const db = require("../db/db");


const index=(req, res) => {
    const sql = 'SELECT * FROM viviendas';
    db.query(sql, (err, results) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        if (results.length === 0) {
            return res.status(404).json({ message: 'No hay viviendas disponibles' });
        }
        res.json(results);
    });
};


const show=(req, res) => {
    const { id } = req.params;
    const sql = 'SELECT * FROM viviendas WHERE idvivienda = ?';
    db.query(sql, [id], (err, result) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        if (result.length === 0) {
            return res.status(404).json({ error: 'No hay viviendas en la base de datos' });
        }
        res.json(result[0]);
    });
};
const store=(req, res) => {
    const { mcuadrados, valorm2, calle, numero, ciudad, provincia } = req.body;
    const imagen = req.file ? req.file.filename : null;
    const sql = 'INSERT INTO viviendas (mcuadrados, valorm2, calle, numero, ciudad, provincia,imagen) VALUES (?, ?, ?, ?, ?, ?, ?)';
    db.query(sql, [mcuadrados, valorm2, calle, numero, ciudad, provincia,imagen], (err, result) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.status(201).json({ idvivienda: result.insertId });
    });
};

const update=(req, res) => {
    const { id } = req.params;
    const imagen = req.file ? req.file.filename : null;
    const { mcuadrados, valorm2, calle, numero, ciudad, provincia} = req.body;
    const sql = 'UPDATE viviendas SET mcuadrados = ?, valorm2 = ?, calle = ?, numero = ?, ciudad = ?, provincia = ?, imagen=? WHERE idvivienda = ?';
    db.query(sql, [mcuadrados, valorm2, calle, numero, ciudad, provincia,imagen, id], (err, result) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'La vivienda no existe' });
        }
        res.json({ message: 'Vivienda modificada' });
    });
};

const destroy=(req, res) => {
    const { id } = req.params;
    const sql = 'DELETE FROM viviendas WHERE idvivienda = ?';
    db.query(sql, [id], (err, result) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'La Vivienda no existe' });
        }
        res.json({ message: 'Vivienda eliminada' });
    });
};
module.exports={ index,
    show,
    update,
    store,
    destroy }