source 'https://rubygems.org'

ruby '3.4.3'

gem 'activerecord-import'
gem 'csv' # Ruby v3.4.0 以降は組み込みの gem ではなくなったので明示的に指定する必要がある
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
