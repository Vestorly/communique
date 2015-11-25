$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), '../lib'))
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), './models'))
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), '../config'))

require 'database_cleaner'
require 'mongoid'
require 'communique'
require "support/dummy/notifiable_dummy.rb"
require "support/dummy/handler_dummy.rb"
require "models/notification_spec.rb"

Mongoid.load!("./config/mongoid.yml", :test)
#require 'pry'
#binding.pry
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
