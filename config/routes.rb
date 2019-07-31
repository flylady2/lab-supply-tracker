Rails.application.routes.draw do

  resources :categories
  root 'sessions#welcome'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/auth/google_oauth2/callback' => 'sessions#oauth_login'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :categories
  resources :locations
  resources :reagent_uses
  resources :reagents
  resources :reagents, only: [:show] do
    resources :reagent_uses
  end
  resources :users
  resources :labs
  resources :labs, only: [:show] do
    get 'reagents/request' => 'reagents#request'
    resources :reagents
    resources :categories
    resources :locations
    resources :reagent_uses
    resources :users
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
