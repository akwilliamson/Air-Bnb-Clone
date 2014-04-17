StayHereTonight::Application.routes.draw do
  resources :listings
  devise_for :users
  resources :users, only: [:show, :edit]
  resources :bookings
  root to: 'listings#index'
 end
