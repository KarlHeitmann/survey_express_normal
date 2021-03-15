Rails.application.routes.draw do
  get 'alternatives/count'
  resources :room_messages
  resources :rooms do
    resources :surveys, only: [:index, :new, :create, :show] do
      post 'alternatives', to: 'alternatives#vote'
    end
  end
  devise_for :users
  get 'dashboard/home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root to: 'dashboard#home'
  root to: 'rooms#index'
end
