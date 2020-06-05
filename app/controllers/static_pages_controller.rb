class StaticPagesController < ApplicationController
  def home
    @feed_items = Post.by_created_at.page(params[:page]).per(Settings.job_per_page)
  end
end
