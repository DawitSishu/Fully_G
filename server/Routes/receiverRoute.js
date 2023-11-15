import express from "express";
import { getAudio, getImages } from "../Controllers/receiverController.js";

const receiverRouter = express.Router();

//receive audio
receiverRouter.get("/audio/:id", getAudio);

//receive photo
receiverRouter.get("/images/:id", getImages);

export default receiverRouter;
