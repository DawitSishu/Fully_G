import { pool } from "../Database/index.js";
import asyncHandler from "express-async-handler";

//@desc uploads memory audio
//@route POST /api/creator/upload
//@access private
export const uploadFile = asyncHandler(async (req, res) => {
  const userId = req.user.id;
  const fileName = req.file.originalname;
  const filePath = req.file.path;
  const isImage = req.body.isImage;

  if (!userId || !fileName || !filePath) {
    const err = new Error("Please Include Correct Fields and File-Types");
    err.statusCode = 400;
    throw err;
  }

  const insertQuery =
    isImage == "true"
      ? "INSERT INTO imageFiles (user_id, file_name, file_path) VALUES (?, ?, ?)"
      : "INSERT INTO audioFiles (user_id, file_name, file_path) VALUES (?, ?, ?)";

  const values = [userId, fileName, filePath];
  const result = await pool.query(insertQuery, values);

  const message = isImage ? "Memory" : "Audio";
  res.json({ message: `${message} uploaded successfully`, data: [] });
});


//@desc uploads memory audio
//@route POST /api/creator/addGift
//@access private
export const addGift = asyncHandler(async (req, res) => {
  const { love_id, id } = req.user;
  const { title, description } = req.body;

  //use the id to find the id of images and audios or find other method

  if (!title || !description) {
    const err = new Error("Please Include Correct Fields");
    err.statusCode = 400;
    throw err;
  }
  const query =
    "INSERT INTO gift (love_id, title, description) VALUES (?, ?, ?)";
  const values = [love_id, title, description];

  const result = await pool.query(query, values);

  res.json({
    message: "Gift has been added Successfully",
    data: [],
  });
});
