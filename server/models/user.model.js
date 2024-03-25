const mongoose=require('mongoose')

const userSchema=new mongoose.Schema({
    username:{
        type:String,
        required:true,
        
    },
    email:{
        type:String,
        required:true,
        lowercase:true,
        unique:true,
        minLength:10,
        validate: {
            validator: (value) => {
              const re =
                /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
              return value.match(re);
            },
            message: "Please enter a valid email address",
          },
    },
  
    password:{
        type:String,
        required:true,
    },
    
},{timestamps:true,versionKey:false})
module.exports=mongoose.model("User",userSchema)