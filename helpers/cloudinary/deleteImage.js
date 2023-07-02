import cloudinary from "./cloudinaryConfig";

export const deleteImage = async (publicId) => {
  return await cloudinary.uploader.destroy(publicId);
};
