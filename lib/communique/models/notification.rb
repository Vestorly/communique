require 'mongoid'
module Communique
  # active model definition for notifications
  class Notification
    include ::Mongoid::Document
    include ::Mongoid::Timestamps

    field :seen, type: Boolean, default: false
    field :action_key
    field :context_info, type: Hash

    belongs_to :notifiable, polymorphic: true
    belongs_to :action

    def notify
      'successful notification'
    end

    def self.viewed_all!(notifiable)
      notifiable.notifications.update_all(seen: true)
    end

    def self.viewed!(notifiable, seen_notification_ids)
      notifiable.notifications.where(
        :_id.in => seen_notification_ids
      ).update_all(seen: true)
    end

    def self.count_unseen(notifiable)
      notifiable.notifications.where(seen: false).count
    end
  end
end
