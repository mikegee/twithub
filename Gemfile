source 'https://rubygems.org'

gem 'rails'

gem 'sqlite3', group: [:test, :development]
gem 'pg',      group: [:production, :staging]

gem 'foreman'
gem 'jquery-rails'
gem 'omniauth-github'
gem 'thin'

group :development do
  gem 'guard-rspec'
  gem 'rb-fsevent'
end

group :test, :development do
  gem 'rspec-rails'
end

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end
