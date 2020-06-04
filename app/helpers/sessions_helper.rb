module SessionsHelper
  def log_in user
    session[:user_id] = user.id
    if user.role == Settings.role.user
      redirect_to root_url
    elsif user.role == Settings.role.admin
      redirect_to admin_root_url
    end
  end

  def current_user
    @current_user ||= User.find_by id: session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session.delete :user_id
    @current_user = nil
  end
end
