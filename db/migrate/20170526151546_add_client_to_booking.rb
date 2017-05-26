class AddClientToBooking < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookings, :client, foreign_key: true
  end
end
