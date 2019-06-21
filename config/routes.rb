Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "homepage/messages", to: "users#messages", as: "messages"
  get "homepage/new_message", to: "users#new_message", as: "new_message"
  post "homepage/new_message/:id", to: "users#new_message", as: "direct_message"
  post "homepage/messages", to: "users#send_message", as: "send_message"
  resources :users, only: :show
  resources :matchmaker, only: :index
  get "homepage", to: "users#homepage", as: "homepage"
  get "login", to: "sessions#login", as: "login"
  get "signup", to: "users#new", as: "signup"
  post "signup", to: "users#create"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: "logout"
  delete "homepage/delete", to: "users#destroy", as: "delete_account"
  get "matchmaker/:id", to: "matchmaker#clicked_yes", as: "yes"
  get "matchmaker/:id", to: "matchmaker#clicked_no", as: "no"
  post "users/:id", to: "users#liked", as: "liked"
  get "homepage/edit", to: "users#edit", as: "current_user_edit"
  patch "homepage/edit", to: "users#update"


end
