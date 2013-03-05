Twithub::Application.routes.draw do
  get '/test' => ->(env) { [200, {}, ['<h1>It Works!</h1>']] }
end
