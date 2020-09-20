require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Webapp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    config.time_zone = "Tokyo"
    config.i18n.default_locale = :ja
    config.action_controller.permit_all_parameters = true
    # config.action_controller.permit_all_parameters = false

     # i18nの複数ロケールファイルが読み込まれるようpathを通す
    # config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    config.exceptions_app = ->(env) do
      ErrorsController.action(:show).call(env)
    end
  end
end
