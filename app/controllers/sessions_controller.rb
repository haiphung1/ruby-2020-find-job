class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate(params[:session][:password])
      flash[:success] = t "auth.success"
      log_in user
    else
      flash[:danger] = t "auth.incorrect"
      render :new
    end
  end

  def current_user
    @current_user ||= User.find_by id: session[:user_id] if session[:user_id]
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
