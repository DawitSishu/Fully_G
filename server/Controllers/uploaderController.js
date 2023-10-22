import { pool } from "../Database/index.js";
import asyncHandler from "express-async-handler";

//@desc uploads memory audio
//@route POST /api/creator/audio
//@access private
export const uploadAudio = asyncHandler(async (req, res) => {
  const userId = req.body.userId;
  const fileName = req.file.originalname;
  const filePath = req.file.path;

  if (!userId || !fileName || !filePath) {
    const err = new Error("Please Include Correct Fields and File-Types");
    err.statusCode = 400;
    throw err;
  }

  const insertQuery =
    "INSERT INTO audioFiles (user_id, file_name, file_path) VALUES (?, ?, ?)";
  const values = [userId, fileName, filePath];

  const result = await pool.query(insertQuery, values);

  res.json({ message: "File uploaded successfully" });
});
