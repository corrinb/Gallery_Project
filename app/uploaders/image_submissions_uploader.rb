class ImageSubmissionsUploader < CarrierWave::Uploader::Base

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :convert => 'png'
  def filename
      super.chomp(File.extname(super)) + '.png' if original_filename
  end

end
