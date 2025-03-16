Rails.application.routes.draw do
  root "places#index"
  
  resources :entries
  resources :places
  resources :users
  
  get "/login", to: "sessions#new"
  get "/logout", to: "sessions#destroy"
  post "/sessions", to: "sessions#create"
end