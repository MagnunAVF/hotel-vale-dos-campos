class Accommodation < ApplicationRecord
  validates_presence_of :number, :capacity, :description
  validates_numericality_of :number, :capacity
  validates_uniqueness_of :number

  has_many :bookings
end
