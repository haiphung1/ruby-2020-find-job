class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.references :skill, null: false, foreign_key: true
      t.string :avatar
      t.integer :phone
      t.string :email
      t.string :education
      t.string :address
      t.string :facebook_link
      t.string :title
      t.integer :status

      t.timestamps
    end
  end
end
