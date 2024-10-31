require 'faker'

puts 'creating restaurants...'
10.times do
  # restaurant = Restaurant.new(
  #   name: Faker::Restaurant.name,
  #   city: Faker::Address.city
  # )
  # restaurant.save!
  Restaurant.create!(
    name: Faker::Restaurant.name,
    city: Faker::Address.city
  )
end
puts 'all done!'
