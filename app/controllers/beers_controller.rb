class BeersController < ApiController
  get '/' do
    @beers = Beer.all
    # response
    # { data: @categories }.to_json
    # { data: @categories.as_json(only: %i[id name]) }.to_json
    # { data: @categories.as_json(except: %i[id name]) }.to_json
    # { data: @categories.map
    # { |category| CategorySerializer.new(category) } }.to_json
    # json @categories, each_serializer: Categories::IndexSerializer, root: 'data'
  end

  post '/' do
    # require 'pry'
    # binding.pry
    begin
      beer = Beer.new({ name: " #{params['name']} ", category_id: " #{params['category_id']}" })
      beer.save!
      # successfully
      '<h1> created </h1>'
    rescue
      'errors'
      # errors
    end
  end
end
