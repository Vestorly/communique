# top level gem module
module Communique
  class << self
    attr_accessor :config
  end

  def self.configure
    self.config ||= Configuration.new
    yield config if block_given?
  end

  # Configuration is in charge of handlers other future configurations
  class Configuration
    attr_accessor :user_klass
    attr_accessor :notification_handler

    def set_notification_handler(&block)
      @notification_handler = block
    end
  end
end
