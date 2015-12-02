require 'mongoid'
# class that has notifications used for testing
class NotifiableDummy
  include Mongoid::Document
  include Mongoid::Timestamps
  include Communique::Notifiable
end
