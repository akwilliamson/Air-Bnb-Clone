StayHereTonight::Application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  resources :listings
  devise_for :users
  resources :users, only: [:show, :edit]
  resources :bookings
  root to: 'listings#index'
 end
