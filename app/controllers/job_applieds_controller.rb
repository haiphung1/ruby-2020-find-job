class JobAppliedsController < ApplicationController
  def index
    post_ids = current_user.user_applies.pluck :post_id
    @posts = Post.post_listed post_ids
  end 
end
