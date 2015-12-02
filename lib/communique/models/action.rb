require 'mongoid'
module Communique
  # notificaitons contain an action which gives more info about a certain
  # message/error. These are what is shown to the user
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
  end
end
