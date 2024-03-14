# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'bootsnap', require: false
gem 'bootstrap'
gem 'devise'
gem 'faker'
gem 'importmap-rails'
gem 'jbuilder'
gem 'mini_racer'
gem 'pagy'
gem 'pg', '~> 1.1'
gem 'puma', '~> 6.0'
gem 'pundit'
gem 'rails', '~> 7.1.2'
gem 'ransack'
gem 'redis', '~> 4.0'
gem 'rubocop'
gem 'sassc'
gem 'sassc-rails'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'database_cleaner'
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails'
  gem 'shoulda-matchers'
end

group :development do
  gem 'web-console'
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
end
