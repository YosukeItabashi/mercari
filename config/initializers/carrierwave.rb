require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'
CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.secrets.aws_access_key_id,
    aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
    region: Rails.application.secrets.region
  }

    case Rails.env
    when 'development'
        config.fog_directory  = Rails.application.secrets.bucket_name
        config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/mercari-bevypu'
    when 'test'
        config.fog_directory  = Rails.application.secrets.bucket_name
        config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/mercari-bevypu'
    when 'production'
        config.fog_directory  = Rails.application.secrets.bucket_name
        config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/mercari-bevypu'
    end
end
