class Admin::UserAppliesController < Admin::AdminsController
  before_action :load_user_apply, only: %i(update destroy)

  def index
    posts_id = current_user.posts.pluck :id
    @user_applies = UserApply.post_applies posts_id
  end

  def update
    if @user_apply.approved!
      SendEmailJob.perform_later @user_apply
      flash[:success] = t "admin.apply.approved_success"
    else
      flash[:danger] = t "admin.apply.approved_fail"
    end
    redirect_to admin_user_applies_path
  end

  def destroy
    if @user_apply.cancel!
      SendEmailJob.perform_later @user_apply
      flash[:success] = t "admin.apply.cancel_success"
    else
      flash[:danger] = t "admin.apply.cancel_fail"
    end
    redirect_to admin_user_applies_path
  end

  private

  def load_user_apply
    @user_apply = UserApply.find_by id: params[:id]
    return @user_applies

    flash[:danger] = t "admin.post.not_found"
    redirect_to admin_user_applies_path
  end
end
