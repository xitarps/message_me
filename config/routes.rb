Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'chatroom#index'
  #get 'login', to: 'sessions#index'


  get "signup", to: "users#new"
  post "signup", to: "users#create"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

  delete "signout", to: "sessions#destroy"

  patch "signup", to: "users#update"
  get 'user/:id', to: 'users#show', as: :users
  get 'user/:id/edit', to: 'users#edit', as: :edit_user

  post 'message', to: 'messages#create'

  # action cable - websockets
  mount ActionCable.server, at: '/cable'

end
