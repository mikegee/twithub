Twithub::Application.routes.draw do

  get '/auth/:provider/callback', to: 'sessions#create'

  root to: 'statuses#index'

end
