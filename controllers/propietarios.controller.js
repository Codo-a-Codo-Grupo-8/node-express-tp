const express = require('express');

const db = require("../db/db");




const index=(req, res) => {
    const sql = 'SELECT * FROM propietarios';
    db.query(sql, (err, results) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        if (results.length === 0) {
            return res.status(404).json({ message: 'No hay propietarios disponibles' });
        }
        res.json(results);
    });
};
const show=(req, res) => {
    const { id } = req.params;
    const sql = 'SELECT * FROM propietarios WHERE idpropietario = ?';
    db.query(sql, [id], (err, result) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        if (result.length === 0) {
            return res.status(404).json({ error: 'No hay propietarios ' });
        }
        res.json(result[0]);
    });
};
const store=(req, res) => {
    const { nombre, apellido, telefono, email, idvivienda } = req.body;
    const sql = 'INSERT INTO propietarios (nombre, apellido, telefono, email, idvivienda) VALUES (?, ?, ?, ?, ?)';
    db.query(sql, [nombre, apellido, telefono, email, idvivienda], (err, result) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        res.status(201).json({ idpropietario: result.insertId });
    });
};
const update=(req, res) => {
    const { id } = req.params;
    const {nombre, apellido, telefono, email, idvivienda } = req.body;
    const sql = 'UPDATE propietarios SET nombre = ?, apellido = ?, telefono = ?, email = ?, WHERE idpropietario = ?';
    db.query(sql, [nombre, apellido, telefono, email, idvivienda, id], (err, result) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'El propietario no existe' });
        }
        res.json({ message: 'Propietario modificada' });
    });
};
const destroy= (req, res) => {
    const { id } = req.params;
    const sql = 'DELETE FROM propietarios WHERE idpropietario = ?';
    db.query(sql, [id], (err, result) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        if (result.affectedRows === 0) {
            return res.status(404).json({ error: 'El propietario no  existe' });
        }
        res.json({ message: 'Propietario eliminado' });
    });
};

module.exports={update,
    index,
    show,
    store,
    destroy}