Rails.application.routes.draw do
  
  get 'alternatives/count'
  resources :room_messages do
    member do 
      post 'toggle_like'
    end
  end


  resources :rooms do
    resources :surveys, only: [:index, :new, :create, :show] do
      post 'alternatives', to: 'alternatives#vote'
      post 'alternatives/new', to: 'alternatives#add'
    end
  end
  match 'rooms/:id/chat', to: 'rooms#chat', via: :get, as: 'rooms_chat'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    confirmations: 'user/confirmations',
  }
  get 'profile', to: "users#edit"
  resources :users
  devise_scope :user do
    get 'close', to: 'users/sessions#close', as: 'close_session'
  end
  get 'dashboard/home'
  post 'dashboard/change'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  # root to: 'dashboard#home'
  root to: 'rooms#index'
  namespace :user do
    root :to => "rooms#index"
  end
end
