
const express = require('express');
const router = express.Router();
const controllers = require("../controllers/viviendas.controller");
const multer=require("multer");
const path=require('path');

const storage=multer.diskStorage({
    destination:(req,file,cb)=> {
        cb(null,'public/uploads')
    },
    filename:(req,file,cb)=>{
        cb(null,Date.now()+path.extname(file.originalname));
    },
});
const fileFilter = (req, file, cb) => {
    const allowedTypes = /jpeg|jpg|png/;
    const extname = allowedTypes.test(path.extname(file.originalname).toLowerCase());
    const mimetype = allowedTypes.test(file.mimetype);
    
    if (extname && mimetype) {
        return cb(null, true);
    } else {
        cb(new Error('Solo se permiten archivos de imagen JPG o PNG'));
    }
};


const upload = multer({
    storage,
    fileFilter
});


router.post('/', upload.single("imagen"),controllers.store)
router.get('/', controllers.index)
router.get('/:id', controllers.show)
router.put('/:id',upload.single("imagen"), controllers.update)
router.delete('/:id', controllers.destroy)

module.exports = router;
