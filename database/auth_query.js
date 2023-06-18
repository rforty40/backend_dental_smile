export const verifyLogin =
  "SELECT convert(aes_decrypt(`pass_admin`,?) using utf8mb4) as 'password' FROM `administrador_tbl`;";
