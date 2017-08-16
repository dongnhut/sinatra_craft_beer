
task :greet do
  # Category.all.each{|c| puts c.name }
  10.times{ |i|
    Category.create(name: "category #{i}")
    puts i
  }
end
