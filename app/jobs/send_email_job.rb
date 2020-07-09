class SendEmailJob < ApplicationJob
  def perform user_apply, status_attribute
    UserApplyMailer.send(status_attribute, user_apply).deliver_now
  end
end
