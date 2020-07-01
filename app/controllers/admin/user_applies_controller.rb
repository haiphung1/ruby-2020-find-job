class Admin::UserAppliesController < Admin::AdminsController
  before_action :load_user_apply, only: %i(update destroy)

  def index
    posts_id = current_user.posts.pluck :id
    @user_applies = UserApply.by_created_at.post_applies posts_id
  end

  def update
    if @user_apply.approved!
      UserApplyMailer.approved(@user_apply).deliver_now
      flash[:success] = t "admin.apply.approved_success"
    else
      flash[:danger] = t "admin.apply.approved_fail"
    end
    redirect_to admin_user_applies_path
  end

  def destroy
    if @user_apply.cancel!
      UserApplyMailer.reject(@user_apply).deliver_now
      flash[:success] = "Hủy ứng viên thành công"
    else
      flash[:danger] = "Hủy ứng viên thất bại"
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
