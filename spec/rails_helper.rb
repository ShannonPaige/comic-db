ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'database_cleaner'
require 'simplecov'

SimpleCov.start "rails"

Dir["#{Rails.root}/app/models/**/*.rb"].each do |model|
  load model
end

RSpec.configure do |config|
  config.include Capybara::DSL

  DatabaseCleaner[:neo4j,
                  connection: { type: :server_db,
                                path: 'http://localhost:7475'}]
                  .strategy = :transaction  #for transaction strategy

  config.before(:suite) do
    DatabaseCleaner.clean
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end
