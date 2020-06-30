class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do
    flash[:warning] = t "authorized"
    redirect_back fallback_location: root_path
  end
  
  private

  def default_url_options
    {locale: I18n.locale}
  end
end
