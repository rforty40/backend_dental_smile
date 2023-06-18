//dotenv
import * as dotenv from "dotenv";
dotenv.config({ path: "./.env" });

console.log("process.env", process.env.MYSQL_HOST);

//conexion DB
import { createPool } from "mysql2/promise";

export const poolDB = createPool({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "1234",
  database: "dentalSmile_BDv2",
});
