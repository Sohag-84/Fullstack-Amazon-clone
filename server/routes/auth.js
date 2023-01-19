const expreess = require("express");

const authRouter = expreess.Router();

 authRouter.post("/api/signup", (req, res) => {
   //get data from client
   const { name, email, password } = req.body;
   //post that in database
   //return that data to the user
 });

module.exports = authRouter; //so that access any other file
