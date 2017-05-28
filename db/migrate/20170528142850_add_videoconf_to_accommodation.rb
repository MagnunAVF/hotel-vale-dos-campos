class AddVideoconfToAccommodation < ActiveRecord::Migration[5.0]
  def change
    add_column :accommodations, :videoconf, :boolean
  end
end
