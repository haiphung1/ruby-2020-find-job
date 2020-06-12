class AddColumPosition < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :position, :string
  end
end
