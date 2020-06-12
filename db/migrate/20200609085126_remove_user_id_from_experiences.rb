class RemoveUserIdFromExperiences < ActiveRecord::Migration[6.0]
  def change
    remove_column :experiences, :user_id, :integer
  end
end
