# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma'
gem 'rails'
gem 'sass-rails', '~> 5.0'

gem 'prawn'
gem 'prawn-table'

group :development, :test do
  gem 'pry'
end

group :development do
  gem 'listen'
  gem 'rubocop'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'pdf-inspector', require: 'pdf/inspector'
  gem 'selenium-webdriver'
end
