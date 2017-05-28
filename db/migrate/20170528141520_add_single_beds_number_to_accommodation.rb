class AddSingleBedsNumberToAccommodation < ActiveRecord::Migration[5.0]
  def change
    add_column :accommodations, :single_beds_number, :integer
  end
end
