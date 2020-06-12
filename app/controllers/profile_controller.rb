class ProfileController < ApplicationController
  before_action :logged_in_user, only: :create
  
  def new
    @profile = current_user.profiles.build.tap do |p|
      p.qualifications.build
      p.experiences.build
      p.profile_skills.build
    end
  end

  def create
    @profile = current_user.profiles.build profile_params
    @profile.image.attach profile_params[:avatar]
    if @profile.save
      flash[:success] = t "notification.create_success"
      redirect_to root_url
    else
      flash[:danger] = t "notification.creat_fail"
      render :new
    end
  end

  private
  
  def profile_params
    params.require(:profile).permit Profile::PROFILE_PERMIT
  end
end
