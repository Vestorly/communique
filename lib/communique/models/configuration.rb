module Communique
  class << self
    attr_accessor :config
  end

  def self.configure(&block)
    self.config ||= Configuration.new
    yield config if block_given?
  end

  class Configuration
    attr_accessor :user_klass
    attr_accessor :notification_handler

    def set_notification_handler(&block)
      @notification_handler = block
    end
  end
end
