class CreateUserApplies < ActiveRecord::Migration[6.0]
  def change
    create_table :user_applies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
