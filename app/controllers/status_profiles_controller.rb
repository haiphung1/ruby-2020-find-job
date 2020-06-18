class StatusProfilesController < ApplicationController
  def update
    if @profile = current_user.profiles.find_by(id: params[:profile_id])
      @profile.public_cv? ? @profile.private_cv! : @profile.public_cv!
      flash[:success] = t "notification.update_success"
    else
      flash[:danger] = t "notification.update_fail"
    end
    redirect_to user_path
  end
end
