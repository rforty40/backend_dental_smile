export const arrPacConProFecha = (campofecha) => {
  return [
    ` WHERE ${campofecha} like concat(current_date(),'%'); `, //DIA ACTUAL
    ` WHERE extract(year from ${campofecha}) = extract(year from current_date()) AND WEEKOFYEAR(${campofecha}) =  WEEKOFYEAR(current_date()); `, //SEMANA ACTUAL
    ` WHERE extract(year_month from ${campofecha}) = extract(year_month from current_date()); `, //MES ACTUAL
    ` WHERE extract(year from ${campofecha}) = extract(year from current_date()); `, //AÑO ACTUAL
    ` WHERE extract(year from ${campofecha}) = ? ;`, //AÑO
    ` WHERE extract(year_month from ${campofecha}) = ? ;`, //MES
    ` WHERE ${campofecha} like concat(?,'%') ;`, //DIA
    ` WHERE ${campofecha} between ? AND ? ;`, //RANGO DE FECHAS
    ` ORDER BY ${campofecha} DESC ;`, //TODOS LOS REGISTROS
  ];
};

export const consultas_panelAdmin = {
  getPacientes:
    "SELECT `id_paciente`,`priNom_paciente`,`segNom_paciente`,`priApe_paciente`,`segApe_paciente`,`ced_paciente`,`eda_paciente`,`sex_paciente`,`tel_paciente`,`ema_paciente`,`nomRes_paciente`,`parRes_paciente`,`telRes_paciente`, DATE_FORMAT(FROM_UNIXTIME(unix_timestamp(`create_paciente`)),'%Y-%m-%d') as 'fecha_create', DATE_FORMAT(FROM_UNIXTIME(unix_timestamp(`update_paciente`)),'%Y-%m-%d') as 'fecha_update' FROM `paciente_tbl` ",

  getConsultas:
    "SELECT con.`id_consulta`,con.`id_paciente`,tipCon.`tipo_tipoConsul`, con.`mot_consulta`, concat_ws(' ','Hace',datediff(current_date(),con.`fecha_consulta`),'días') as 'dias', DATE_FORMAT(FROM_UNIXTIME(unix_timestamp(con.`fecha_consulta`)),'%Y-%m-%d') as 'fecha_consulta', TIME_FORMAT(FROM_UNIXTIME(unix_timestamp(con.`hora_consulta`)),'%H:%i') as 'hora_consulta', concat_ws(' ', pac.priNom_paciente , pac.segNom_paciente ,pac.priApe_paciente , pac.segApe_paciente) as 'Paciente' FROM `consulta_tbl` as con INNER JOIN `tipoConsulta_tbl` as tipCon ON con.`id_tipoConsul` = tipCon.`id_tipoConsul` INNER JOIN `paciente_tbl` as pac ON con.`id_paciente`= pac.`id_paciente` ",

  getProcedimientos:
    "SELECT DATE_FORMAT(FROM_UNIXTIME(unix_timestamp(tra_pro.`fecha_tratam_proced`)),'%Y-%m-%d') as 'Fecha', concat_ws(' - ',proced.`cod_proced`,proced.`nom_proced`) as 'Procedimiento', ing.`monto_ingreso` as 'Ingreso', concat_ws(' ',cie.`nombre_enfermedad`,DATE_FORMAT(FROM_UNIXTIME(unix_timestamp(tratam.`fecha_tratam`)),'%Y-%m-%d')) as 'Tratamiento', concat_ws(' ',con.`mot_consulta`, DATE_FORMAT(FROM_UNIXTIME(unix_timestamp(con.`fecha_consulta`)),'%Y-%m-%d')) as 'Consulta',concat_ws(' ', pac.`priNom_paciente`, pac.`segNom_paciente` ,pac.`priApe_paciente`, pac.`segApe_paciente`) as 'Paciente', tra_pro.`id_tratam_proced`,proced.`id_proced`,tratam.`id_tratam`, con.`id_consulta`,pac.`id_paciente`,ing.`id_ingreso` FROM `tratamiento_procedimiento_tbl` as tra_pro INNER JOIN `procedimiento_tbl` as proced ON tra_pro.`id_proced` = proced.`id_proced` INNER JOIN `tratamiento_tbl` as tratam ON tra_pro.`id_tratam` = tratam.`id_tratam` INNER JOIN `consulta_tbl` as con ON tratam.`id_consulta` = con.`id_consulta` INNER JOIN `paciente_tbl` as pac ON con.`id_paciente`= pac.`id_paciente` LEFT JOIN `ingreso_tbl` as ing ON tra_pro.`id_tratam_proced` = ing.`id_tratam_proced` LEFT JOIN `enfermedades_cie.10` as cie ON tratam.`codigoCIE` = cie.`codigoCIE` ",

  getIngresos:
    "SELECT `id_ingreso`,`id_consulta`,`text_ingreso` as 'pago_por', `desc_ingreso`,`monto_ingreso` as 'Monto',DATE_FORMAT(FROM_UNIXTIME(unix_timestamp(`fecha_ingreso`)),'%Y-%m-%d') as 'fecha_create' ,DATE_FORMAT(FROM_UNIXTIME(unix_timestamp(`updfecha_ingreso`)),'%Y-%m-%d') as 'fecha_update',`id_tratam_proced` FROM `ingreso_tbl` ",

  getSumaIngresos: "SELECT SUM(`monto_ingreso`) FROM `ingreso_tbl` ",

  getGastos:
    "SELECT `id_gasto`, `desc_gasto`, `monto_gasto`, DATE_FORMAT(FROM_UNIXTIME(unix_timestamp(`fecha_gasto`)),'%Y-%m-%d')  as 'fecha_gasto', DATE_FORMAT(FROM_UNIXTIME(unix_timestamp(`updfecha_gasto`)),'%Y-%m-%d')  as 'fecha_modificacion' FROM `gasto_tbl` ",

  getSumaGastos: "SELECT SUM(`monto_gasto`) FROM `gasto_tbl` ",
};

/*
export const arrGananciasFecha = (createfecha, updatefecha) => {
  return [
    ` WHERE ${createfecha} like concat(current_date(),'%') OR ${updatefecha} like concat(current_date(),'%'); `, //DIA ACTUAL
    ` WHERE (extract(year from ${createfecha}) = extract(year from current_date()) AND WEEKOFYEAR(${createfecha}) =  WEEKOFYEAR(current_date())) OR (extract(year from ${updatefecha}) = extract(year from current_date()) AND WEEKOFYEAR(${updatefecha}) =  WEEKOFYEAR(current_date())); `, //SEMANA ACTUAL
    ` WHERE extract(year_month from ${createfecha}) = extract(year_month from current_date()) OR extract(year_month from ${updatefecha}) = extract(year_month from current_date()); `, //MES ACTUAL
    ` WHERE extract(year from ${createfecha}) = extract(year from current_date()) OR extract(year from ${updatefecha}) = extract(year from current_date()); `, //AÑO ACTUAL
    ` WHERE extract(year from ${createfecha}) = ? OR extract(year from ${updatefecha}) = ?;`, //AÑO
    ` WHERE extract(year_month from ${createfecha}) = ? OR extract(year_month from ${updatefecha}) = ?;`, //MES
    ` WHERE ${createfecha} like concat(?,'%') OR ${updatefecha} like concat(?,'%') ;`, //DIA
    ` WHERE ${createfecha} between ? AND ? OR ${updatefecha} between ? AND ? ;`, //RANGO DE FECHAS
    ` ORDER BY ${updatefecha} DESC ;`, //TODOS LOS REGISTROS
  ];
};
*/
