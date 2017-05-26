class AddEmployeeToBooking < ActiveRecord::Migration[5.0]
  def change
    add_reference :bookings, :employee, foreign_key: true
  end
end
