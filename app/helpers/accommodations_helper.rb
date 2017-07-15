module AccommodationsHelper
  def search_reserved_rooms(start_date, end_date)
    reserved_rooms = []
    RoomBooking.all.each do |booking|
      if (booking.start_date..booking.end_date).overlaps?(start_date..end_date)
        reserved_rooms.append(Room.find(booking.accommodation_id))
      end
    end
    return reserved_rooms
  end

  def search_reserved_meeting_rooms(start_date, start_time)
    reserved_meeting_rooms = []
    MeetingRoomBooking.all.each do |booking|
      if start_date.strftime("%Y-%m-%d")==booking.start_date.strftime("%Y-%m-%d") &&
          ((start_timedate.strftime("%H:%M:%S")..(start_timedate + 6.hours).strftime("%H:%M:%S")).overlaps?(booking.start_time.strftime("%H:%M:%S")..(booking.start_time + 6.hours).strftime("%H:%M:%S") ))
        reserved_meeting_rooms.append(MeetingRoom.find(booking.accommodation_id))
      end
    end
    return reserved_meeting_rooms
  end

  def search_reserved_event_halls(start_date, period)
    reserved_eventhalls = []
    EventHallBooking.all.each do |booking|
      if start_date.strftime("%Y-%m-%d")==booking.start_date.strftime("%Y-%m-%d") && booking.period.to_i == period.to_i
        reserved_eventhalls.append(EventHall.find(booking.accommodation_id))
      end
    end
    return reserved_eventhalls
  end

  def available_room?(room, start_date, end_date)
    if room.occupied || search_reserved_meeting_rooms(start_date, start_time).include?(room)
      return false
    else
      return true
    end
  end

  def available_meeting_room?(meeting_room, start_date, start_time)
    if meeting_room.occupied || search_reserved_meeting_rooms(start_date, start_time).include?(meeting_room)
      return false
    else
      return true
    end
  end

  def available_event_hall?(event_hall, start_date, period)
    if event_hall.occupied || search_reserved_event_halls(start_date, period).include?(event_hall)
      return false
    else
      return true
    end
  end
end
