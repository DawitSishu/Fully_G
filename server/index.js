import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import errorHandler from "./MiddleWares/ErrorHandler.js";
import userRouter from "./Routes/userRoutes.js";

const app = express();
dotenv.config();
app.use(cors());

app.use(express.json());

app.use("/api/users", userRouter);

app.use(errorHandler);

app.listen(5000, () => {
  console.log("running on port 5000");
});
