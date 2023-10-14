source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "cssbundling-rails"
gem "devise"
gem "devise-jwt"
gem "haml-rails", "~> 2.0"
gem "paper_trail"
gem "pg", "~> 1.4", ">= 1.4.4"
gem "prettier"
gem "puma", ">= 5.0"
gem "rails", github: "rails/rails", branch: "main"
gem "tzinfo-data", platforms: %i[windows jruby]
gem "rack-cors"

group :development, :test do
  gem "awesome_print"
  gem "pry"
  gem "debug", platforms: %i[mri windows]
  gem "faker"
  gem "annotate"
  gem "shoulda-matchers", "~> 5.0"
end

group :test do
  gem "rspec-rails"
  gem "factory_bot_rails"
end
