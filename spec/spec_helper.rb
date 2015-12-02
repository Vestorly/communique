require 'simplecov'
require 'simplecov-gem-adapter'
SimpleCov.start 'gem'
['../lib', './models', '../config'].each do |f|
  $LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), f))
end

require 'database_cleaner'
require 'mongoid'
require 'communique'
require 'support/dummy/notifiable_dummy.rb'
require 'support/dummy/handler_dummy.rb'
require 'models/notification_spec.rb'

Mongoid.load!('./config/mongoid.yml', :test)

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean_with(:truncation)
  end

  config.around(:each) do |example|
    DatabaseCleaner.cleaning do
      example.run
    end
  end
end
