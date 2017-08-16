require 'bcrypt'

task :cadmin do
  admin = Admin.new(
    :name => 'Superadmin',
    :username => 'concaloc',
    :email => 'concaloc.khotao@example.com',
    :password => BCrypt::Password.create('123456').to_s
  )
  admin.save!
end
