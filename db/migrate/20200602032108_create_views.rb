class CreateViews < ActiveRecord::Migration[6.0]
  def change
    create_table :views do |t|
      t.references :user, null: false, foreign_key: true
      t.string :viewable_type
      t.integer :viewable_id

      t.timestamps
    end
  end
end
