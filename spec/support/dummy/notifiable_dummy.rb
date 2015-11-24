require 'mongoid'
class NotifiableDummy
  include Mongoid::Document
  include Mongoid::Timestamps
  include Communique::Notifiable
end
