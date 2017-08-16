require 'faker'

task :beer do
  10.times { |i|
    Beer.create(
      name: Faker::Beer.name,
      category_id: Random.new.rand(25..34),
      manufacturer: Faker::Company.name,
      country: Faker::Address.state + ', ' + Faker::Address.country,
      price: Faker::Commerce.price,
      description: 'Style: ' + Faker::Beer.style + ', hop:' + Faker::Beer.style + ', yeast:' + Faker::Beer.yeast + ', ibu: ' + Faker::Beer.ibu + ', alcohol: ' + Faker::Beer.alcohol,
    )
  }
end
