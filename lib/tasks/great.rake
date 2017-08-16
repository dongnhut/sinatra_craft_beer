require 'faker'
# Faker create category
task :great do
  10.times { |i|
    Category.create(name: Faker::Commerce.product_name)
  }
end
