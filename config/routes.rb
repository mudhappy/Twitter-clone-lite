Rails.application.routes.draw do
  # Users
  devise_for :users

  # Tweet
  root 'tweets#index'
  get 'tweets/:random_string_id', to: 'tweets#show', as: :tweet
  resources :tweets, except: [:show]

  # Hashtags
  get 'hashtags/:name', to: 'hashtags#show'

  # User
  get '/:id', to: 'users#show', as: 'user'
end
