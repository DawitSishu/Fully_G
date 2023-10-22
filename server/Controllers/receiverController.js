import { pool } from "../Database/index.js";
import asyncHandler from "express-async-handler";
import path from "path";

//@descreceive uploaded Audios
//@route GET /api/receiver/audio/:id
//@access private
export const getAudio = asyncHandler(async (req, res) => {
  const fileId = req.params.id;

  if (!fileId) {
    const err = new Error("Please Include the audio Id");
    err.statusCode = 400;
    throw err;
  }

  const selectQuery = "SELECT file_path FROM audioFiles WHERE id = ?";
  const values = [fileId];
  const results = await pool.query(selectQuery, values);

  if (results[0][0].length <= 0) {
    const err = new Error("There is no such Audio.");
    err.statusCode = 404;
    throw err;
  }
  const filePath = results[0][0].file_path;
  const absolutePath = path.resolve(filePath);
  res.sendFile(absolutePath);
});