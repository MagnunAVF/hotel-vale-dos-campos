class EventHallBooking < Booking
  validates_presence_of :period
  # 1 = First turn (08:00 to 15:00) ; 2 = Last turn (20:00 to 03:00)
end
