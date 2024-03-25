const express=require('express')
const authRouter=express.Router();
const authController=require('../controller/auth.controller')

//SignUp
authRouter.post('/api/signup',authController.signup);
//SignIn
authRouter.post('/api/signin',authController.signIn);
module.exports=authRouter