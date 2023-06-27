//controlador de errores
import { handleHttpError } from "../utils/handleError.js";

//conexion DB
import { poolDB } from "../database/db.js";

//querys
import {
  consultas_odontogramas,
  consultas_dentales,
} from "../database/odontograma_query.js";

//obtener Odontoogramas
export const getAllOdontogramas = async (req, res) => {
  try {
    let resultPiezas;
    //ejecutar consulta
    const [resultOdonto] = await poolDB.query(
      consultas_odontogramas.getOdontogramas,
      [req.params.id_consulta]
    );

    //verificar consulta exitosa
    if (resultOdonto.length === 0) {
      handleHttpError(
        res,
        new Error("Sin odontogramas"),
        "getOdontogConsulta",
        404
      );
    } else {
      //agregar piezas dentales
      for (let odontograma of resultOdonto) {
        //complicaciones
        [resultPiezas] = await poolDB.query(
          consultas_dentales.getPiezasDentales,
          [odontograma.id_odontograma]
        );
        odontograma.piezas = resultPiezas;
      }
      //enviar odontogramas con sus piezas
      res.json(resultOdonto);
      console.log("odontogramas traidos desde la BD");
    }
  } catch (error) {
    handleHttpError(res, error, "getOdontogConsulta");
  }
};

//registrar Odontograma
export const createOdont = async (req, res) => {
  try {
    //realizar registro
    const [result] = await poolDB.query(
      consultas_odontogramas.createOdontograma,
      [req.params.id_consulta]
    );

    //verificar registro
    if (result.affectedRows === 0) {
      handleHttpError(
        res,
        new Error("Odontograma no registrado"),
        "createOdont",
        404
      );
    } else {
      console.log("Odontograma registrado en la BD");

      //consultar Odontograma recientemente registrado
      const [OdontReciente] = await poolDB.query(
        consultas_odontogramas.getOdontogramaId,
        [result.insertId]
      );

      //enviar datos al cliente
      res.json(OdontReciente[0]);
    }
  } catch (error) {
    handleHttpError(res, error, "createOdont");
  }
};

//registrar pieza dental

export const createPzaDental = async (req, res) => {
  try {
    //extraer datos del body
    const {
      num_dent,
      mov_dent,
      rec_dent,
      oclusal_dent,
      vestibular_dent,
      mesial_dent,
      lingual_dent,
      distal_dent,
    } = req.body;

    //realizar registro
    const [result] = await poolDB.query(consultas_dentales.createPiezaDental, [
      req.params.id_odontograma,
      num_dent,
      mov_dent,
      rec_dent,
      oclusal_dent,
      vestibular_dent,
      mesial_dent,
      lingual_dent,
      distal_dent,
    ]);

    //verificar registro
    if (result.affectedRows === 0) {
      handleHttpError(
        res,
        new Error("PiezaDental no registrada"),
        "createPzaDental",
        404
      );
    } else {
      console.log("PiezaDental registrada en la BD");

      //consultar PiezaDental recientemente registrado
      const [PzaDentalReciente] = await poolDB.query(
        consultas_dentales.getPiezasDentalId,
        [result.insertId]
      );
      //enviar datos al cliente
      res.json(PzaDentalReciente[0]);
    }
  } catch (error) {
    handleHttpError(res, error, "createPzaDental");
  }
};
