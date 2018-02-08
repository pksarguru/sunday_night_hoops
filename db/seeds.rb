require "faker"

Person.destroy_all

puts 'Generating people...'

10.times do |x|
  Person.create(
    full_name: Faker::Name.name,
    email: Faker::Internet.email
  )
end

puts 'Generating games...'

start_date = Date.today
end_date = Date.today + 3.months
hash_of_dates = (start_date..end_date).group_by(&:wday)
array_of_sundays = hash_of_dates[0]

array_of_sundays.each do |sunday_date|
  Game.create(
    cancelled: false,
    game_date: sunday_date
  )
end
