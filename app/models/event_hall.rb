class EventHall < Accommodation
  validates_presence_of :tables_number
  validates_numericality_of :tables_number
end
