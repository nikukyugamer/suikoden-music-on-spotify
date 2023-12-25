source 'https://rubygems.org'

ruby '3.3.0'

gem 'activerecord-import'
gem 'dotenv-rails'
gem 'puma'
gem 'rails'
gem 'rspotify'
gem 'sprockets-rails'
gem 'sqlite3'

group :development do
  gem 'rails-erd'
end

group :development, :test do
  gem 'debug', platforms: %i[mri windows]
  gem 'rubocop-rails', require: false
end

group :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails', require: false
end
