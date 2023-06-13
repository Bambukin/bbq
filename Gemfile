source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.1'

gem 'aws-sdk-s3'
gem 'rails', '~> 7.0.4', '>= 7.0.4.3'
gem 'sprockets-rails'
gem 'pg'
gem 'puma', '~> 5.0'
gem 'jsbundling-rails'
gem 'turbo-rails'
gem 'stimulus-rails'
gem 'cssbundling-rails'
gem 'email_validator'
gem 'pundit'
gem "image_processing", ">= 1.2"
gem 'activestorage-validator'
gem 'mailjet'

gem 'devise'
gem 'devise-i18n'
gem 'rails-i18n'


group :development, :test do
  gem 'debug', platforms: %i[ mri mingw x64_mingw ]
  gem "letter_opener"
  gem 'rspec-rails'
end

group :development do
  gem 'capistrano'
  gem 'capistrano-rails'
  gem 'capistrano-passenger'
  gem 'capistrano-rbenv'
  gem 'capistrano-bundler'
  gem 'capistrano-yarn'
  gem 'ed25519', '~> 1.2'
  gem 'bcrypt_pbkdf', '~> 1.0'
  gem 'web-console'
end
