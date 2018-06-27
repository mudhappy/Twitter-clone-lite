Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  resources :tweets

  devise_scope :user do
    get 'login', to: 'devise/sessions#new'
  end

  root 'tweets#index'
end
