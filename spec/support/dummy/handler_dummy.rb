# support spec class that would be replaced with a pusher or email sender.
# It is able to save the parameters passed to it
# so that we can test their values.
class HandlerDummy
  attr_reader :notification
  attr_reader :action
  attr_reader :notifiable

  def push_notification(notification, action, notifiable)
    @notification = notification
    @action = action
    @notifiable = notifiable
  end
end
