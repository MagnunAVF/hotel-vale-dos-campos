class AddOccupiedToAccommodation < ActiveRecord::Migration[5.0]
  def change
    add_column :accommodations, :occupied, :boolean
  end
end
