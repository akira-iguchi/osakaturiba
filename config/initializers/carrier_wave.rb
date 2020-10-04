if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {

      :provider              => 'AWS',
      :region                => ENV['us-east-1'],
      :aws_access_key_id     => ENV['AKIAIAGC3CPADIBKUZAA'],
      :aws_secret_access_key => ENV['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']
    }
    config.fog_directory     =  ENV['osakaturiba']
  
    config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }
  end

  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/ 
end