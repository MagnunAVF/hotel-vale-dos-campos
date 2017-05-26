class Booking < ApplicationRecord
  belongs_to :client
  belongs_to :employee
  belongs_to :accommodation
end
