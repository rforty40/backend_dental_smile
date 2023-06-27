export const consultas_odontogramas = {
  getOdontogramas:
    "SELECT `id_odontograma`, `id_consulta`, DATE_FORMAT( FROM_UNIXTIME(unix_timestamp(`fecha_odontograma`)),'%Y/%m/%d %H:%i:%s') as 'fecha_odontograma' FROM `odontograma_tbl` WHERE `id_consulta`= ? ORDER `fecha_odontograma` BY DESC;",

  getOdontogramaId:
    "SELECT `id_odontograma`, `id_consulta`, DATE_FORMAT( FROM_UNIXTIME(unix_timestamp(`fecha_odontograma`)),'%Y/%m/%d %H:%i:%s') as 'fecha_odontograma' FROM `odontograma_tbl` WHERE `id_odontograma`= ? ;",

  createOdontograma:
    "INSERT INTO `odontograma_tbl` (`id_consulta`) VALUES (?);",

  // updateExamen:
  //   "UPDATE `examenEstomatonagtico_tlb` SET ? WHERE `id_examEst`= ?;",

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
};
