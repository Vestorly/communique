class HandlerDummy
  attr_reader :notification
  attr_reader :action
  attr_reader :notifiable

  def push_notification notification, action, notifiable
    @notification = notification
    @action = action
    @notifiable = notifiable
  end
end
