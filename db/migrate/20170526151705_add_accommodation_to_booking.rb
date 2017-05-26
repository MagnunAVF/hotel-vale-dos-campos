class AddAccommodationToBooking < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookings, :accommodation, foreign_key: true
  end
end
