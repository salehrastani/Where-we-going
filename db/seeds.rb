
require 'faker'

3.times do
  user = User.new(username: Faker::Internet.user_name, password: Faker::Lorem.word, name: Faker::Name.name)
  user.save
end


User.all.each do |user|
  user.events.create(title: Faker::Name.title, )
end

Event.all.each do |event|
  2.times do
    event.options.create(name: Faker::Name.first_name, location: Faker::Address.street_address)
  end
end

Option.all.each do |option|
  3.times do
    option.votes.create(user_id: rand(1..3), event_id: rand(1..3))
  end
end

