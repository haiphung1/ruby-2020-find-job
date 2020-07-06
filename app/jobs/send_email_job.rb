class SendEmailJob < ApplicationJob
  def perform user_apply
    if user_apply.approved?
      UserApplyMailer.approved(user_apply).deliver_now
    else
      UserApplyMailer.cancel(user_apply).deliver_now
    end
  end
end
