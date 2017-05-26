Rails.application.routes.draw do
  root "hotelinformations#home"
  resources :hotelinformations, only: [:show, :edit, :update]
  resources :bookings
  resources :accommodations
  resources :users

  get "/home" => "hotelinformations#home"
end
