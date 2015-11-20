module Communique
  module Notifier
    binding.pry
    has_many :notifications, :class_name => 'Communique::Notification'
  end
end
