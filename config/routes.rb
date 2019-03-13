Rails.application.routes.draw do
  root 'flights#index'
  resources :flights, only: :index
  resources :reservations, only: [:new, :create, :show]
end
