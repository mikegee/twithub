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
  gem 'rb-fsevent', require: false
end

group :test do
  gem 'capybara'
end

group :test, :development do
  gem 'rspec-rails'
end

group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'
  gem 'uglifier'
end


__END__
gem 'bootstrap-sass'
gem 'cancan'
gem 'haml'
gem 'jquery-rails'
gem 'simple_form'

group :development, :test do
  gem 'factory_girl_rails'
  gem 'haml-rails'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'quiet_assets'
end
