require 'mongoid'
module Communique
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

    def self.viewed_all! notifiable
      notifiable.notifications.update_all(seen: true)
    end
  end
end
