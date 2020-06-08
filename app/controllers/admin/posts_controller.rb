class Admin::PostsController < Admin::AdminsController
  def index; end

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

  private

  def post_params
    params.require(:post).permit Post::POST_PARAMS
  end
end
