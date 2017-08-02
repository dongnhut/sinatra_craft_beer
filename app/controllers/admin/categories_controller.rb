module Admin
  class CategoriesController < ApplicationController

    get '/' do
      # require 'pry'
      # binding.pry
      categories = Category.all
      erb :'categories/index',
          :locals => { :categories => categories },
          :layout => :admin_layout
    end

    post '/' do
      # require 'pry'
      # binding.pry
      begin
        category = Category.new(name: params['name'].to_s)
        category.save!
        # successfully
        '<h1> created </h1>'
      rescue
        'errors'
        # errors
      end
    end
  end
end
