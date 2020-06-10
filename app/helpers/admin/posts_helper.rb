module Admin::PostsHelper
  def get_category
    @category = Category.pluck :title, :id
  end
end
