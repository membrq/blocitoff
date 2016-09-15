require 'faker'

5.times do
  User.create!(
  name: Faker::Internet.user_name,
  email: Faker::Internet.email,
  password: Faker::Internet.password(8)
  )
end
users = User.all

10.times do
  Item.create!(
  user: users.sample,
  name: Faker::Beer.name
  )
end
items = Item.all

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Item.count} items created"
