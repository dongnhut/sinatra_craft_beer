require 'faker'

task :great do
  10.times { |i|
    Category.create(name: Faker::Commerce.product_name)
  }
end
