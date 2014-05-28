Rails.application.routes.draw do
  namespace :api do
    post 'tracks/record'
  end

  resources :stations
  resources :places
  resources :receivers
  resources :beacon_holders
  resources :beacons
  resources :patients
  devise_for :users
  root to: 'dashboard#index'
end
