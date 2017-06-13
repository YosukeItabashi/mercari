Rails.application.routes.draw do
  root 'users#index'
  devise_for :users
  get   'users/:id'   =>  'users#show'
  resources :items do
    collection do
      post ':id/purchase' => 'items#purchase'
      get 'saled' => 'items#saled'
      get 'bought' => 'items#bought'
    end
  end
end
