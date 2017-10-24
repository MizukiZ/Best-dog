class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

process :resize_to_limit => [500, 500]


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
