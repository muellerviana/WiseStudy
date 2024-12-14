require 'fog/aws'

CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                              # Specify fog provider
  config.fog_credentials = {
    provider:              'AWS',                             # Required
    aws_access_key_id:     ENV['AWS_ACCESS_KEY_ID'],          # From environment variables
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],      # From environment variables
    region:                ENV['AWS_REGION'],                 # Region (e.g., 'us-east-1')
  }
  config.fog_directory  = ENV['AWS_BUCKET']                   # Your S3 bucket name
  config.fog_public     = false                               # Optional: Set to true if files are public
end
