import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import errorHandler from "./MiddleWares/ErrorHandler.js";
import userRouter from "./Routes/userRoutes.js";
import receiverRouter from "./Routes/receiverRoute.js";
import creatorRouter from "./Routes/uploaderRoute.js";

dotenv.config();
const app = express();
app.use(cors());

//fina a way to track feedback of users

app.use(express.json());

app.use("/api/users", userRouter);
app.use("/api/creator", creatorRouter);
app.use("/api/receiver", receiverRouter);

app.use(errorHandler);

app.listen(5000, () => {
  console.log("running on port 5000");
});
