# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.2'

gem 'rails', github: 'rails/rails', branch: 'main'

gem 'active_model_serializers'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'cancancan'
gem 'cssbundling-rails'
gem 'devise'
gem 'devise-jwt'
gem 'dotenv-rails'
gem 'haml-rails', '~> 2.0'
gem 'paper_trail'
gem 'pg', '~> 1.4', '>= 1.4.4'
gem 'prettier'
gem 'puma', '>= 6.3.1'
gem 'rack-cors'
gem 'redis', '~> 4.0'
gem 'sidekiq'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  gem 'annotate'
  gem 'awesome_print'
  gem 'brakeman'
  gem 'bundler-audit', require: false
  gem 'debug', platforms: %i[mri windows]
  gem 'faker'
  gem 'pry-byebug'
  gem 'rspec_junit_formatter'
  gem 'rubocop', require: false
  gem 'rubycritic', require: false
  gem 'ruby-lsp', require: false
  gem 'shoulda-matchers', '~> 5.0'
  gem 'simplecov', require: false
end

group :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails'
end
