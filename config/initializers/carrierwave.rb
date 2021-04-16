unless Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws['ACCESS_KEY_ID'],
      aws_secret_access_key: Rails.application.credentials.aws['SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1'
    }

    config.fog_directory  = 'rails-app-for-hokuu-heroku-bucket'
    config.cache_storage = :fog
  end
end
