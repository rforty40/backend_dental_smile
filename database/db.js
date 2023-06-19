//dotenv
import * as dotenv from "dotenv";
dotenv.config({ path: "./.env" });

//conexion DB
import { createPool } from "mysql2/promise";

export const poolDB = createPool({
  host: process.env.MYSQL_HOST,
  port: parseInt(process.env.MYSQL_PORT),
  user: process.env.MYSQL_USER,
  password: process.env.MYSQL_PASSWORD,
  database: process.env.MYSQL_DATABASE,
});
