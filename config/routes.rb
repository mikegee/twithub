Twithub::Application.routes.draw do

  root to: 'statuses#index'

  match '/auth/:provider/callback', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

end
