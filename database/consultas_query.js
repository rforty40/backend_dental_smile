export function validarFechaAnio(anio, fecha) {
  return anio === fecha.slice(0, 4);
}

export function validarFechaMesAnio(mesAnio, fecha) {
  const fechaArr = fecha.split("-");
  return mesAnio === fechaArr[0] + fechaArr[1];
}

export function validarFechaEnRango(inicio, fin, fecha) {
  fecha = new Date(fecha).getTime();
  inicio = new Date(inicio).getTime();
  fin = new Date(fin).getTime();
  return inicio <= fecha && fecha <= fin;
}

const queryCons =
  "SELECT con.`id_consulta`,tipCon.`tipo_tipoConsul`,con.`id_tipoConsul`, con.`mot_consulta`, con.`probleAct_consulta`,concat_ws(' ','Hace',datediff(current_date(),con.`fecha_consulta`),'días') as 'dias', DATE_FORMAT(FROM_UNIXTIME(unix_timestamp(con.`fecha_consulta`)),'%Y-%m-%d') as 'fecha_consulta', TIME_FORMAT(FROM_UNIXTIME(unix_timestamp(con.`hora_consulta`)),'%H:%i') as 'hora_consulta' FROM `consulta_tbl` as con INNER JOIN `tipoConsulta_tbl` as tipCon ON con.`id_tipoConsul` = tipCon.`id_tipoConsul` WHERE  con.`id_paciente` = ? ";

//

export const consultasConsultas = {
  getConsultas: queryCons,

  getConsultasNoFiters: queryCons + " ORDER BY con.`fecha_consulta` DESC;",
  getConsultasAnio:
    queryCons +
    " AND  extract(year from con.`fecha_consulta`) = ? ORDER BY con.`fecha_consulta` DESC;",
  getConsultasMes:
    queryCons +
    " AND  extract(year_month from con.`fecha_consulta`) = ? ORDER BY con.`fecha_consulta` ASC;",
  getConsultasDia: queryCons + " AND con.`fecha_consulta` = ? ;",
  getConsultasRange:
    queryCons +
    "AND con.`fecha_consulta` between ? AND ? ORDER BY con.`fecha_consulta` ASC;",

  getDiagnosticos:
    "SELECT concat(cie.`codigoCIE`,' - ',cie.`nombre_enfermedad`) as 'Diagnosticos' FROM `diagnostico_tbl` as diag INNER JOIN `enfermedades_cie10` as cie ON diag.`codigoCIE` = cie.`codigoCIE` WHERE diag.`id_consulta` = ?;",

  getTratamientos:
    "SELECT `id_tratam`, DATE_FORMAT(FROM_UNIXTIME(unix_timestamp(`fecha_tratam`)),'%Y-%m-%d') as 'Tratamiento' FROM  `tratamiento_tbl`  WHERE  `id_consulta` = ?;",

  getPlanesDiag:
    "SELECT concat_ws(" -
    ",`exam_planDiag`,`desc_planDiag`) as 'PlanesDiag' FROM `planDiagnostico_tbl` WHERE `tipo_planDiag`= 'Diagnóstico' AND `id_consulta` = ? ;",

  getPlanesTera:
    "SELECT `tipo_tipoTratam`, tipoT.`tratam_tipoTratam`,planD.`desc_planDiag` FROM `planDiagnostico_tbl` as planD LEFT JOIN `tipoTratamiento_tbl` as tipoT ON planD.`id_tipoTratam` = tipoT.`id_tipoTratam` WHERE planD.`tipo_planDiag`='Terapéutico' AND planD.`id_consulta` = ? ;",

  getPlanesEdu:
    "SELECT `desc_planDiag` FROM `planDiagnostico_tbl` WHERE `tipo_planDiag`= 'Educacional' AND  `id_consulta` = ? ;",

  getProcedimientos:
    "SELECT concat(proced.`cod_proced`,' - ',proced.`nom_proced`) as 'Procedimiento' FROM  `tratamiento_procedimiento_tbl` as tra_pro INNER JOIN `procedimiento_tbl` as proced ON tra_pro.`id_proced` = proced.`id_proced` WHERE tra_pro.`id_tratam` = ?;",

  getFotosConsulta:
    "SELECT recurso.`titulo_recurso` as 'titulo', recurso.`descripcion_recurso` as 'descr', DATE_FORMAT( FROM_UNIXTIME(unix_timestamp(recurso.`fecha_recurso`)),'%Y/%m/%d %H:%i:%s') as 'fecha', foto.`url_foto` as 'url' FROM `recursoFoto_tbl` as recurso  INNER JOIN `fotografias_tbl` as foto ON   recurso.`id_recurso`  =foto.`id_recurso` WHERE recurso.`id_consulta` = ? ;",

  getHeaderConsulta:
    "SELECT tipCon.`tipo_tipoConsul`, concat_ws(' ',pac.`priNom_paciente`,pac.`segNom_paciente`,pac.`priApe_paciente`,pac.`segApe_paciente`) as 'paciente', concat_ws(' ',datediff(current_date(),con.`fecha_consulta`),'Días') as 'dias', DATE_FORMAT(FROM_UNIXTIME(unix_timestamp(con.`fecha_consulta`)),'%Y-%m-%d') as 'fecha_consulta', TIME_FORMAT(FROM_UNIXTIME(unix_timestamp(con.`hora_consulta`)),'%H:%i') as 'hora_consulta' FROM `consulta_tbl` as con INNER JOIN `paciente_tbl` as pac ON con.`id_paciente` = pac.`id_paciente` INNER JOIN `tipoConsulta_tbl` as tipCon ON con.`id_tipoConsul` = tipCon.`id_tipoConsul` WHERE `id_consulta` = ?;",

  // getDetalleConsulta:
  getConsultaID:
    "SELECT con.`id_consulta`,tipCon.`tipo_tipoConsul`,con.`id_tipoConsul`, con.`mot_consulta`, con.`probleAct_consulta`,concat_ws(' ','Hace',datediff(current_date(),con.`fecha_consulta`),'días') as 'dias', DATE_FORMAT(FROM_UNIXTIME(unix_timestamp(con.`fecha_consulta`)),'%Y-%m-%d') as 'fecha_consulta', TIME_FORMAT(FROM_UNIXTIME(unix_timestamp(con.`hora_consulta`)),'%H:%i') as 'hora_consulta' FROM `consulta_tbl` as con INNER JOIN `tipoConsulta_tbl` as tipCon ON con.`id_tipoConsul` = tipCon.`id_tipoConsul` WHERE  con.`id_consulta` = ? ",

  createConsulta:
    "INSERT INTO `consulta_tbl` (`id_paciente`, `mot_consulta`, `probleAct_consulta`,`fecha_consulta`, `hora_consulta`, `id_tipoConsul`) VALUES (?,?,?,?,?,?);",

  updateConsulta: "UPDATE `consulta_tbl` SET ? WHERE `id_consulta`= ?;",

  deleteConsulta: "DELETE FROM `consulta_tbl` WHERE `id_consulta`= ?;",

  getSignoVital: "SELECT * FROM  `signoVital_tbl` WHERE `id_consulta` = ? ;",

  createSignoVital:
    "INSERT INTO `signoVital_tbl` (`temp_signoVital`,`presArt_signoVital`,`freCar_signoVital`, `freRes_signoVital`, `id_consulta`) VALUES (?,?,?,?,?);",

  updateSignoVital: "UPDATE `signoVital_tbl` SET ? WHERE `id_signoVital` = ? ;",
};
