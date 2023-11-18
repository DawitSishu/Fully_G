import asyncHandler from "express-async-handler";
import { pool } from "../Database/index.js";
import jwt from "jsonwebtoken";
import bcrypt from "bcrypt";
import { v4 as uuidv4 } from "uuid";

//@desc creates a user
//@route POST /api/users/signup
//@access public
export const signUp = asyncHandler(async (req, res) => {
  const { phone, password, full_name, nick_name, gender } = req.body;

  const love_id = uuidv4();

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

  const result = await pool.query(
    "SELECT * FROM users WHERE phone_number  = ?",
    [phone]
  );
  if (result[0].length > 0) {
    const err = new Error("Phone number already registered");
    err.statusCode = 400;
    throw err;
  }

  const hashedPassword = await bcrypt.hash(password, 10);

  const final = await pool.query(
    "INSERT INTO users (love_id,phone_number, password,full_name, nick_name, gender) VALUES (?,?,?,?,?)",
    [love_id, phone, hashedPassword, full_name, nick_name, gender]
  );

  res.status(201).json({
    message: "User Registration Success",
    data: [],
  });
});

//@desc Login a user
//@route POST /api/users/login
//@access public
export const logIN = asyncHandler(async (req, res) => {
  const { phone, password } = req.body;

  if (!phone || !password) {
    const err = new Error("Both phone and password are required for login");
    err.statusCode = 400;
    throw err;
  }
  const result = await pool.query(
    "SELECT * FROM users WHERE phone_number = ?",
    [phone]
  );

  if (result[0].length === 0) {
    const err = new Error("Incorrect Phone or Password");
    err.statusCode = 400;
    throw err;
  }

  const user = result[0][0];
  const passwordMatch = await bcrypt.compare(password, user.password);

  if (!passwordMatch) {
    const err = new Error("Incorrect Phone or Password");
    err.statusCode = 400;
    throw err;
  }

  const token = jwt.sign(
    {
      ...user,
      password: "",
    },
    "your-secret-key",
    { expiresIn: "1d" }
  );

  res.status(200).json({
    message: "Login successful",
    userId: user.id,
    phone: user.username,
    love_id: user.love_id,
    token: token,
  });
});

//@desc update user profile
//@route POST /api/users/updateProfile
//@access private
export const updateProfile = asyncHandler(async (req, res) => {
  const { phone, password, full_name, nick_name } = req.body;

  const { id } = req.user;

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

  const hashedPassword = await bcrypt.hash(password, 10);

  const updateQuery =
    "UPDATE users SET phone_number = ?, password = ?, full_name = ?, nick_name = ? WHERE id = ?";
  const updateValues = [phone, hashedPassword, full_name, nick_name, id];

  const final = await pool.query(updateQuery, updateValues);

  res.status(200).json({
    message: "Profile updated successfully",
    data: [],
  });
});
