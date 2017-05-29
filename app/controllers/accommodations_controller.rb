class AccommodationsController < ApplicationController
  before_action :set_accommodation, only: [:show, :edit, :update, :destroy]

  # GET /accommodations
  # GET /accommodations.json
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
    @search_s = searched_start_date
    @search_e = searched_end_date
    RoomBooking.all.each do |booking|
      if (booking.start_date..booking.end_date).overlaps?(searched_start_date..searched_end_date)
        occupied_rooms.append(Room.find(booking.accommodation_id))
      end
    end
    @rooms = Room.all - occupied_rooms
  end

  # GET /accommodations/1
  # GET /accommodations/1.json
  def show
    if @accommodation.type=="Room"
      @room = @accommodation
    end
  end

  # GET /accommodations/new
  def new
    @accommodation = Accommodation.new
  end

  # GET /accommodations/1/edit
  def edit
  end

  # POST /accommodations
  # POST /accommodations.json
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

  # PATCH/PUT /accommodations/1
  # PATCH/PUT /accommodations/1.json
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

  # DELETE /accommodations/1
  # DELETE /accommodations/1.json
  def destroy
    @accommodation.destroy
    respond_to do |format|
      format.html { redirect_to accommodations_url, notice: 'Accommodation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accommodation
      @accommodation = Accommodation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accommodation_params
      params.require(:accommodation).permit(:number, :capacity, :price, :type, :description, :occupied, :single_beds_number, :couple_beds_number, :videoconf, :tables_number,
      :start_time => [], :end_time => [])
    end
end
