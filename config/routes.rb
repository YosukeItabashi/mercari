Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  get   'users/:id'   =>  'users#show'
  resources :items, only: [:show, :new]
end
