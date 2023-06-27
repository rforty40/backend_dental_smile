export const consultas_odontogramas = {
  getOdontogramas:
    "SELECT `id_odontograma`, `id_consulta`, DATE_FORMAT( FROM_UNIXTIME(unix_timestamp(`fecha_odontograma`)),'%Y/%m/%d %H:%i:%s') as 'fecha_odontograma' FROM `odontograma_tbl` WHERE `id_consulta`= ? ORDER BY `fecha_odontograma` DESC;",

  getOdontogramaId:
    "SELECT `id_odontograma`, `id_consulta`, DATE_FORMAT( FROM_UNIXTIME(unix_timestamp(`fecha_odontograma`)),'%Y/%m/%d %H:%i:%s') as 'fecha_odontograma' FROM `odontograma_tbl` WHERE `id_odontograma`= ? ;",

  createOdontograma:
    "INSERT INTO `odontograma_tbl` (`id_consulta`) VALUES (?);",

  deleteOdontograma:
    "DELETE FROM `odontograma_tbl` WHERE `id_odontograma`= ?; ",
};

export const consultas_dentales = {
  getPiezasDentales:
    "SELECT `id_dent`, `num_dent`,`mov_dent`, `rec_dent`, `oclusal_dent`, `vestibular_dent`,`mesial_dent`,`lingual_dent`, `distal_dent` FROM `piezaDental_tbl` WHERE `id_odontograma` = ?;",

  getPiezasDentalId:
    "SELECT `id_dent`, `num_dent`,`mov_dent`, `rec_dent`, `oclusal_dent`, `vestibular_dent`,`mesial_dent`,`lingual_dent`, `distal_dent` FROM `piezaDental_tbl` WHERE `id_dent` = ?;",
  createPiezaDental:
    "INSERT INTO `piezaDental_tbl` (`id_odontograma`, `num_dent`, `mov_dent`, `rec_dent`, `oclusal_dent`, `vestibular_dent`, `mesial_dent`, `lingual_dent`, `distal_dent`)  VALUES(?,?,?,?,?,?,?,?,?) ;",

  updatePiezaDental: "UPDATE `piezaDental_tbl` SET ? WHERE `id_dent` = ?;",
  deletePiezaDental: "DELETE FROM `piezaDental_tbl` WHERE `id_dent` = ?;",
};
