import asyncHandler from "express-async-handler";
import { pool } from "../Database/index.js";
import jwt from "jsonwebtoken";
import bcrypt from "bcrypt";

//@desc creates a user
//@route POST /api/users/signup
//@access public
export const signUp = asyncHandler(async (req, res) => {
  const { phone, password } = req.body;
  if (!phone || !password) {
    const err = new Error("All fields are required");
    err.statusCode = 400;
    throw err;
  }

  if (!/^0\d{9}$/.test(phone)) {
    const err = new Error("Invalid Phone Number");
    err.statusCode = 400;
    throw err;
  }

  const result = await pool.query("SELECT * FROM users WHERE username = ?", [
    phone,
  ]);
  if (result[0].length > 0) {
    const err = new Error("Phone number already registered");
    err.statusCode = 400;
    throw err;
  }

  const hashedPassword = await bcrypt.hash(password, 10);

  const final = await pool.query(
    "INSERT INTO users (username, password) VALUES (?, ?)",
    [phone, hashedPassword]
  );

  res.status(201).json({
    message: "User Registration Success",
    data: [],
  });
});
