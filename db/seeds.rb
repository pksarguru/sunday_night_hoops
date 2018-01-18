require "faker"

Person.destroy_all

10.times do |x|
  Person.create(
    name: Faker::Name.name,
    email: Faker::Internet.email
  )
end
