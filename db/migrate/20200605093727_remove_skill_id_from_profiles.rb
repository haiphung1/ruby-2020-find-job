class RemoveSkillIdFromProfiles < ActiveRecord::Migration[6.0]
  def change
    remove_column :profiles, :skill_id, :integer
  end
end
