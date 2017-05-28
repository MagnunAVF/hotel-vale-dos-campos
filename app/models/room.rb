class Room < Accommodation
  validates_presence_of :single_beds_number, :couple_beds_number
  validates_numericality_of :single_beds_number, :couple_beds_number
end
