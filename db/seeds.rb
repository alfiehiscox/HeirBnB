# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

puts "Destroying All Castles..."
Castle.destroy_all
puts "Destroying All Users..."
User.destroy_all

puts "Creating Users..."
5.times do
  user = User.new
  user.email = Faker::Internet.email
  user.password = "password"
  user.password_confirmation = "password"
  user.save
  puts "User Created"
end

puts "Creating Castles..."
prefixes = ["Castle ", "Fort ", "Keep ", "Chateau ", "Tower ", 'Palace ']
15.times do
  castle = Castle.new
  castle.name = "#{prefixes.sample}#{Faker::Artist.name}"
  castle.address = "#{Faker::Address.street_address}, #{Faker::Address.city}"
  users = User.all
  castle.user = User.find(users.sample.id)
  castle.price_per_night = rand(1..1000)
  castle.save
  puts "Castle Created"
end
