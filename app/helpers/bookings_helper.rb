module BookingsHelper
  def find_current_booking(accomodation_id)
    bookings = Booking.where(accommodation_id: accomodation_id).order(created_at: :asc)
    accommodation = Accommodation.find(accomodation_id)
    result_booking = nil

    if accommodation.type=="Room"
      bookings.each do |booking|
        if (booking.start_date..booking.end_date).cover?(Date.current)
          result_booking = booking
        end
      end

    else
      if accommodation.type=="EventHall"
        current_period = 0
        if (DateTime.now.change({ hour: 0, min: 0, sec: 1 })..DateTime.now.change({ hour: 12, min: 0, sec: 0 })).cover?(Time.now)
          current_period = 1
        else
          current_period = 2
        end

        bookings.each do |booking|
          if ((booking.start_date.compare_without_coercion(Date.current) == 0) && (booking.period == current_period))
            result_booking = booking
          end
        end
      else
        bookings.each do |booking|
          if ((booking.start_date.compare_without_coercion(Date.current) == 0) && (booking.start_time..booking.start_time + 6.hours).cover?(Time.now))
            result_booking = booking
          end
        end

      end
    end

    return result_booking
  end
end
