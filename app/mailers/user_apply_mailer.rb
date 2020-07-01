class UserApplyMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_apply_mailer.approved.subject
  #
  def approved user_apply
    @user_apply = user_apply
  
    mail to: @user_apply.user.email, subject: "Thông báo ứng viên"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_apply_mailer.reject.subject
  #
  def reject user_apply
    @user_apply = user_apply
  
    mail to: @user_apply.user.email, subject: "Thông báo ứng viên"
  end
end
