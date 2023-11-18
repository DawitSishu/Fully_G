import { pool } from "../Database/index.js";
import asyncHandler from "express-async-handler";
import path from "path";

//@desc receive uploaded Audios
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

//@desc receive uploaded images
//@route GET /api/receiver/images/:id
//@access private
export const getImages = asyncHandler(async (req, res) => {
  const fileId = req.params.id;

  if (!fileId) {
    const err = new Error("Please Include the image Id");
    err.statusCode = 400;
    throw err;
  }
  const selectQuery = "SELECT file_path FROM imageFiles WHERE id = ?";
  const values = [fileId];
  const results = await pool.query(selectQuery, values);

  if (results[0][0].length <= 0) {
    const err = new Error("There is no such Image.");
    err.statusCode = 404;
    throw err;
  }
  const filePath = results[0][0].file_path;
  const absolutePath = path.resolve(filePath);
  res.sendFile(absolutePath);
});


// //@desc receive uploaded files (audio and images)
// //@route GET /api/receiver/files/:id
// //@access private
// export const getFiles = asyncHandler(async (req, res) => {
//   const fileId = req.params.id;

//   if (!fileId) {
//     const err = new Error("Please Include the file Id");
//     err.statusCode = 400;
//     throw err;
//   }

//   const selectAudioQuery = "SELECT file_path FROM audioFiles WHERE id = ?";
//   const selectImageQuery = "SELECT file_path FROM imageFiles WHERE id = ?";
//   const values = [fileId];
  
//   const audioResults = await pool.query(selectAudioQuery, values);
//   const imageResults = await pool.query(selectImageQuery, values);

//   if (audioResults[0].length <= 0 || imageResults[0].length <= 0) {
//     const err = new Error("There are no files found for the given ID.");
//     err.statusCode = 404;
//     throw err;
//   }

//   const audioFilePath = audioResults[0][0].file_path;
//   const imageFilePath = imageResults[0][0].file_path;
//   const absoluteAudioPath = path.resolve(audioFilePath);
//   const absoluteImagePath = path.resolve(imageFilePath);
  
//   // Send both audio and image files as attachments
//   res.attachment('audio.mp3');
//   res.attachment('image.jpg');
//   res.sendFile(absoluteAudioPath);
//   res.sendFile(absoluteImagePath);

//   // Send success message
//   const successResponse = {
//     message: "Files sent successfully",
//   };
//   res.status(200).json(successResponse);
// });