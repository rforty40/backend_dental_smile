//controlador de errores
import { handleHttpError } from "../utils/handleError.js";

//conexion DB
import { poolDB } from "../database/db.js";

//querys
import {
  consultas_ingresos,
  filtrarIngresos,
  queryIngreso,
} from "../database/ingresos_query.js";
import e from "cors";

//Mostrar los pagos de la consulta
export const getPagosConsulta = async (req, res) => {
  try {
    //ejecutar consultas
    const [resultPagos] = await poolDB.query(
      consultas_ingresos.getIngresosConsul,
      [req.params.id_consulta]
    );
    const [resultTPcon] = await poolDB.query(consultas_ingresos.getTP_consul, [
      req.params.id_consulta,
    ]);
    const [resultTPproced] = await poolDB.query(
      consultas_ingresos.getTP_proced,
      [req.params.id_consulta]
    );
    //

    //verificar consulta exitosa
    if (
      resultPagos.length === 0 &&
      resultTPcon.length === 0 &&
      resultTPproced.length == 0
    ) {
      handleHttpError(
        res,
        new Error("Pagos no encontrados"),
        "getPagosConsulta",
        404
      );
    } else {
      //crear lista de pagos de todos los procesos
      let arrTipago = [];
      for (let element of resultTPproced) {
        const [resultTipago] = await poolDB.query(consultas_ingresos.getTpago, [
          element.id_proced,
        ]);

        resultTipago[0].id_tratam_proced = element.id_tratam_proced;

        arrTipago.push(resultTipago[0]);
      }

      //concatenar pagos y filtrar
      const arrayPagos = resultPagos //filtrar por consulta
        .concat(resultTPcon)
        .reduce((acc, pagoActual) => {
          if (
            !acc.some(
              (valorUnico) => valorUnico.pago_por === pagoActual.pago_por
            )
          ) {
            acc.push(pagoActual);
          }
          return acc;
        }, [])
        .concat(arrTipago) //filtrar por procedimientos
        .reduce((acc, pagoActual) => {
          if (
            !acc.some(
              (valorUnico) =>
                valorUnico.id_tratam_proced === pagoActual.id_tratam_proced
            )
          ) {
            acc.push(pagoActual);
          }
          return acc;
        }, []);

      //mostrar resultados
      res.json(arrayPagos);
      console.log("Pagos traidos desde la BD");
    }
  } catch (error) {
    handleHttpError(res, error, "getPagosConsulta");
  }
};

//Mostrar lista de ingresos
export const getIngresos = async (req, res) => {
  try {
    let index_tipo, index_fecha;
    //let result;
    //
    const prm_busq = req.params.prm_busq;
    const prm1 = req.params.prm1;
    const prm2 = req.params.prm2;
    let arrPrmtros = [];
    //
    //filtro por tipo de ingreso
    switch (req.params.fil_tipo) {
      case "busqueda":
        index_tipo = 0;
        arrPrmtros.push(prm_busq, prm_busq, prm_busq);
        break;
      case "todos":
        index_tipo = 1;
        break;
      case "consultas":
        index_tipo = 2;
        break;
      case "procedimientos":
        index_tipo = 3;
        break;
      case "tipos_consulta":
        index_tipo = 4;
        break;
      case "otro_motivo":
        index_tipo = 5;
        break;
      case "proced_tipcons":
        index_tipo = 6;
        break;
      case "proced_user":
        index_tipo = 7;
        break;
      case "tipcons_user":
        index_tipo = 8;
        break;
      default: //ingresos por el usuario
        index_tipo = 9;
        break;
    }

    //filtro por fecha
    switch (req.params.fil_fecha) {
      case "todos":
        index_fecha = 0;
        arrPrmtros.push(prm1, prm1);
        break;

      case "anio":
        index_fecha = 1;
        arrPrmtros.push(prm1, prm1);
        break;

      case "mes":
        index_fecha = 2;
        arrPrmtros.push(prm1, prm1);
        break;

      case "dia":
        index_fecha = 3;
        arrPrmtros.push(prm1, prm1);
        break;

      default: //range
        index_fecha = 4;
        arrPrmtros.push(prm1, prm2, prm1, prm2);
        break;
    }
    //
    const matriz_ingresos = filtrarIngresos();
    const queryFinal = queryIngreso + matriz_ingresos[index_tipo][index_fecha];
    const [result] = await poolDB.query(queryFinal, arrPrmtros);

    //verificar consulta exitosa
    if (result.length === 0) {
      handleHttpError(
        res,
        new Error("Ingresos no encontrados"),
        "getIngresos",
        404
      );
    } else {
      //mostrar resultados
      res.json(result);
      console.log("Ingresos traidos desde la BD");
    }
  } catch (error) {
    handleHttpError(res, error, "getIngresos");
  }
};
//registrarPago
export const createIngreso = async (req, res) => {
  try {
    const {
      id_consulta,
      text_ingreso,
      desc_ingreso,
      monto_ingreso,
      id_tratam_proced,
    } = req.body;
    //realizar registro
    const [result] = await poolDB.query(consultas_ingresos.createIngreso, [
      id_consulta,
      text_ingreso,
      desc_ingreso,
      monto_ingreso,
      id_tratam_proced,
    ]);

    //verificar registro
    if (result.affectedRows === 0) {
      handleHttpError(
        res,
        new Error("Ingreso no registrado"),
        "createIngreso",
        404
      );
    } else {
      console.log("Ingreso registrado en la BD");

      //consultar Pagoiento recientemente registrado
      const [ingresoReciente] = await poolDB.query(
        consultas_ingresos.getIngresoID,
        [result.insertId]
      );

      //enviar datos al cliente
      res.json(ingresoReciente[0]);
    }
  } catch (error) {
    handleHttpError(res, error, "createIngreso");
  }
};

