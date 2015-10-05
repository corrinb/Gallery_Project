class ImageSubmissionsUploader < CarrierWave::Uploader::Base
  storage :file
  #need to change storage settings for production environment

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
