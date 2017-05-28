class Booking < ApplicationRecord
  belongs_to :client
  belongs_to :employee
  belongs_to :accommodation

  validates_presence_of :description, :start_date
end
