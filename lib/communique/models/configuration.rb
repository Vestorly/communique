module Communique
  class << self
    attr_accessor :config
  end

  def self.configure
    self.config ||= Configuration.new
    yield config if block_given?
  end

  class Configuration
    attr_accessor :user_klass
  end
end
