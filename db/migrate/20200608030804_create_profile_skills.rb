class CreateProfileSkills < ActiveRecord::Migration[6.0]
  def change
    create_table :profile_skills do |t|
      t.references :profile, null: false, foreign_key: true
      t.string :name
      t.integer :point
    end
  end
end
