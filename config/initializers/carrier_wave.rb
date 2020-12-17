require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      region: 'us-west-1',
      aws_access_key_id:  Rails.application.credentials.aws[:access_key_id],
      aws_secret_access_key: Rails.application.credentials.aws[:secret_access_key]
    }
    config.fog_directory = 'osakafish'
    config.asset_host = 'https://osakafish.s3.amazonaws.com'
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
  end
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:].\-+]/
end
