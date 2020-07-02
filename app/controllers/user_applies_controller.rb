class UserAppliesController < ApplicationController
  before_action :authenticate_user!, :load_post, only: %i(create destroy)   

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
    @post = Post.find_by id: params[:id] || params[:post_id]
    return if @post 
    
    flash[:danger] = t "admin.post.not_found"
    redirect_to root_url
  end
end
