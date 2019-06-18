Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: :show
  resources :matchmaker, only: :index
  get "homepage", to: "users#homepage", as: "homepage"
  get "login", to: "sessions#login", as: "login"
  get "signup", to: "users#new", as: "signup"
  post "signup", to: "users#create"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: "logout"
  get "homepage/:id", to: "matchmaker#clicked_yes", as: "yes"
  get "homepage/:id", to: "matchmaker#clicked_no", as: "no"
  get "homepage/current_user/edit", to: "users#edit", as: "current_user_edit"
  patch "homepage/current_user/edit", to: "users#update"
end
