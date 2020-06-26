class Users::SessionsController < Devise::SessionsController
  protected

  def after_sign_in_path_for user
    return root_url if current_user.user?
    return admin_root_url if current_user.admin?
  end
end
