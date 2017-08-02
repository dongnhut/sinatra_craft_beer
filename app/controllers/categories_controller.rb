class CategoriesController < ApiController
  get '/' do
    @categories = Category.all
    # response
    # { data: @categories }.to_json
    # { data: @categories.as_json(only: %i[id name]) }.to_json
    # { data: @categories.as_json(except: %i[id name]) }.to_json
    { data: @categories.map { |category| CategorySerializer.new(category) } }.to_json
  end

  post '/' do
    # require 'pry'
    # binding.pry
    begin
      category = Category.new({ name: " #{params['name']} " })
      category.save!
      # successfully
      '<h1> created </h1>'
    rescue
      'errors'
      # errors
    end
  end
end
