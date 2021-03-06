require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DarkHub
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Don't generate system test files.
    config.generators.system_tests = nil

    # Authorization
    config.middleware.use OmniAuth::Builder do
      provider :developer if Rails.env.development? 
      provider :github, ENV['github_client_id'], ENV['github_client_secret'], scope: "user,repo,gist"
    end
  end

  # config_files = ['application.yml']

  # config_files.each do |file_name|
  #   file_path = File.join(Rails.root, 'config', file_name)
  #   config_keys = HashWithIndifferentAccess.new(YAML::load(IO.read(file_path)))[Rails.env]
  #   config_keys.each do |k,v|
  #     ENV[k.upcase] ||= v
  #   end
  # end
end
