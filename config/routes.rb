Rails.application.routes.draw do
  get 'admins/new'
  get 'log_out' => 'people/sessions#destroy', :as => 'log_out'
  get 'log_in' => 'people/sessions#new', :as => 'log_in'
  get 'sign_up' => 'people/users#new', :as => 'sign_up'
  get 'sessions/new'
  get 'chao/index'

  namespace :admin do
    resources :products 
  end
  namespace :people do
    resources :products
  end
  namespace :people do
    resources :users
  end
  namespace :people do
    resources :sessions
  end
  
  resources :products do
    collection do
      get :search
    end
  end

  resources :categories
  resources :sessions
  resources :admins

  root 'products#index'
end
