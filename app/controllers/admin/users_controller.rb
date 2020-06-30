class Admin::UsersController < Admin::AdminsController
  before_action :load_user, only: %i(show)

  def show
    @profiles = @user.profiles.public_cv.page(params[:page]).per Settings.profile_per_page
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t "admin.profile.user_not_found"
    redirect_to admin_root_url
  end
end
