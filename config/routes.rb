Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  get "dinosaurs/map", to: "dinosaurs#map"
  resources :dinosaurs, only: %i[index show] do
    resources :bookings, only: :create
  end
  resources :my_bookings, only: :index
  resources :my_dinosaurs, only: %i[index new create destroy]
  resources :my_rents, only: :index do
    member do
      patch :accept
      patch :deny
    end
  end
end
