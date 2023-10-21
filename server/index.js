import express from "express";
import dotenv from "dotenv";
import cors from "cors";
import { pool } from "./Database/index.js";

const app = express();
dotenv.config();
app.use(cors());

app.use(express.json());


app.listen(5000, () => {
  console.log("running on port 5000");
});
