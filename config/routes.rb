Rails.application.routes.draw do
  root 'galleries#index'
  devise_for :users
  resources :users, only: [:show]

  resources :galleries, except: [:show, :destroy] do
    resources :images, only: [:show]
  end

  resources :images, except: [:index]

  resources :comments, except: [:index, :show]

end
