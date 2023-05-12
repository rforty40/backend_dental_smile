export function validarFechaEnRango(inicio, fin, fecha) {
  return (
    inicio.valueOf() <= fecha.valueOf() && fecha.valueOf() <= fin.valueOf()
  );
}
const queryCons =
  "SELECT con.`id_consulta`,tipCon.`tipo_tipoConsul`, con.`mot_consulta`, concat_ws(' ','Hace',datediff(current_date(),con.`fecha_consulta`),'días') as 'dias', DATE_FORMAT(FROM_UNIXTIME(unix_timestamp(con.`fecha_consulta`)),'%Y-%m-%d') as 'fecha_consulta', TIME_FORMAT(FROM_UNIXTIME(unix_timestamp(con.`hora_consulta`)),'%H:%i') as 'hora_consulta' FROM `consulta_tbl` as con INNER JOIN `tipoConsulta_tbl` as tipCon ON con.`id_tipoConsul` = tipCon.`id_tipoConsul` WHERE  con.`id_paciente` = ? ";

//

export const consultasConsultas = {
  getConsultas: queryCons,
  getConsultasNoFiters: queryCons + " ORDER BY con.`fecha_consulta` DESC;",
  getConsultasAnio:
    queryCons + " AND  extract(year from con.`fecha_consulta`) = ? ;",
  getConsultasMes:
    queryCons + " AND  extract(year_month from con.`fecha_consulta`) = ? ;",
  getConsultasDia: queryCons + " AND con.`fecha_consulta` = ? ;",
  getConsultasRange: queryCons + "AND con.`fecha_consulta` between ? AND ? ;",

  getDiagnosticos:
    "SELECT concat(cie.`codigoCIE`,' - ',cie.`nombre_enfermedad`) as 'Diagnosticos' FROM `diagnostico_tbl` as diag INNER JOIN `enfermedades_cie.10` as cie ON diag.`codigoCIE` = cie.`codigoCIE` WHERE diag.`id_consulta` = ?;",
  getTratamientos:
    "SELECT `id_tratam`, DATE_FORMAT(FROM_UNIXTIME(unix_timestamp(`fecha_tratam`)),'%Y-%m-%d') as 'Tratamiento' FROM  `tratamiento_tbl`  WHERE  `id_consulta` = ?;",

  getProcedimientos:
    "SELECT concat(proced.`cod_proced`,' - ',proced.`nom_proced`) as 'Procedimiento' FROM  `tratamiento_procedimiento_tbl` as tra_pro INNER JOIN `procedimiento_tbl` as proced ON tra_pro.`id_proced` = proced.`id_proced` WHERE tra_pro.`id_tratam` = ?;",

  getHeaderConsulta:
    "SELECT tipCon.`tipo_tipoConsul`, concat_ws(' ',pac.`priNom_paciente`,pac.`segNom_paciente`,pac.`priApe_paciente`,pac.`segApe_paciente`) as 'paciente', concat_ws(' ',datediff(current_date(),con.`fecha_consulta`),'Días') as 'dias', DATE_FORMAT(FROM_UNIXTIME(unix_timestamp(con.`fecha_consulta`)),'%Y-%m-%d') as 'fecha_consulta', TIME_FORMAT(FROM_UNIXTIME(unix_timestamp(con.`hora_consulta`)),'%H:%i') as 'hora_consulta' FROM `consulta_tbl` as con INNER JOIN `paciente_tbl` as pac ON con.`id_paciente` = pac.`id_paciente` INNER JOIN `tipoConsulta_tbl` as tipCon ON con.`id_tipoConsul` = tipCon.`id_tipoConsul` WHERE `id_consulta` = ?;",

  getDetalleConsulta:
    "SELECT tipCon.`tipo_tipoConsul`, con.`mot_consulta`, con.`probleAct_consulta` FROM `consulta_tbl` as con INNER JOIN `tipoConsulta_tbl` as tipCon on con.`id_tipoConsul` = tipCon.`id_tipoConsul` WHERE `id_consulta` = ? ",

  getConsultaID: "SELECT * FROM `consulta_tbl` WHERE `id_consulta`= ?;",

  createConsulta:
    "INSERT INTO `consulta_tbl` (`id_paciente`, `mot_consulta`, `probleAct_consulta`,`fecha_consulta`, `hora_consulta`, `id_tipoConsul`) VALUES (?,?,?,?,?,?);",

  updateConsulta: "UPDATE `consulta_tbl` SET ? WHERE `id_consulta`= ?;",

  deleteConsulta: "DELETE FROM `consulta_tbl` WHERE `id_consulta`= ?;",

  getSignoVital: "SELECT * FROM  `signoVital_tbl` WHERE `id_consulta` = ? ;",

  createSignoVital:
    "INSERT INTO `signoVital_tbl` (`temp_signoVital`,`presArt_signoVital`,`freCar_signoVital`, `freRes_signoVital`, `id_consulta`) VALUES (?,?,?,?,?);",

  updateSignoVital: "UPDATE `signoVital_tbl` SET ? WHERE `id_signoVital` = ? ;",
};

/*
  getProcedimientos:
    "SELECT concat(proced.`cod_proced`,' - ',proced.`nom_proced`) as 'Procedimientos' FROM  `tratamiento_procedimiento_tbl` as tra_pro INNER JOIN `procedimiento_tbl` as proced ON tra_pro.`id_proced` = proced.`id_proced` WHERE tra_pro.`id_tratam` in (SELECT tratam.`id_tratam` FROM  `tratamiento_tbl` as tratam WHERE tratam.`id_consulta` = ?);",
*/
