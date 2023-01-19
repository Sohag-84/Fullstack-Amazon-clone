const expreess = require("express");

const authRouter = expreess.Router();

authRouter.get("/users", (req, res) => {
  res.json([
    {
      _id: 1,
      name: "Injamul",
      Age: 20,
      Distric: "Dhaka",
      Qualification: "BSc in CSE",
    },
    {
      _id: 2,
      name: "Nahid",
      Age: 20,
      Distric: "Pabna",
      Qualification: "BSc in CSE",
      },
      [
        {location: "Savar",}
    ]
  ]);
});

module.exports = authRouter; //so that access any other file
