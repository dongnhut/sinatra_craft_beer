require 'sinatra/activerecord'

class Beer < ActiveRecord::Base

  belongs_to :category
  has_many :customers

end
