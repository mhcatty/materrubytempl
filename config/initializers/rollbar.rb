require 'rollbar'

Rollbar.configure do |config|
  config.access_token = ENV['ROLLBAR_ACCESS_TOKEN'] if Rails.env.production?
end

# Rollbar.error('Hello world')
