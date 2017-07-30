require 'sinatra/activerecord'
class Category < ActiveRecord::Base

  has_many :beers

end
