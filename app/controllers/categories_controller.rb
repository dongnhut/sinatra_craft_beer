class CategoriesController < Sinatra::Base

  get '/' do
    @categories = Category.all
  end

  post '/' do
    # require 'pry'
    # binding.pry
    begin
      category = Category.new({ name: "#{ params['name'] }" })
      category.save!
      #successfully
      "<h1> created </h1>"
    rescue
      'errors'
      # errors
    end
  end

end
