Rails.application.routes.draw do
  resources :stations
  resources :places
  resources :receivers
  resources :beacon_holders
  resources :beacons
  resources :patients
  devise_for :users
  root to: 'dashboard#index'
end
