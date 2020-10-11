Rails.application.routes.draw do
  root to: 'toppages#logout_top'
  
  get 'login_top', to: 'toppages#login_top' 
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :new, :create, :edit, :update] do
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
    resources :comments, only: [:create, :destroy] do 
    end
  end
  
  get 'spot_search', to: 'spots#search'
  
  resources :favorites, only: [:create, :destroy]
end