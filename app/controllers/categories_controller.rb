class CategoriesController < ApiController

  get '/' do
    @categories = Category.all

    #response
    { data: @categories }.to_json
  end

  post '/' do
    # require 'pry'
    # binding.pry
    begin
      category = Category.new({ name: "#{ params['name'] }" })
      category.save!
      { data: "successfully" }.to_json
    rescue
      { data: "errors" }.to_json
    end
  end

end
