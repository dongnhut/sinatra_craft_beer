# Bundler
require 'rubygems'
require 'bundler/setup'

#sinatra
require 'sinatra/base'
require 'sinatra/activerecord'


require 'require_all'
require_all './app'

# require "app/controllers/categories_controller.rb"
map('/categories') { run CategoriesController }
