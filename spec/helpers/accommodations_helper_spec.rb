require "rails_helper"

include AccommodationsHelper

RSpec.describe AccommodationsHelper do

  describe ".search_reserved_rooms" do
    it "finds all reserved rooms" do
      room_booking = FactoryGirl.create :present_room_booking

      result = search_reserved_rooms(Date.current, Date.current + 5)

      expect(result).to eq([room_booking.accommodation])
    end

    it "DOES NOT find reserved rooms" do
      room_booking = FactoryGirl.create :future_room_booking

      result = search_reserved_rooms(Date.current + 30, Date.current + 35)

      expect(result).to eq([])
    end
  end

  describe ".search_reserved_meeting_rooms" do
    it "finds all reserved meeting rooms" do
      meeting_room_booking = FactoryGirl.create :present_meeting_room_booking

      result = search_reserved_meeting_rooms(Date.current, DateTime.now + 1.hour)

      expect(result).to eq([meeting_room_booking.accommodation])
    end

    it "DOES NOT find reserved meeting rooms" do
      meeting_room_booking = FactoryGirl.create :present_meeting_room_booking

      result = search_reserved_rooms(Date.current , DateTime.now + 10.hour)

      expect(result).to eq([])
    end
  end

  describe ".search_reserved_event_halls" do
    it "finds all reserved event halls" do
      event_hall_booking = FactoryGirl.create :present_event_hall_booking

      result = search_reserved_event_halls(Date.current, 2)

      expect(result).to eq([event_hall_booking.accommodation])
    end

    it "DOES NOT find reserved event halls" do
      event_hall_booking = FactoryGirl.create :future_event_hall_booking

      result = search_reserved_event_halls(Date.current + 3, 1)

      expect(result).to eq([])
    end
  end

  describe ".available_room?" do
    it "room is available" do
      room_booking = FactoryGirl.create :future_room_booking

      result = available_room?(room_booking.accommodation , Date.current + 1, Date.current + 3)

      expect(result).to eq(true)
    end

    it "room IS NOT available today" do
      room_booking = FactoryGirl.create :present_room_booking

      result = available_room?(room_booking.accommodation , Date.current, Date.current + 3)

      expect(result).to eq(false)
    end
  end

  describe ".available_meeting_room?" do
    it "meeting room is available" do
      meeting_room_booking = FactoryGirl.create :future_meeting_room_booking

      result = available_meeting_room?(meeting_room_booking.accommodation , Date.current + 5, DateTime.now + 5.days + 10.hour)

      expect(result).to eq(true)
    end

    it "meeting room IS NOT available" do
      meeting_room_booking = FactoryGirl.create :present_meeting_room_booking

      result = available_meeting_room?(meeting_room_booking.accommodation , Date.current, DateTime.now + 2.hour)

      expect(result).to eq(false)
    end
  end

  describe ".available_event_hall?" do
    it "event hall is available" do
      event_hall_booking = FactoryGirl.create :future_event_hall_booking

      result = available_event_hall?(event_hall_booking.accommodation , Date.current + 5.days, 1)

      expect(result).to eq(true)
    end

    it "event hall IS NOT available today" do
      event_hall_booking = FactoryGirl.create :present_event_hall_booking

      result = available_event_hall?(event_hall_booking.accommodation , Date.current, 2)

      expect(result).to eq(false)
    end
  end
end
