Rails.application.routes.draw do
  devise_for :users

  root "home#home"

  resources :hotelinformations, only: [:show, :edit, :update]

  resources :bookings
  resources :room_bookings, :controller => "bookings", :type => "RoomBooking"
  resources :meeting_room_bookings, :controller => "bookings", :type => "MeetingRoomBooking"
  resources :event_hall_bookings, :controller => "bookings", :type => "EventHallBooking"

  resources :accommodations
  resources :users

  get "/select_new_booking" => "bookings#select_new"

  get "/home" => "home#home"
  get "/user_home" => "home#user_home"
  get "/employee_home" => "home#employee_home"

  get "/main_search" => "accommodations#main_search"
  get "/search_rooms" => "accommodations#search_rooms"
  get "/search_meeting_rooms" => "accommodations#search_meeting_rooms"
  get "/search_event_halls" => "accommodations#search_event_halls"
end
