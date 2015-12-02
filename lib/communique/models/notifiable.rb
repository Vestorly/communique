module Communique
  # generic model that contains many notifications
  module Notifiable
    extend ActiveSupport::Concern
    included do
      has_many(
        :notifications,
        class_name: 'Communique::Notification',
        as: :notifiable
      )
    end
  end
end
