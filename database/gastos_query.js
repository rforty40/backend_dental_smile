export const queryGastos =
  "SELECT `id_gasto`, `desc_gasto`, `monto_gasto`, DATE_FORMAT(FROM_UNIXTIME(unix_timestamp(`fecha_gasto`)),'%Y-%m-%d')  as 'fecha_gasto', DATE_FORMAT(FROM_UNIXTIME(unix_timestamp(`updfecha_gasto`)),'%Y-%m-%d')  as 'fecha_modificacion' FROM `gasto_tbl` ";

export const arrGastosPor = [
  " WHERE `id_gasto` > 0 ",
  " WHERE ( match(`desc_gasto`) against(?) OR `desc_gasto` like concat('%',?,'%') )",
];

export const arrGastosFecha = [
  " ORDER BY `updfecha_gasto` DESC ;",
  " AND extract(year from  `fecha_gasto`) = ? ;",
  " AND extract(year_month from  `fecha_gasto`) = ? ;",
  " AND `fecha_gasto` like concat(?,'%') ;",
  " AND `fecha_gasto` between ? AND ? ;",
];

export const consultas_gastos = {
  createGasto:
    "INSERT INTO `gasto_tbl` (`desc_gasto`, `monto_gasto`) VALUES (?,?);",

  getGastoID: "SELECT * FROM `gasto_tbl` WHERE `id_gasto` = ?;",
  updateGasto: "UPDATE `gasto_tbl` SET ? WHERE `id_gasto` = ?;",

  deleteGasto: "DELETE FROM `gasto_tbl` WHERE `id_gasto` = ?;",
};

/*
export const arrGastosFecha = [
  " ORDER BY `updfecha_gasto` DESC ;",
  " AND (extract(year from  `fecha_gasto`) = ? OR extract(year from  `updfecha_gasto`) = ? );",
  " AND (extract(year_month from  `fecha_gasto`) = ? OR extract(year_month from `updfecha_gasto`) = ? );",
  " AND (`fecha_gasto` like concat(?,'%') OR `updfecha_gasto` like concat(?,'%') );",
  " AND (`fecha_gasto` between ? AND ? OR `updfecha_gasto` between ? AND ? );",
];
*/
