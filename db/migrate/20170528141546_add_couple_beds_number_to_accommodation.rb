class AddCoupleBedsNumberToAccommodation < ActiveRecord::Migration[5.0]
  def change
    add_column :accommodations, :couple_beds_number, :integer
  end
end
