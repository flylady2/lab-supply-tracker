Rails.application.routes.draw do
  resources :locations
  resources :reagent_uses
  resources :reagents
  resources :users
  resources :labs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
