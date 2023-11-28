import asyncHandler from "express-async-handler";
import { pool } from "../Database/index.js";
import jwt from "jsonwebtoken";
import bcrypt from "bcrypt";
import { v4 as uuidv4 } from "uuid";

function generateUniqueID(length = 8) {
  const characters = "abcdefghijklmnopqrstuvwxyz0123456789";
  let id = "";

  for (let i = 0; i < length; i++) {
    const randomIndex = Math.floor(Math.random() * characters.length);
    id += characters.charAt(randomIndex);
  }

  // Check if the generated ID already exists in the database (pseudo code)
  // This should be an asynchronous call to your database to check for the ID's existence

  // Assuming checkIfExistsInDatabase returns true if ID exists, false otherwise
  const exists = checkIfExistsInDatabase(id);

  // If the ID exists, recursively call the function to generate a new one
  if (exists) {
    return generateUniqueID(length);
  }

  return id.toUpperCase(); // Return ID in uppercase for case insensitivity
}

// Function to check if ID exists in the database (you'll need to implement this)
const checkIfExistsInDatabase = async (id) => {
  const result = await pool.query(
    "SELECT COUNT(*) AS count FROM users WHERE love_id = ?",
    [id]
  );

  // Check if the count of rows is greater than 0 (ID exists) and return true, otherwise return false
  return result[0].count > 0;
  // Perform a database query to check if the ID exists
  // Return true if the ID exists, false otherwise (asynchronously)
  // Example pseudo code:
  // const result = await pool.query("SELECT * FROM users WHERE love_id = ?", [id]);
  // return result.length > 0;
  // return false; // Placeholder, replace with actual database check
};

//@desc creates a user
//@route POST /api/users/signup
//@access public
export const signUp = asyncHandler(async (req, res) => {
  console.log(req.body);
  const { phone, password, full_name, nick_name, gender } = req.body;
  // const love_id = uuidv4();
  const love_id = generateUniqueID();

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
    "INSERT INTO users (love_id,phone_number, password,full_name, nick_name, gender) VALUES (?,?,?,?,?,?)",
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

//@desc add partner love id
//@route PUT /api/users/addId
//@access private
export const addId = asyncHandler(async (req, res) => {
  const { uid } = req.body;
  const { id } = req.user;

  if (!uid) {
    const err = new Error("Please Include A valid LoverID");
    err.statusCode = 400;
    throw err;
  }

  const user = await pool.query("SELECT * from users WHERE love_id = ?", [uid]);

  if (!user || !user[0][0] || user[0][0].length <= 0) {
    const err = new Error("Please Include A valid LoverID");
    err.statusCode = 400;
    throw err;
  }

  const result = await pool.query(
    "UPDATE users SET partner_id = ? WHERE id = ?",
    [uid, id]
  );

  res.json({
    message: "Love Id imported Successfully",
    data: [],
  });
});
