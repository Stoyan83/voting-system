source "https://rubygems.org"

# Core Rails and related gems
gem 'rails', '~> 8.0'
gem "sprockets-rails"
gem "sqlite3", ">= 1.4"
gem "puma", ">= 5.0"

# JavaScript, CSS, and Turbo-related gems
gem "jsbundling-rails"
gem "cssbundling-rails"
gem "turbo-rails"
gem "stimulus-rails"

# Miscellaneous utilities for Rails
gem "jbuilder"
gem "tzinfo-data", platforms: %i[windows jruby]
gem "bootsnap", require: false
gem "devise"

group :development, :test do
  # Debugging, security, and linting gems
  gem "debug", platforms: %i[mri windows], require: "debug/prelude"
  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false
end

group :development do
  # Gems for console and error page debugging
  gem "web-console"
end
