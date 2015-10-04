Rails.application.routes.draw do
  root 'galleries#index'
  devise_for :users

  resources :galleries, except: [:show, :destroy]

  resources :images, except: [:index]

  resources :comments, except: [:index, :show]

  resources :users, only: [:index, :update, :destroy]
end
