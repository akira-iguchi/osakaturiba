source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3.4'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sassc-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 5.0.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
# gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'bcrypt_pbkdf'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'capistrano', '~> 3.4.1'
  gem 'capistrano-bundler'
  gem 'capistrano-faster-assets'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'ed25519'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'guard-rspec', require: false
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'vcr'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'web-console', '>= 3.3.0'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy', '~> 2.4.2'
  gem 'selenium-webdriver'
end

group :production do
  gem 'fog-aws'
  gem 'pg', '0.20.0'
end

group :production, :staging do
  gem 'unicorn'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'carrierwave'
gem 'devise'
gem 'dotenv-rails'
gem 'gmaps4rails'
gem 'gon'
gem 'i18n-js'
gem 'jquery-rails'
gem 'kaminari'
gem 'mini_magick'
gem 'pry-byebug', group: :development
gem 'rails-i18n', '~> 6.0.0'
gem 'rake', '< 11.0'
gem 'rb-readline'
gem 'simple_calendar', '~> 2.0'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]