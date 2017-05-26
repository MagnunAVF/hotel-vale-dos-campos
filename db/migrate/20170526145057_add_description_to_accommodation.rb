class AddDescriptionToAccommodation < ActiveRecord::Migration[5.0]
  def change
    add_column :accommodations, :description, :string
  end
end
