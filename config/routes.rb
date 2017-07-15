Rails.application.routes.draw do
  devise_for :users
  root "home#home"
  resources :hotelinformations, only: [:show, :edit, :update]
  resources :bookings
  resources :accommodations
  resources :users

  get "/home" => "home#home"
  get "/user_home" => "home#user_home"
  get "/employee_home" => "home#employee_home"

  get "/main_search" => "accommodations#main_search"
  get "/search_rooms" => "accommodations#search_rooms"
  get "/search_meeting_rooms" => "accommodations#search_meeting_rooms"
  get "/search_event_halls" => "accommodations#search_event_halls"
end
