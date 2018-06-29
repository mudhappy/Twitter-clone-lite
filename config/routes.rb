Rails.application.routes.draw do
  root 'tweets#index'

  devise_for :users
  resources :users, only: [:show]
  resources :tweets

  get 'hashtags/:name', to: 'hashtags#show'

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end
end
