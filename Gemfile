# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.1"

gem "rails", "~> 6.0.3", ">= 6.0.3.2"
gem "puma", "~> 4.1"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 4.0"
gem "turbolinks", "~> 5"
gem "jbuilder", "~> 2.7"
gem "bootsnap", ">= 1.4.2", require: false

# not default
gem "slim-rails"
gem "pg"
gem "rails-i18n"
gem "devise"
gem "devise-i18n"
gem "chartkick"
gem "groupdate"
gem "google-api-client", "~> 0.34", require: "google/apis/customsearch_v1"
gem "hanmoto"
gem "rinku"

group :development, :test do
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "factory_bot_rails"
  gem "webmock"
end

group :development do
  gem "web-console", ">= 3.3.0"
  gem "listen", "~> 3.2"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "rubocop", require: false
  gem "rubocop-performance"
  gem "rubocop-rails"
  gem "rubocop-rspec"
  gem "awesome_print"
  gem "brakeman", require: false
end

group :test do
  gem "capybara", ">= 2.15"
  gem "selenium-webdriver"
  gem "webdrivers"
  gem "rspec-rails", "~> 4.0.0"
end
