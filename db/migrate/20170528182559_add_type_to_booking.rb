class AddTypeToBooking < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :type, :string
  end
end
