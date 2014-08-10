Bundler::Source::Rubygems.send(:remove_const, :API_REQUEST_LIMIT)
Bundler::Source::Rubygems::API_REQUEST_LIMIT = 1000

source 'https://rubygems.org'

gem 'rails', '4.1.4'
gem 'pg'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'
gem 'nokogiri'
gem 'sidekiq'
gem 'sinatra', require: false
gem 'slim'
gem 'foreigner'

group :test, :development do
  gem 'rspec-rails'
  gem 'guard-rspec', require: false
end

group :development do
  gem 'zeus'
  gem 'thin'
  gem 'rack-mini-profiler', require: false
  gem 'annotate'
  gem 'quiet_assets'
end

group :test do
  gem 'webmock'
  gem 'rspec-collection_matchers'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem "factory_girl_rails", "~> 4.0"
  gem "rspec-sidekiq", github: 'philostler/rspec-sidekiq', branch: '2-0-0'
end
