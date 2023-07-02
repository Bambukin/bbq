source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'

gem 'activestorage-validator'
gem 'aws-sdk-s3'
gem 'cssbundling-rails'
gem 'email_validator'
gem 'image_processing', '>= 1.2'
gem 'jsbundling-rails'
gem 'mailjet'
gem 'pg'
gem 'puma', '~> 5.0'
gem 'pundit'
gem 'rails', '~> 7.0.4', '>= 7.0.4.3'
gem 'resque'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'

gem 'omniauth'
gem 'omniauth-github'
gem 'omniauth-rails_csrf_protection'
gem 'omniauth-vkontakte'

gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'letter_opener'
  gem 'rspec-rails'
  gem 'rubocop', require: false
end

group :development do
  gem 'bcrypt_pbkdf', '~> 1.0'
  gem 'capistrano'
  gem 'capistrano-bundler'
  gem 'capistrano-passenger'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano-resque', require: false
  gem 'capistrano-yarn'
  gem 'ed25519', '~> 1.2'
  gem 'web-console'
end
