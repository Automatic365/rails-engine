source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 4.3', '>= 4.3.9'
gem 'sass-rails', '~> 6.0', '>= 6.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'

gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'unicorn'
gem 'figaro'
gem 'faraday'
gem 'responders'
gem 'table_print'
gem 'spring'
gem 'faker'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'capybara'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'database_cleaner'
  gem 'factory_girl_rails', "~> 4.0"
  gem 'simplecov', require: false
  gem 'pry-rails'
end

group :production do
  gem 'rails_12factor'
end

group :test do
  gem 'vcr'
  gem 'webmock'
end


group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
