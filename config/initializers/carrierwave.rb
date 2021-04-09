config/initializers/carrierwave.rb
if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['ACCESS_KEY_ID'],
      aws_secret_access_key: ENV['SECRET_ACCESS_KEY'],
      region: 'ap-northeast-1'
    }
    config.fog_directory  = 'rails-app-for-hokuu-heroku-bucket' # 作成したS3バケット名
  end
end
