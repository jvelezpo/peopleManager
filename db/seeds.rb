# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


25.times do
  Person.create(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      job: Faker::Company.name,
      bio: Faker::Lorem.paragraph,
      gender: Faker::Number.between(0, 1),
      birthdate: Faker::Date.backward(10000),
      picture: Faker::Avatar.image
  )
end
