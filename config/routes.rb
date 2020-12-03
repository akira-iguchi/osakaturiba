Rails.application.routes.draw do
  root to: 'toppages#index'
  
  devise_for :users, controllers: {
    registrations: "users/registrations",
  }

  resources :users, only: [:show] do
    resources :comments, only: [:destroy]
    member do
      get :likes
    end
    collection do
      get :search
    end
  end

  resources :districts, only: [:show]

  resources :spots, only: [:show] do
    resources :comments, only: %i[create destroy] do
    end
  end

  get 'spot_search', to: 'spots#search'

  resources :favorites, only: %i[create destroy]
end
