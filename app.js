//dotenv
import * as dotenv from "dotenv";
dotenv.config({ path: "./.env" });

//express
import express from "express";

//cors
import cors from "cors";

//enrutador
import citaRoutes from "./routes/citas.routes.js";
import pacienteRoutes from "./routes/pacientes.routes.js";
import adminRoutes from "./routes/administacion.routes.js";
import consultaRoutes from "./routes/consultasodon.routes.js";
import authRoutes from "./routes/auth.routes.js";

//conexion DB
import { poolDB } from "./database/db.js";
//
const port = parseInt(process.env.PORT);
//
const app = express();
app.use(cors());
app.use(express.json());

//agregar rutas
app.use(citaRoutes);
app.use(pacienteRoutes);
app.use(adminRoutes);
app.use(consultaRoutes);
app.use(authRoutes);
//;

//verificar conexion con la BD antes de abrir el puerto del servidor
try {
  await poolDB.query("SELECT * FROM `paciente_tbl` LIMIT 1");
  console.log("conexion exitosa con BD");
  app.listen(port);
  console.log(
    `Server is listening on port ${port} \n ${process.env.URL_PUBLIC}${port}`
  );
} catch (error) {
  console.log("Error en la conexion con la BD --> " + error);
  console.log("El servidor no esta en funcionamiento");
}
