# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning DB 🧹"
Restaurant.destroy_all
Review.destroy_all

puts "Generating Seed 🌱"

50.times do |index|
  Restaurant.create(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::Number.number(digits: 8),
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample
  )

  Review.create(
    content: Faker::Restaurant.review,
    rating: rand(0..5),
    restaurant_id: index + 1
  )
end

puts "Completed"
