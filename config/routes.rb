Rails.application.routes.draw do

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'

  resources :locations
  resources :reagent_uses
  resources :reagents
  resources :reagents, only: [:show] do
    resources :reagent_uses
  end
  resources :users
  resources :labs
  resources :labs, only: [:show] do
    resources :reagents
    resources :locations
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
