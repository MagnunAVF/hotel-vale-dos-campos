class Accommodation < ApplicationRecord
  validates_presence_of :number, :capacity, :description, :occupied, :price
  validates_numericality_of :number, :capacity, :price
  validates_uniqueness_of :number

  has_many :bookings
end
