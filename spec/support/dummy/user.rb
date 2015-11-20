require 'mongoid'
class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include Communique::Notifiable
end
