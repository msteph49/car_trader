ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
Bundler.require(:default, ENV['SINATRA_ENV'])

ActiveRecord::Base.establish_connection(
  :adapter => "sqlite3",
  :database => "db/#{ENV['SINATRA_ENV']}.sqlite"
)

require "carrierwave"
require "carrierwave/orm/activerecord"
require './config/secrets'
require './app/controllers/application_controller'
require_all './config/initializers'
require_all 'app'
