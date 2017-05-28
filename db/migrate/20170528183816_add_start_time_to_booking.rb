class AddStartTimeToBooking < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :start_time, :datetime
  end
end
