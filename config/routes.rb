Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  post '/guest', to: 'guest_sessions#create'

  get 'signup', to: 'users#new'

  resources :users, only: %i[show new create edit update] do
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
