class BookCoverUploader < CarrierWave::Uploader::Base
  storage :fog

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_limit: [300, 300] 

  def extension_allowlist
    %w(jpg jpeg png webp)
  end
end
