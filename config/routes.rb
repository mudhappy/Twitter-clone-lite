Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :tweets

  # get '/login', to: 'devise/sessions#new', as: :login
  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
end
