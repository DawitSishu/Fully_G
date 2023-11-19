import express from "express";
import multer from "multer";
import { uploadFile } from "../Controllers/uploaderController.js";
import userAuthChecker from "../MiddleWares/UserAuthChecker.js";

const creatorRouter = express.Router();

const upload = multer({ dest: "uploads/" });

//upload an audio or image
creatorRouter.post("/upload", userAuthChecker,upload.single("file"), uploadFile);


export default creatorRouter;
