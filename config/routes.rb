Rails.application.routes.draw do


  root 'sessions#welcome'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/auth/google_oauth2/callback' => 'sessions#oauth_login'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  resources :categories, only: [:index]
  resources :locations, only: [:show]
  resources :reagent_uses
  resources :reagents
  resources :reagents, only: [:show] do
    resources :reagent_uses, only: [:new, :create]
  end
  resources :users
  #resources :labs
  resources :labs do
    get 'reagents/ask' => 'reagents#ask'
    get 'admin' => 'labs#admin'
    resources :reagents, only: [:index, :new, :create]
    resources :categories, only: [:index, :show]
    resources :locations, only: [:index, :new, :create]
    resources :reagent_uses, only: [:index]
    resources :users, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
