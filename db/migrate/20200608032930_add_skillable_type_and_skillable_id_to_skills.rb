class AddSkillableTypeAndSkillableIdToSkills < ActiveRecord::Migration[6.0]
  def change
    add_column :skills, :skillable_type, :string
    add_column :skills, :skillable_id, :integer
  end
end
