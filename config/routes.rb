Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: :show
  resources :matchmaker, only: :index
  get "homepage", to: "users#homepage", as: "homepage"
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: "logout"
  get "homepage/:id", to: "matchmaker#clicked_yes", as: "yes"
  get "homepage/:id", to: "matchmaker#clicked_no", as: "no"
end
