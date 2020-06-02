class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.references :user, null: false, foreign_key: true
      t.string :logo
      t.string :name
      t.string :email
      t.integer :phone
      t.string :address
      t.string :description
      t.integer :status

      t.timestamps
    end
  end
end
