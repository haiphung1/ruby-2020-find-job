class CreateNotifications < ActiveRecord::Migration[6.0]
  def change
    create_table :notifications do |t|
      t.string :type
      t.integer :creator_id
      t.integer :receiver_id
      t.string :data
      t.datetime :read_at

      t.timestamps
    end
  end
end
