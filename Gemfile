source 'https://rubygems.org'

# Core Rails and related gems
gem 'rails', '~> 8.0'
gem 'sprockets-rails'
gem 'sqlite3', '>= 1.4'
gem 'puma', '>= 5.0'

# JavaScript, CSS, and Turbo-related gems
gem 'jsbundling-rails'
gem 'cssbundling-rails'
gem 'turbo-rails'
gem 'stimulus-rails'

# Miscellaneous utilities for Rails
gem 'jbuilder'
gem 'tzinfo-data', platforms: %i[windows jruby]
gem 'bootsnap', require: false
gem 'devise'

# Pagination
gem 'kaminari'

# Charts
gem 'chartkick'

# Jobs and storage
gem 'sidekiq', require: 'sidekiq/web'
gem 'redis', '~> 4.0'


group :development, :test do
  gem 'debug', platforms: %i[mri windows], require: 'debug/prelude'
  gem 'brakeman', require: false
  gem 'rubocop-rails-omakase', require: false
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'rubocop-rails', require: false
  gem 'rubocop-rspec', require: false
  gem 'shoulda-matchers'
  gem 'letter_opener'
end

group :development do
  gem 'web-console'
end
