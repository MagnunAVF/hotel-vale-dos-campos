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

    respond_to do |format|
      if @accommodation.save
        format.html { redirect_to @accommodation, notice: 'Accommodation was successfully created.' }
        format.json { render :show, status: :created, location: @accommodation }
      else
        format.html { render :new }
        format.json { render json: @accommodation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @accommodation.update(accommodation_params)
        format.html { redirect_to @accommodation, notice: 'Accommodation was successfully updated.' }
        format.json { render :show, status: :ok, location: @accommodation }
      else
        format.html { render :edit }
        format.json { render json: @accommodation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @accommodation.destroy
    respond_to do |format|
      format.html { redirect_to accommodations_url, notice: 'Accommodation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_accommodation
      @accommodation = Accommodation.find(params[:id])
    end

    def accommodation_params
      params.require(:accommodation).permit(:number, :capacity, :price, :type, :description, :occupied, :single_beds_number, :couple_beds_number, :videoconf, :tables_number, :period, :start_time => [], :end_time => [])
    end
end
