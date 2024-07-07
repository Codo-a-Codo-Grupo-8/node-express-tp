const express = require('express');
const router = express.Router();
const controllers = require("../controllers/propietarios.controller");



router.post('/', controllers.store)
router.get('/', controllers.index) 
router.get('/:id', controllers.show)
router.put('/:id', controllers.update)
router.delete('/:id',controllers.destroy)

module.exports = router;
