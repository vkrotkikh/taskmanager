require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(:default, Rails.env)

module Taskmanager
  class Application < Rails::Application
    config.generators do |g|
      g.template_framework :rspec, :view_specs => false,
                           :fixture => true,
                           :fixture_replacement => "factory_girl"
      g.assets = false
      g.helper = false
      g.fixture_replacement :factory_girl, :dir => 'spec/factories'
    end
  end
end
