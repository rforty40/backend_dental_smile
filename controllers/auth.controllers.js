//controlador de errores
import { handleHttpError } from "../utils/handleError.js";

//conexion DB
import { poolDB } from "../database/db.js";

//querys
import { consultasCitas } from "../database/citas_querys.js";

//obtener una sola cita
export const getCitaa = async (req, res) => {
  try {
    //ejecutar consulta
    const [result] = await poolDB.query(consultasCitas.getCita, [
      req.params.fecha_citaAgen,
      req.params.horaIni_citaAgen,
    ]);
    //verificar cita consultada
    if (result.length === 0) {
      handleHttpError(res, new Error("Cita no encontrada"), "getCita", 404);
    } else {
      //mostrar cita
      res.json(result[0]);
      console.log("Cita traida de la BD");
    }
  } catch (error) {
    handleHttpError(res, error, "getCita");
  }
};

//actualizar cita
export const updateCitaa = async (req, res) => {
  try {
    //ejecutar update
    const [result] = await poolDB.query(consultasCitas.updateCita, [
      req.body,
      req.params.fecha_citaAgen,
      req.params.horaIni_citaAgen,
    ]);
    //verificar cambios
    if (result.affectedRows === 0) {
      handleHttpError(res, new Error("Cita no actualizada"), "updateCita", 404);
    } else {
      console.log("Cita atualizada en la BD");

      //consultar la cita recientemente actualizada
      const { fecha_citaAgen, horaIni_citaAgen } = req.body;
      const [citaReciente] = await poolDB.query(consultasCitas.getCita, [
        fecha_citaAgen,
        horaIni_citaAgen,
      ]);
      //mostrar Cita al cliente
      res.json(citaReciente[0]);
      //procedimiento almacenado
      const proced = await poolDB.query(consultasCitas.proc_actualizar_citas);
    }
  } catch (error) {
    handleHttpError(res, error, "updateCita");
  }
};
