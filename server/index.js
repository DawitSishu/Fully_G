import express from "express";
import dotenv from "dotenv";
import cors from "cors";

const app = express();
dotenv.config();
app.use(cors());

app.use(express.json());

app.listen(5000, () => {
  console.log("running on port 5000");
});
