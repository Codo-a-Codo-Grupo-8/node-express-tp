const express = require('express');
const dotenv=require('dotenv')
const {SignJWT}=require('jose');
const authTokenRouter = express.Router();

const authByEmailPwd = (email, password) => {
    const USERS_BBDD = [
        { email: 'danielspinella@hotmail.com', password: 'test1234', guid: '12345' },
    ];
    const user = USERS_BBDD.find(u => u.email === email && u.password === password);
    if (!user) throw new Error('Invalid credentials');
    return { guid: user.guid };
};



authTokenRouter.post("/login",async(req,res)=> {
    const {email, password}=req.body;
    if (!email || !password) return res.sendStatus(400);
    try {
        const {guid}=authByEmailPwd(email,password);
        const jwtConstructor= new SignJWT({guid});
        const encoder=new TextEncoder();
        const jwt=await jwtConstructor
        .setProtectedHeader({alg:'HS256', typ:'JWT' })
        .setIssuedAt()
        .setExpirationTime('1h')
        .sign(encoder.encode(process.env.JWT_PRIVATE_KEY));


        return res.send({jwt});
    } catch(err){
        return res.sendStatus(401)
    }
});
authTokenRouter.get("/vivienda", (req,res)=> {



    const user=USERS_BBDD.find((user)=> user.guid ===userSession.guid);
    if (!user) return res.sendStatus(401);
    delete user.password;
    return res.send(user);
});
module.exports = authTokenRouter;