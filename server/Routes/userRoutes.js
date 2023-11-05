import express from "express";
import { signUp, logIN } from "../Controllers/userController.js";

const userRouter = express.Router();

//signup a user
userRouter.post("/signup", signUp);

//login a user
userRouter.post("/login", logIN);

export default userRouter;
