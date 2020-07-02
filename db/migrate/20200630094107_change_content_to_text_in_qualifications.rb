class ChangeContentToTextInQualifications < ActiveRecord::Migration[6.0]
  def up
    change_column :qualifications, :content, :text
  end

  def down
    change_column :qualifications, :content, :string
  end
end
