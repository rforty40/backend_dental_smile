export const handleHttpError = (res, error, nameFunction, code = 500) => {
  console.log(`Error en la funcion ---> ${nameFunction}() \n ${error}`);

  return res.status(code).json({ message: error.message });
};

// /**
//  * Handle error specify
//  * @param {*} res
//  * @param {*} message
//  * @param {*} code
//  */

// export const handleErrorResponse = (
//   res,
//   message = "Algo ocurrio",
//   code = 401
// ) => {
//   console.log("utils/handleError ---> Error", message);
//   res.status(code);
//   res.send({ error: message });
// };
