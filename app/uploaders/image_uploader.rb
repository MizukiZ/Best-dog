class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick


  version :thumb do
    process :resize_to_limit => [150, 150]
  end



  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(png jpg)
  end

  def filename
    original_filename if original_filename
  end
end
