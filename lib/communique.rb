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

    if prevent_unseen_duplicates?
      existing_notification = find_existing_notifications(notifiable, action_key)
      if existing_notification
        existing_notification.update_attributes(
          context_info: context_info,
          updated_at: Time.now
        )
        return existing_notification.id.to_s
      end
    end
    notification = create_notification(notifiable, context_info, action_key, action)
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

  def self.prevent_unseen_duplicates?
    !Communique.config.nil? && Communique.config.prevent_unseen_duplicates
  end

  def self.find_existing_notifications(notifiable, action_key)
    Notification.where(
      notifiable: notifiable,
      action_key: action_key,
      seen: false
    ).order_by(updated_at: :desc).first
  end

  def self.create_notification( notifiable, context_info, action_key, action)
    Notification.create(
      notifiable: notifiable,
      context_info: context_info,
      action_key: action_key,
      action: action
    )
  end

  private_class_method(
    :prevent_unseen_duplicates?,
    :find_existing_notifications,
    :create_notification
  )
end
