Rails.application.routes.draw do
  # Users
  devise_for :users

  # Tweet
  root 'tweets#index'
  resources :tweets

  # Hashtags
  get 'hashtags/:name', to: 'hashtags#show'

  # User
  get '/:id', to: 'users#show', as: 'user'
end
