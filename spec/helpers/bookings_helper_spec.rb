require "rails_helper"

include BookingsHelper

RSpec.describe BookingsHelper do
  describe ".find_current_booking" do
    describe "searching for room: " do
      it "finds room's current booking" do
        room_booking = FactoryGirl.create :present_room_booking

        result = find_current_booking(room_booking.accommodation.id)

        expect(result).to eq(room_booking)
      end

      it "finds room's current booking" do
        room_booking = FactoryGirl.create :future_room_booking

        result = find_current_booking(room_booking.accommodation.id)

        expect(result).to eq(nil)
      end
    end

    describe "searching for meeting room: " do
      it "finds meeting room's current booking" do
        meeting_room_booking = FactoryGirl.create :present_meeting_room_booking

        result = find_current_booking(meeting_room_booking.accommodation.id)

        expect(result).to eq(meeting_room_booking)
      end

      it "finds meeting room's current booking" do
        meeting_room_booking = FactoryGirl.create :future_meeting_room_booking

        result = find_current_booking(meeting_room_booking.accommodation.id)

        expect(result).to eq(nil)
      end
    end

    describe "searching for event hall: " do
      it "finds event hall's current booking" do
        event_hall_booking = FactoryGirl.create :present_event_hall_booking

        result = find_current_booking(event_hall_booking.accommodation.id)

        expect(result).to eq(event_hall_booking)
      end

      it "finds event hall's current booking" do
        event_hall_booking = FactoryGirl.create :future_event_hall_booking

        result = find_current_booking(event_hall_booking.accommodation.id)

        expect(result).to eq(nil)
      end
    end
  end
end
