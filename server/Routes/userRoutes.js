import express from "express";
import { signUp, logIN, updateProfile } from "../Controllers/userController.js";

const userRouter = express.Router();

//signup a user
userRouter.post("/signup", signUp);

//login a user
userRouter.post("/login", logIN);

//update profile
userRouter.put("/updateProfile", updateProfile);

export default userRouter;
