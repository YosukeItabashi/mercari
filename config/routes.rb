Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  get   'users/:id'   =>  'users#show'
  resources :items, only: [:index, :create, :show, :new] do
    collection do
      post ':id/purchase' => 'items#purchase'
    end
  end
end
