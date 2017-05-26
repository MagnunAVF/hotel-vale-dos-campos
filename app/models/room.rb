class Room < Accommodation
  validates_presence_of :beds_number
  validates_numericality_of :beds_number
end