//actualizar Pago
export const updateIngreso = async (req, res) => {
  try {
    //ejecutar update
    const [result] = await poolDB.query(consultas_ingresos.updateIngreso, [
      req.body,
      req.params.id_ingreso,
    ]);
    //verificar cambios
    if (result.affectedRows === 0) {
      handleHttpError(
        res,
        new Error("Ingreso no actualizado"),
        "updateIngreso",
        404
      );
    } else {
      console.log("Ingreso actualizado en la BD");
      //Pago recientemente actualizado
      const [ingresoReciente] = await poolDB.query(
        consultas_ingresos.getIngresoID,
        [req.params.id_ingreso]
      );
      //enviar datos al cliente
      res.json(ingresoReciente[0]);
    }
  } catch (error) {
    handleHttpError(res, error, "updateIngreso");
  }
};

//eliminar Pago
export const deleteIngreso = async (req, res) => {
  try {
    //ejecutar delete
    const [result] = await poolDB.query(consultas_ingresos.deleteIngreso, [
      req.params.id_ingreso,
    ]);

    //verificar eliminación
    if (result.affectedRows === 0) {
      handleHttpError(
        res,
        new Error("Ingreso no eliminado"),
        "deleteIngreso",
        404
      );
    } else {
      console.log("Ingreso eliminado");
      return res.sendStatus(204); //204 No Content
    }
  } catch (error) {
    handleHttpError(res, error, "deleteIngreso");
  }
};

/*
//Mostrar los pagos de la consulta
export const getPagosConsulta = async (req, res) => {
  try {
    //ejecutar consultas
    const [resultPagos] = await poolDB.query(
      consultas_ingresos.getIngresosConsul,
      [req.params.id_consulta]
    );
    const [resultTPcon] = await poolDB.query(consultas_ingresos.getTP_consul, [
      req.params.id_consulta,
    ]);
    const [resultTPproced] = await poolDB.query(
      consultas_ingresos.getTP_proced,
      [req.params.id_consulta]
    );

    //verificar consulta exitosa
    if (
      resultPagos.length === 0 &&
      resultTPcon.length === 0 &&
      resultTPproced.length == 0
    ) {
      handleHttpError(
        res,
        new Error("Pagos no encontrados"),
        "getPagosConsulta",
        404
      );
    } else {
      //concatenar pagos y filtrar
      const arrayPagos = resultPagos
        .concat(resultTPcon, resultTPproced)
        .reduce((acc, pagoActual) => {
          if (
            !acc.find(
              (valorUnico) => valorUnico.pago_por === pagoActual.pago_por
            )
          ) {
            acc.push(pagoActual);
          }
          return acc;
        }, []);
      //mostrar resultados
      res.json(arrayPagos);
      console.log("Pagos traidos desde la BD");
    }
  } catch (error) {
    handleHttpError(res, error, "getPagosConsulta");
  }
};
*/
