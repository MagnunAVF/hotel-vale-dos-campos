class AddBedsNumberToAccommodation < ActiveRecord::Migration[5.0]
  def change
    add_column :accommodations, :beds_number, :integer
  end
end
