Rails.application.routes.draw do
  devise_for :users
  root "hotelinformations#home"
  resources :hotelinformations, only: [:show, :edit, :update]
  resources :bookings
  resources :accommodations
  resources :users

  get "/home" => "hotelinformations#home"
  get "/main_search" => "accommodations#main_search"
  get "/search_rooms" => "accommodations#search_rooms"

end
