module Communique
  class NotificationHandlerNotCallable < StandardError; end

  # notification handler can do things like send push notifications and emails
  class Handler
    def self.external_services(notification)
      config = Communique.config
      return if config.nil?
      return if config.notification_handler.nil?

      validate_notification_handler!(config.notification_handler)
      config.notification_handler.call(
        notification,
        notification.action,
        notification.notifiable
      )
    end

    def self.validate_notification_handler!(handler)
      unless handler.respond_to?(:call)
        fail(
          NotificationHandlerNotCallable,
          'notification_handler needs to be nil or a callable block'
        )
      end
    end

    private_class_method :validate_notification_handler!
  end
end
