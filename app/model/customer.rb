require 'sinatra/activerecord'

class Customer < ActiveRecord::Base

  has_many :beers

end
