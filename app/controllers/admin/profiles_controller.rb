class Admin::ProfilesController < Admin::AdminsController
  before_action :load_profile, only: %i(show)

  def show
    @experiences = @profile.experiences
    @qualifications = @profile.qualifications
  end

  private

  def load_profile
    @profile = Profile.find_by id: params[:id]
    return if @profile

    flash[:danger] = t "admin.profile.profile_not_found"
    redirect_to admin_root_url
  end
end
