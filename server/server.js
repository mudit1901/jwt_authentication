const express=require('express')
const mongoose=require('mongoose')
const dbConfig=require('./config/db.config')
const authRouter=require('./router/auth.router')

const PORT=process.env.PORT || 5000;
const app=express()
app.use(express.json())
app.use(authRouter)

mongoose.connect(dbConfig.DB_URL)
const db=mongoose.connection    

db.on('error',()=>{
    console.log("Error while Connecting MongoDB");
})
db.on('open',()=>{
    console.log("Connected to MongoDB");
})

app.listen(PORT,"0.0.0.0",()=>{
    console.log(`Connected to the Port ${PORT}`);
})