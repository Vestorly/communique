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

    def act
      'lets act on this'
    end
  end
end
