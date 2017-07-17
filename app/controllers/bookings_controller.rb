class BookingsController < ApplicationController
  include AccommodationsHelper

  before_action :authenticate_user!
  before_action :set_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.all
    @rooms_bookings = RoomBooking.all.order(created_at: :desc)
    @meeting_rooms_bookings = MeetingRoomBooking.all.order(created_at: :desc)
    @event_halls_bookings = EventHallBooking.all.order(created_at: :desc)
  end

  def checkin
    @booking = Booking.find(params[:booking_id])
    @booking.active = true
    @booking.accommodation.occupied = true
    @booking.save
    redirect_to bookings_path
  end

  def checkout
    @booking = Booking.find(params[:booking_id])
    @booking.active = false
    @booking.accommodation.occupied = false
    @booking.save
    redirect_to bookings_path
  end

  def show
  end

  def new
    @booking = Booking.new
    @booking_type = params[:type]
  end

  def select_new
  end

  def edit
  end

  def user_bookings
    @bookings = Booking.where(client_id: current_user.id).order(created_at: :desc)
    @rooms_bookings = RoomBooking.where(client_id: current_user.id).order(created_at: :desc)
    @meeting_rooms_bookings = MeetingRoomBooking.where(client_id: current_user.id).order(created_at: :desc)
    @event_halls_bookings = EventHallBooking.where(client_id: current_user.id).order(created_at: :desc)
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.accommodation = Accommodation.find_by_number(params[:accommodation_number])
    @booking.active = true

    if current_user.type == "Employee"
      @booking.employee = current_user
      @booking.client = Client.find_by_cpf(params[:client_cpf])
    else
      @booking.client = current_user
      @booking.employee = Employee.first
    end

    if @booking.accommodation.type == "Room"
      accommodation_available = available_room?(@booking.accommodation, @booking.start_date, @booking.end_date)
    else
      if @booking.accommodation.type == "MeetingRoom"
        accommodation_available = available_meeting_room?(@booking.accommodation, @booking.start_date, @booking.start_time)
      else
        accommodation_available = available_event_hall?(@booking.accommodation, @booking.start_date, @booking.period)
      end
    end

    if not accommodation_available
      flash.now[:notice] = 'Cômodo já ocupado ou reservado !'
      render :new
    else
      if @booking.save
        redirect_to @booking, notice: 'Reserva criada com sucesso.'
      else
        render :new
      end
    end
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking, notice: 'Reserva foi atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_url, notice: 'Reserva deletada com sucesso.'
  end

  private
    def set_booking
      @booking = Booking.find(params[:id])
    end

    def booking_params
      params.require(:booking).permit(:description, :start_date, :end_date, :start_time, :period, :client_id, :employee_id, :accommodation_id, :type, :client_cpf, :accommodation_number, :booking_id, :active)
    end
end
