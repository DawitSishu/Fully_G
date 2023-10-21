import express from "express";
import { signUp } from "../Controllers/userController.js";

const userRouter = express.Router();

//signup a user
userRouter.post("/signup", signUp);

export default userRouter;
