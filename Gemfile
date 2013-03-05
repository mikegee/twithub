source 'https://rubygems.org'

gem 'rails'

gem 'sqlite3', group: [:test, :development]
gem 'pg',      group: [:production, :staging]

gem 'bootstrap-sass'
gem 'foreman'
gem 'haml'
gem 'jquery-rails'
gem 'omniauth-github'
gem 'sass-rails'
gem 'simple_form'
gem 'thin'

group :development do
  gem 'guard-rspec'
  gem 'rb-fsevent', require: false
end

group :test do
  gem 'capybara'
  gem 'launchy'
  gem 'shoulda-matchers'
end

group :test, :development do
  gem 'factory_girl_rails'
  gem 'haml-rails'
  gem 'rspec-rails'
end

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end
