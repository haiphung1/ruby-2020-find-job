module Admin::PostsHelper
  def get_category
    @category = Category.all.collect {|p| [ p.title, p.id ] }
  end
end
