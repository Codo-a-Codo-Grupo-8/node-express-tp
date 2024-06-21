
const express = require('express');
const router = express.Router();
const controllers = require("../controllers/viviendas.controller");



router.post('/', controllers.update)
router.get('/', controllers.index)
router.get('/:id', controllers.show)
router.put('/:id', controllers.store)
router.delete('/:id', controllers.destroy)

module.exports = router;
