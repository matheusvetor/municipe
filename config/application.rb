require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
# require "action_text/engine"
# require "action_cable/engine"
# require "action_mailbox/engine"

Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    config.hosts = nil

    config.load_defaults 7.0

    config.time_zone = 'Buenos Aires'
    config.i18n.default_locale = 'pt-BR'

    config.generators do |g|
      g.orm             :active_record
      g.template_engine :slim
      g.test_framework  :rspec
    end
  end
end
