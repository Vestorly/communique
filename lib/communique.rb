require "communique/version"
require "communique/models/action"
require "communique/models/notification"
require 'pry'


module Communique
  def self.notify(advisor, context_name=nil)
    noty = Notification.new
    noty.advisor = advisor
    noty.context_name = context_name

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
