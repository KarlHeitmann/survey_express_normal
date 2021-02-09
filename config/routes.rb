Rails.application.routes.draw do
  resources :room_messages
  resources :rooms
  devise_for :users
  get 'dashboard/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'dashboard#home'
end
