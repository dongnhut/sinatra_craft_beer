# Bundler
require 'rubygems'
require 'bundler/setup'

# sinatra
require 'sinatra'
require 'sinatra/json'
require 'sinatra/base'
require 'sinatra/activerecord'

require 'active_model_serializers'
require 'sinatra-active-model-serializers'

require 'require_all'
require_all './app'

# require "app/controllers/categories_controller.rb"
map('/categories') { run CategoriesController }
map('/beers') { run BeersController }
