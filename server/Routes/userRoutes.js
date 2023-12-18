import express from "express";
import {
  signUp,
  logIN,
  updateProfile,
  addId,
  getUserInfo,
} from "../Controllers/userController.js";
import userAuthChecker from "../MiddleWares/UserAuthChecker.js";

const userRouter = express.Router();

//signup a user
userRouter.post("/signup", signUp);

//login a user
userRouter.post("/login", logIN);

//update profile
userRouter.put("/updateProfile", userAuthChecker, updateProfile);

//add the partner's love id
userRouter.put("/addId", userAuthChecker, addId);

//getUser info
userRouter.get("/me", userAuthChecker, getUserInfo);

export default userRouter;
