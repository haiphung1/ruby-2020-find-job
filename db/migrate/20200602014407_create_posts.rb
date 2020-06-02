class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true
      t.string :title
      t.string :description
      t.integer :salary
      t.string :address
      t.integer :type
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
