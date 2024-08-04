Rails.application.routes.draw do
  get 'payments/new', to: 'payments#new', as: 'new_payment'
  post 'payments/create', to: 'payments#create', as: 'create_payment'
  root to: 'home#index'

  devise_for :users

  resources :events, only: [:index, :show, :new, :create, :edit, :update]

  get 'profile', to: 'profiles#show', as: 'profile'

    get 'events/:id/join', to: 'events#join', as: 'join_event'
end
