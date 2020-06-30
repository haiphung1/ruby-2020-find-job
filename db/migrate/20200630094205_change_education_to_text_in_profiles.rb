class ChangeEducationToTextInProfiles < ActiveRecord::Migration[6.0]
  def up
    change_column :profiles,:education, :text
  end

  def down
    change_column :profiles,:education, :string
  end
end
