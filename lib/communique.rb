require 'communique/version'
require 'communique/configuration'
require 'communique/models/action'
require 'communique/models/notifiable'
require 'communique/models/notification'
require 'communique/handler'

# communique external methods
module Communique
  def self.notify(notifiable, action_key, context_info = nil)
    action = Action.find_or_create_by(key: action_key)

    notification = Notification.create(
      notifiable: notifiable,
      context_info: context_info,
      action_key: action_key,
      action: action
    )

    Handler.external_services notification

    notification.id.to_s
  end

  def self.actions
    Action.all.to_a
  end

  def self.viewed_all!(notifiable)
    Notification.viewed_all!(notifiable)
  end

  def self.viewed!(notifiable, seen_notification_ids)
    Notification.viewed! notifiable, seen_notification_ids
  end

  def self.count_unseen(notifiable)
    Notification.count_unseen notifiable
  end
end
