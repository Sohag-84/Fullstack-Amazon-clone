console.log("Hello world");

const express = require("express");

const PORT = 3000;

//initialize expreess and save it in a variable
const app = express();

//create an api
//http://ip-address/hello-world
app.get("/hello-world", (req, res) => {
    res.json({
        "name": "Injamul",
        "Age": 20,
        "Home-town": "Kishoreganj",
    });
});

app.listen(PORT, () => {
  console.log(`Connected at port ${PORT}`);
});
