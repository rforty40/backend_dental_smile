import { check } from "express-validator";
import { validateResult } from "../utils/handleValidator.js";

export const validarCitaCreada = [
  check("id_paciente")
    .exists()
    .withMessage("ID PACIENTE NO EXISTE")
    .isNumeric()
    .withMessage("ID PACIENTE NO ES UN NUMERO"),
  //   check("name").exists().notEmpty(),
  //   check("album").exists().notEmpty(),
  //   check("mediaId").exists().notEmpty(),
  //   check("password").exists().notEmpty(),
  //   check("role").exists().notEmpty(),

  (req, res, next) => {
    validateResult(req, res, next);
  },
];

export const validarCitaActualizada = [
  //   check("name").exists().notEmpty(),
  //   check("album").exists().notEmpty(),
  //   check("mediaId").exists().notEmpty(),
  //   check("password").exists().notEmpty(),
  //   check("role").exists().notEmpty(),

  (req, res, next) => {
    validateResult(req, res, next);
  },
];
