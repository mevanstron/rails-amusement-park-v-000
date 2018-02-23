Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:create]
  resources :attractions, only: [:index, :show, :new, :create, :edit, :update]
  resources :rides, only: [:create]

  root 'welcome#home'
  get 'signin' => 'sessions#new', as: 'new_session'
  get 'logout' => 'sessions#destroy', as: 'logout'

end
