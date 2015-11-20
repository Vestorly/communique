require "communique/version"
require "communique/models/action"
require 'pry'


module Communique
  def self.notify(params={})
    advisor = params[:advisor]
    context_name = params[:name]
    context_info = params[:info]
    action_key = params[:action]

    binding.pry
    noty = Notification.new(
      advisor: advisor,
      context_name: context_name,
      context_info: context_info,
      action_key: action_key,
    )

    noty.notify
  end

  def self.actions
    act = Action.new
    act.act
  end

  def self.notifications advisor
    advisor.notifications
  end

end
