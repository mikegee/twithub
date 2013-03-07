Twithub::Application.routes.draw do

  root to: 'timeline#index'

  match '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :statuses, only: [:create]

  resources :users, only: [:show] do
    resources :statuses,   only: [:index]
    resources :favorites,  only: [:index, :create, :destroy]
    resources :follows,    only: [:create, :destroy]
    resources :followings, only: [:index]
    resources :followers,  only: [:index]

    get :search, on: :collection
  end

end
