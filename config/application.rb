require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ContentstackRubyGraphqlStarterApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    protect_from_forgery with: :exception

    config.load_defaults 5.2
    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'contentstack.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

  end

  Client = Graphlient::Client.new("https://#{ENV["host"]}/stacks/#{ENV["api_key"]}?environment=#{ENV["environment"]}",
      headers: {
        'access_token' => ENV["delivery_token"]
      },
      schema_path: Application.root.join('db/schema.json')
  )
end
