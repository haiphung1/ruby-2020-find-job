class ChangeStatusToDefaultInUserApplies < ActiveRecord::Migration[6.0]
  def up
    change_column_default(
      :user_applies,
      :status,
      from: nil,
      to: 0
    )
  end
  def down
    change_column_default(
      :user_applies,
      :status,
      nil
    )
  end
end
