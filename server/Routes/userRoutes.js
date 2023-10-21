import express from "express";
import { signUp } from "../Controllers/userController.js";
import userAuthChecker from "../middlewares/userAuthCheaker.js";

const userRouter = express.Router();

//signup a user
userRouter.post("/signup", signUp);

export default userRouter;
