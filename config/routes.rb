Rails.application.routes.draw do
  root 'galleries#index'
  devise_for :users

  resources :galleries, except: [:show, :destroy] do
    resources :images, only: [:show]
  end

  resources :images, except: [:index, :show]

  resources :comments, except: [:index, :show]

  resources :users, only: [:index, :update, :destroy]
end
