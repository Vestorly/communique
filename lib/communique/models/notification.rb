require 'mongoid'
module Communique
  class Notification
    include ::Mongoid::Document
    include ::Mongoid::Timestamps

    field :seen, type: Boolean, default: false
    field :integration, type: String
    field :context_name
    field :context_info, type: Hash
    field :action_key
    has_one :action
    belongs_to :advisor

    def notify
      'successful notification'
    end
  end
end
