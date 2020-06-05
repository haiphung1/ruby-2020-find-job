class ChangeColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :posts, :type, :target_type
  end
end
