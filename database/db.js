//conexion DB
import { createPool } from "mysql2/promise";
export const poolDB = createPool({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "1234",
  database: "dentalSmile_BDv2",
});
// .on("error", (err) => {
//   console.log("Failed to connect to Database - ", err);
// });
/*
import { createPool } from "mysql2/promise";
export const poolDB = createPool({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "1234",
  database: "dentalSmile_BDv2",
});
*/
