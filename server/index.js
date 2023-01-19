//Import from package
const express = require("express");

//Import from others
const authRouter = require("./routes/auth");

//Initializations
const PORT = 3000;
//initialize expreess and save it in a variable
const app = express();

//Midleware
app.use(authRouter);


app.listen(PORT, () => {
  console.log(`Connected at port ${PORT}`);
});
