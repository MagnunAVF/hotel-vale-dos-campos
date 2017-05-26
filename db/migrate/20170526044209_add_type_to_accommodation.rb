class AddTypeToAccommodation < ActiveRecord::Migration[5.0]
  def change
    add_column :accommodations, :type, :string
  end
end
