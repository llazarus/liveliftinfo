# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

if Rails.env.production?
  DelayedJobWeb.use Rack::Auth::Basic do |email, password|
    ActiveSupport::SecurityUtils.variable_size_secure_compare('email', email) &&
      ActiveSupport::SecurityUtils.variable_size_secure_compare('password', password)
  end
end