class CreateQualifications < ActiveRecord::Migration[6.0]
  def change
    create_table :qualifications do |t|
      t.string :title
      t.date :start_time
      t.date :end_time
      t.string :content
      t.references :profile, null: false, foreign_key: true
    end
  end
end
