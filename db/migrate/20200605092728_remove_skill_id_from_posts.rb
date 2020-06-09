class RemoveSkillIdFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :skill_id, :integer
  end
end
