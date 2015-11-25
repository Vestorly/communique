module Communique
  class NotificationHandlerNotCallable < StandardError; end
  class Handler
    def self.external_services notification
      config = Communique.config
      return if config.nil?
      return if config.notification_handler.nil?
      # make sure config.notification_handler is a block
      validate_notification_handler!(config.notification_handler)
      config.notification_handler.call(
        notification,
        notification.action,
        notification.notifiable
      )
    end

    def self.validate_notification_handler!(handler)
      if !handler.respond_to? :call
        raise NotificationHandlerNotCallable.new(
          "notification_handler needs to be nil or a callable block"
        )
      end
    end

    private_class_method :validate_notification_handler!
  end
end
