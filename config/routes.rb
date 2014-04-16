StayHereTonight::Application.routes.draw do
  resources :listings
  devise_for :users
  resources :users, only: :show
  root to: 'listings#index'
 end
