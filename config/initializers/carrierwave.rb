require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage = :fog
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
    region: ENV['AWS_REGION']
  }

    case Rails.env
    when 'development'
        config.fog_directory  = ENV['AWS_BUCKET_NAME']
        config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/mercari-bevypu'
    when 'test'
        config.fog_directory  = ENV['AWS_BUCKET_NAME']
        config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/mercari-bevypu'
    when 'production'
        config.fog_directory  = ENV['AWS_BUCKET_NAME']
        config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/mercari-bevypu'
    end
end
