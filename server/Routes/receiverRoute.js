import express from "express";
import { getAudio, getImages } from "../Controllers/receiverController.js";
import userAuthChecker from "../MiddleWares/UserAuthChecker.js";

const receiverRouter = express.Router();

//receive audio
receiverRouter.get("/audio/:id", userAuthChecker,getAudio);

//receive photo
receiverRouter.get("/images/:id",userAuthChecker, getImages);

export default receiverRouter;
