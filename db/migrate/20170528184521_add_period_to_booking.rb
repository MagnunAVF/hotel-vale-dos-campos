class AddPeriodToBooking < ActiveRecord::Migration[5.0]
  def change
    add_column :bookings, :period, :integer
  end
end
