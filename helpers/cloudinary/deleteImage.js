import cloudinary from "./cloudinaryConfig.js";

export const deleteImage = async (publicId) => {
  return await cloudinary.uploader.destroy(publicId);
};
