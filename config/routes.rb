Rails.application.routes.draw do


  root 'sessions#welcome'

  get '/login' => 'sessions#new', as: 'login'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  get '/auth/google_oauth2/callback' => 'sessions#oauth_login'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get 'most_active_user' => 'users#most_active_user'
  get 'most_active_lab_member' => 'users#most_active_lab_member'
  get 'most_used' => 'reagents#most_used'
  get 'most_used_lab_reagent' => 'reagents#most_used_lab_reagent'

  resources :categories, only: [:index]
  resources :locations, only: [:show]
  resources :reagent_uses
  resources :reagents
  resources :reagents, only: [:show] do
    resources :reagent_uses, only: [:new, :create, :show]
  end
  resources :users

  #resources :labs
  resources :labs do
    get 'reagents/ask' => 'reagents#ask'
    get 'admin' => 'labs#admin'
    resources :reagents, only: [:index, :new, :create, :show]
    resources :categories, only: [:index, :show]
    resources :locations, only: [:index, :new, :create]
    resources :reagent_uses, only: [:index]
    resources :users, only: [:index]
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
