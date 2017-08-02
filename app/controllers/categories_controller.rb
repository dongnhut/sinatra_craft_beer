class CategoriesController < ApiController

  get '/' do
    @categories = Category.all
    { data: @categories }.to_json
  end

  post '/' do
    # require 'pry'
    # binding.pry
    begin
      category = Category.new({ name: "#{ params['name'] }" })
      category.save!
      { data: category }.to_json
    rescue
      { errors: 'create_failed' }.to_json
    end
  end

end
