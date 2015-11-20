require 'mongoid'
class User
  include Mongoid::Document
  include Mongoid::Timestamps
  binding.pry
  include Communique::Notifier
end
