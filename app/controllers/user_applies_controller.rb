class UserAppliesController < ApplicationController
  before_action :authenticate_user!, :load_post, only: %i(create destroy)
  before_action :check_valid_profile_applied, only: :destroy
  
  authorize_resource

  def create
    current_user.user_applies.create apply_params
    respond_to :js
  end

  def destroy
    current_user.user_applies.find_by(post_id: params[:id]).delete
    respond_to :js
  end

  private 

  def apply_params
    params.permit UserApply::USER_APPLY_PERMIT
  end

  def load_post
    @post = Post.find_by(id: params[:id] || params[:post_id])
    return if @post 
    
    flash[:danger] = t "admin.post.not_found"
    redirect_to root_url
  end

  def check_valid_profile_applied
    @post_applied = current_user.user_applies.find_by post_id: params[:id]

    if @post_applied.nil?
      flash[:danger] = t "admin.profile.user_not_found"
      redirect_to root_url
    else
      return if @post_applied.pending? 
      
      flash[:danger] = t "cv.cv_approved"
      redirect_to job_applieds_user_path
    end
  end
end
