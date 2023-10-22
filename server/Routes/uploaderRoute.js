import express from "express";
import multer from "multer";
import { uploadAudio } from "../Controllers/uploaderController.js";

const creatorRouter = express.Router();

const upload = multer({ dest: "uploads/" });

//upload an audio
creatorRouter.post("/audio", upload.single("audio"), uploadAudio);

export default creatorRouter;
