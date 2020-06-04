class ApplicationController < ActionController::Base
  include SessionsHelper

  def logged_in_user
    return if logged_in?

    redirect_to login_url
  end
end
