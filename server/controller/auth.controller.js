const jwt=require('jsonwebtoken')
const express=require('express')
const bcryptjs = require('bcrypt');
const User=require('../models/user.model')
const secret=require('../config/auth.config')
const authRouter=express.Router()
//SignUp
exports.signup=async(req,res)=>{
    try {
        const {username,email,password}=req.body;
        const existingUser=await User.findOne({email:email})
        if(existingUser){
            return res.status(400).send({
                message:"User Already Exist"
            })
        }
        const hashedPassword=await bcryptjs.hash(password,8);

        let user=new User({
            email:email,
            password:hashedPassword,
            username:username,
        });
        user=await user.save();
        res.status(201).send(user)
    } catch (error) {
        res.status(500).send({
            error:error.message
        })
        
    }
}
//SignIn
exports.signIn=async(req,res)=>{
    try {
        //Check If User in Present or Not
    const user=await User.findOne({email:req.body.email})
    if(user==null){
        return res.status(400).send({
            message:"User is Not Present"
        })
    }
    //Password Matching
    const isPasswordValid=bcryptjs.compareSync(req.body.password,user.password)
    if(!isPasswordValid){
        return res.status(400).send({
            message:"Please Enter Correct Password"
        })
    }
    //JWT Process
    const token=jwt.sign({id:user._id},secret.secret)
    res.status(200).send({
        username:user.username,
        email:user.email,
        accessToken:token,
    })
    } catch (error) {
        res.status(500).send({
            error:error.message
        })
        
    }

    authRouter.post("/tokenIsValid", async (req, res) => {
        try {
          const token = req.header("x-auth-token");
          if (!token) return res.json(false);
          const verified = jwt.verify(token, secret.secret);
          if (!verified) return res.json(false);
      
          const user = await User.findById(verified.id);
          if (!user) return res.json(false);
          res.json(true);
        } catch (e) {
          res.status(500).json({ error: e.message });
        }
      });
      
    exports.getData=async(req,res)=>{
        const user=await User.findById(req.user)
        res.status(200).send({...user._doc,accessToken:req.token})
    }
}




