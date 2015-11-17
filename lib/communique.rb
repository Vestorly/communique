require "communique/version"
require "communique/action"
require "communique/notification"
require 'pry'


module Communique
  def self.notify
    noty = Notification.new
    binding.pry
    noty.notify
  end

  def self.action
    act = Action.new
    act.act
  end
  def self.additup a, b
    a + b
  end
end
