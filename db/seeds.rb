# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'faker'

# Creating 100 fake restaurants
10.times do
  space = Space.new({
    name: Faker::Company.name,
    address: "#{Faker::Address.street_address}, #{Faker::Address.city}",
    daily_price: Faker::Number.between(10, 20),
    weekly_price: Faker::Number.between(40, 90),
    description: Faker::Hipster.paragraph,
    has_food: Faker::Boolean.boolean,
    has_drink: Faker::Boolean.boolean,
    has_wifi: Faker::Boolean.boolean,
    phone_number: Faker::PhoneNumber.phone_number,
    max_people: Faker::Number.between(5, 50),
    lat: Faker::Address.latitude,
    lng: Faker::Address.longitude
  })
  space.save
end

10.times do
  user = User.new({
    email: Faker::Internet.free_email,
    password: 'valid_password',
    password_confirmation: 'valid_password',
  })
  user.save
end

