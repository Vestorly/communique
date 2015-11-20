require 'mongoid'
module Communique
  class Notification
    include ::Mongoid::Document
    include ::Mongoid::Timestamps

    field :seen, type: Boolean, default: false
    field :context_name
    field :action_key
    field :context_info, type: Hash

    belongs_to :advisor
    belongs_to :action

    def notify
      'successful notification'
    end
  end
end
