class AddTablesNumberToAccommodation < ActiveRecord::Migration[5.0]
  def change
    add_column :accommodations, :tables_number, :integer
  end
end
