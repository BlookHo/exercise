source 'https://rubygems.org'

gem 'rails', '~> 5.0.1'
# Use postgresql as the database for Active Record
gem 'active_model_serializers'
gem 'activerecord-reset-pk-sequence'
gem 'pg', '~> 0.18'

# Use Puma as the app server
gem 'puma', '~> 3.0'

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS),
# making cross-origin AJAX possible
gem 'rack-cors'

gem 'redcarpet'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution
  gem 'byebug', platform: :mri

  gem 'better_errors'
  gem 'binding_of_caller'

  gem 'guard'
  gem 'guard-bundler', require: false
  gem 'guard-rspec', require: false

  gem 'rspec-rails', '~> 3.5' # , :github => 'rspec/rspec-rails'
  gem 'rails-controller-testing'

  # Checks ruby code grammar
  gem 'rubocop', require: false
  # With rspec
  gem 'rubocop-rspec'
  # With guard
  gem 'guard-rubocop'
end

group :test do
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'database_cleaner'
  # gem 'simplecov', :require => false
end

group :coverage do
  gem 'simplecov', :require => false
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
