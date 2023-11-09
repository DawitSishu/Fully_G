import { pool } from "../Database/index.js";
import asyncHandler from "express-async-handler";

//@desc uploads memory audio
//@route POST /api/creator/upload
//@access private
export const uploadFile = asyncHandler(async (req, res) => {
  const userId = req.body.userId;
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
  res.json({ message: `${message} uploaded successfully` });
});
