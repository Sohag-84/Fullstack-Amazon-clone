const expreess = require("express");
const bcryptjs = require("bcryptjs");
const User = require("../models/user");

const authRouter = expreess.Router();

authRouter.post("/api/signup", async (req, res) => {
  //get data from client
  try {
    const { name, email, password } = req.body;
    const existingUser = await User.findOne({ email });
    if (existingUser) {
      return res
        .status(400)
        .json({ msg: "User with same email already exists!" });
    }
    const hashPassword = await bcryptjs.hash(password, 8);
    let user = User({
      name,
      email,
      password: hashPassword,
    });
    user = await user.save();
    res.json(user);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
  //post that in database
  //return that data to the user
});

module.exports = authRouter; //so that access any other file
