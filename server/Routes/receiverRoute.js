import express from "express";
import { getAudio } from "../Controllers/receiverController.js";

const receiverRouter = express.Router();

//receive audio
receiverRouter.get("/audio/:id", getAudio);

//receive photo

export default receiverRouter;
