import cloudinary from "./cloudinaryConfig";

// Ruta del archivo de imagen a subir
const imagePath = "path/to/image.jpg";

// Cargar imagen a Cloudinary
cloudinary.uploader.upload(imagePath, (error, result) => {
  if (error) {
    // Manejar el error
    console.error(error);
  } else {
    // Manejar la respuesta del servidor (por ejemplo, obtener la URL de la imagen cargada)
    console.log(result.secure_url);
  }
});
