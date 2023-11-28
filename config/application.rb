require_relative 'boot'

require 'rails'
require 'active_model/railtie'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SuikodenMusicOnSpotify
  class Application < Rails::Application
    config.load_defaults 7.1
    config.api_only = true
    config.autoload_lib(ignore: %w[assets tasks])
    config.i18n.default_locale = :ja
    config.time_zone = 'Tokyo'

    config.generators do |generator|
      generator.test_framework(
        :rspec,
        fixtures: true,
        controller_specs: true,
        helper_specs: false,
        routing_specs: false
      )

      generator.fixture_replacement :factory_bot, dir: 'spec/factories'
    end
  end
end
