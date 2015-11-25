require 'mongoid'
module Communique
  class Action
    include ::Mongoid::Document
    include ::Mongoid::Timestamps

    field :key
    field :name
    field :url
    field :description
    field :image_url
    field :level
    field :send_email, type: Boolean, default: false
    has_many :notifications

    def act
      'lets act on this'
    end
  end
end
