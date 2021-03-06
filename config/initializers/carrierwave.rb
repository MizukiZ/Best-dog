CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV.fetch("S3_ACCESS_KEY_ID"),
    aws_secret_access_key: ENV.fetch("S3_SECRET_ACCESS_KEY"),
    region: ENV.fetch("S3_REGION")
  }

  config.fog_directory  = ENV.fetch("S3_BUCKET")
  config.cache_storage = :fog
end
