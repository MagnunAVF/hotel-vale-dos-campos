class AccommodationsController < ApplicationController
  before_action :set_accommodation, only: [:show, :edit, :update, :destroy]

  def index
    @accommodations = Accommodation.all
  end

  def main_search
  end

  def search_rooms
    occupied_rooms = []
    start_date = params[:start_date]
    end_date = params[:end_date]
    searched_start_date = Date.new(start_date["start_date(1i)"].to_i, start_date["start_date(2i)"].to_i, start_date["start_date(3i)"].to_i)
    searched_end_date = Date.new(end_date["end_date(1i)"].to_i, end_date["end_date(2i)"].to_i, end_date["end_date(3i)"].to_i)
    RoomBooking.all.each do |booking|
      if (booking.start_date..booking.end_date).overlaps?(searched_start_date..searched_end_date)
        occupied_rooms.append(Room.find(booking.accommodation_id))
      end
    end
    @rooms = Room.all - occupied_rooms
  end

  def search_event_halls
    occupied_eventhalls = []
    searched_period = params[:period]
    start_date = params[:start_date]
    searched_start_date = Date.new(start_date["start_date(1i)"].to_i, start_date["start_date(2i)"].to_i, start_date["start_date(3i)"].to_i)
    EventHallBooking.all.each do |booking|
      if searched_start_date.strftime("%Y-%m-%d")==booking.start_date.strftime("%Y-%m-%d") && booking.period.to_i == searched_period.to_i
        occupied_eventhalls.append(EventHall.find(booking.accommodation_id))
      end
    end
    @event_halls = EventHall.all - occupied_eventhalls
  end

  def search_meeting_rooms
    occupied_rooms = []
    start_date = params[:start_date]
    start_time = params[:start_time]
    searched_start_date = Date.new(start_date["start_date(1i)"].to_i, start_date["start_date(2i)"].to_i, start_date["start_date(3i)"].to_i)
    searched_start_timedate = DateTime.new(start_time["start_time(1i)"].to_i, start_time["start_time(2i)"].to_i, start_time["start_time(3i)"].to_i,start_time["start_time(4i)"].to_i, start_time["start_time(5i)"].to_i, start_time["start_time(6i)"].to_i)
    MeetingRoomBooking.all.each do |booking|
      if searched_start_date.strftime("%Y-%m-%d")==booking.start_date.strftime("%Y-%m-%d") &&
          ((searched_start_timedate.strftime("%H:%M:%S")..(searched_start_timedate + 6.hours).strftime("%H:%M:%S")).overlaps?(booking.start_time.strftime("%H:%M:%S")..(booking.start_time + 6.hours).strftime("%H:%M:%S") ))
        occupied_rooms.append(MeetingRoom.find(booking.accommodation_id))
      end
    end
    @meeting_rooms = MeetingRoom.all - occupied_rooms
  end

  def show
    if @accommodation.type=="Room"
      @room = @accommodation
    else
      if @accommodation.type=="EventHall"
        @event_hall = @accommodation
      else
        @meeting_room = @accommodation
      end
    end
  end

  def new
    @accommodation = Accommodation.new
  end

  def edit
  end

  def create
    @accommodation = Accommodation.new(accommodation_params)
    if @accommodation.save
      redirect_to @accommodation, notice: 'Cômodo criado com sucesso.'
    else
      render :new
    end
  end

  def update
    if @accommodation.update(accommodation_params)
      redirect_to @accommodation, notice: 'Cômodo atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @accommodation.destroy
    redirect_to accommodations_url, notice: 'Cômodo deletado com sucesso.'
  end

  private
    def set_accommodation
      @accommodation = Accommodation.find(params[:id])
    end

    def accommodation_params
      params.require(:accommodation).permit(:number, :capacity, :price, :type, :description, :occupied, :single_beds_number, :couple_beds_number, :videoconf, :tables_number, :period, :start_time => [], :start_date => [], :end_date => [])
    end
end
