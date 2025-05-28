# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem "bootsnap", require: false
gem 'pg', '~> 1.5', '>= 1.5.9'
gem "puma", '>= 5.0'
gem 'rails', '~> 8.0.1'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :development, :test do
  gem 'database_cleaner', '~> 2.1'
  gem 'debug', platforms: %i[mri windows]
  gem 'factory_bot_rails', '~> 6.4', '>= 6.4.4'
  gem 'pry-byebug', '~> 3.11'
  gem 'rspec-rails', '~> 8.0'
  gem 'shoulda-matchers', '~> 6.5'
end

group :development do
end

group :test do
  gem 'simplecov', require: false
end
