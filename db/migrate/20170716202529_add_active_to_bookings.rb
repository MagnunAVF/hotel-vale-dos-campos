class AddActiveToBookings < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :active, :boolean
  end
end
