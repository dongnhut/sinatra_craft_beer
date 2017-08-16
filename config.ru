# Bundler
require 'rubygems'
require 'bundler/setup'

#sinatra
require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/flash'
require 'bcrypt'


require 'require_all'
require_all './app'

# categories route
# require "app/controllers/categories_controller.rb"
map('/categories') { run CategoriesController }
map('/admin/categories') { run Admin::CategoriesController }

# Beers route
map('/admin/beers') { run Admin::BeersController }
map('/admin') { run Admin::AdminController }
map('/admin/auth') { run Admin::AuthController }

# Set Asset Directory
map('/assets') { run Rack::Directory.new('./assets') }
