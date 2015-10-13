Rails.application.routes.draw do
  root 'galleries#show'

  devise_for :users
  resources :users, only: [:show]

  resources :galleries, only: [:index, :show] do
    resources :images, only: [:show]
  end

  resources :images, only: [:show, :new, :create] do
    resources :comments, only: [:create]
  end

  resources :themes, only: [:index, :create]

  resources :votes, only: [:create, :destroy]

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/sign_out', to: 'sessions#destroy'
end
