class Admin::PostsController < Admin::AdminsController
  before_action :load_post, only: :destroy

  def index
    @posts = current_user.posts
  end

  def new
    @post = current_user.posts.build
    @post.skills.build
  end

  def create
    @post = current_user.posts.build post_params
    if @post.save
      flash[:success] = t "notification.post_success"
      redirect_to admin_posts_path
    else
      flash[:danger] = t "notification.post_fail"
      render :new
    end
  end

  def destroy
    if @post.destroy
      flash[:success] = t "admin.post.delete_success"
    else
      flash[:danger] = t "admin.post.delete_fail"
    end
    redirect_to admin_posts_path
  end

  private

  def post_params
    params.require(:post).permit Post::POST_PARAMS
  end

  def load_post
    @post = current_user.posts.find_by id: params[:id]
    return if @post

    flash[:danger] = t "admin.post.not_found"
    redirect_to admin_posts_path
  end
end
