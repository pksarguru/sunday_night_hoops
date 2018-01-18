source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'coffee-rails', '~> 4.2'
gem "faker"
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem "pg", "~> 0.18"
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.1'
gem 'sass-rails', '~> 5.0'
gem "starter_generators", :git => "https://github.com/raghubetina/starter_generators"
gem 'turbolinks', '~> 5'
gem 'uglifier', '>= 1.3.0'

group :development, :test do

  gem 'byebug', platform: :mri
end

group :development do
  gem "annotate"
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem "pry-rails", "~> 0.3.4"
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :production do
  gem "rails_12factor"
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
