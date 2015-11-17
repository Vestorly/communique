require 'mongoid'
module Communique
  class Notification
    include ::Mongoid::Document
    include ::Mongoid::Timestamps

    field :seen, type: Boolean, default: false
    field :integration, type: String
    field :context
    field :action_key

    def notify
      'successful notification'
    end
  end
end
