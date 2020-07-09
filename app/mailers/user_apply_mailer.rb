class UserApplyMailer < ApplicationMailer
  def approved user_apply
    @user_apply = user_apply
    mail to: @user_apply.user_email, subject: I18n.t("email.subject")
  end

  def cancel user_apply
    @user_apply = user_apply
    mail to: @user_apply.user_email, subject: I18n.t("email.subject")
  end
end
