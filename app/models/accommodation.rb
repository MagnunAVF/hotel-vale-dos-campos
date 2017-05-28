class Accommodation < ApplicationRecord
  validates_presence_of :number, :capacity, :description, :price
  validates_numericality_of :number, :capacity, :price
  validates_uniqueness_of :number
  validates :occupied, inclusion: { in: [ true, false ] }

  has_many :bookings
end
