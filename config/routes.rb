Rails.application.routes.draw do
  get 'admins/new'
  get 'log_out' => 'sessions#destroy', :as => 'log_out'
  get 'log_in' => 'sessions#new', :as => 'log_in'
  get 'sign_up' => 'users#new', :as => 'sign_up'
  get 'sessions/new'
  get 'chao/index'
  resources :products do
    collection do
      get :search
    end
  end
  resources :categories
  resources :users
  resources :sessions
  resources :admins
  root 'products#index'
end
