import cloudinary from "./cloudinaryConfig.js";

export const deleteImage = async (publicId) => {
  //   return await cloudinary.uploader.destroy(publicId);

  cloudinary.uploader
    .destroy(publicId, (error, result) => {
      console.log(result);
      console.log(error);
    })
    .then((resp) => console.log(resp))
    .catch((_err) =>
      console.log("Algo salió mal, inténtalo de nuevo más tarde")
    );
};
