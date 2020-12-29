Rails.application.routes.draw do
  root to: 'toppages#index'
  
  devise_for :users, controllers: {
    registrations: "users/registrations",
    sessions:      'users/sessions',
  }

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end

  resources :users, only: [:show] do
    resources :records, only: %i[index show create destroy]
    resources :comments, only: [:destroy]
    member do
      get :likes
    end
    collection do
      get :search
    end
  end
  
  resources :spots, only: [:show] do
    resources :comments, only: %i[create destroy] do
    end
  end
  
  get 'spot_search', to: 'spots#search'
  
  resources :districts, only: [:show]
  resources :fishing_types, only: [:index]
  resources :favorites, only: %i[create destroy]
end
