Twithub::Application.routes.draw do

  root to: 'statuses#index'

  match '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :statuses, only: [:index, :create]

  resources :users, only: [] do
    resources :favorites,  only: [:index, :create, :destroy]
    resources :followings, only: [:index, :create, :destroy]

    get :search, on: :collection
  end

end
