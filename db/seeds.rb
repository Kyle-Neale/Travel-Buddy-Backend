require 'faker'

User.create(full_name: "Kyle Neale", password: "123123", username: "kyleneale", email: "kyle@gmail.com")

10.times do
  User.create(full_name: Faker::Name.unique.name, password: Faker::Internet.password)
end

10.times do
  Place.create(name: Faker::Restaurant.name, address: Faker::Address.full_address, phone_number: Faker::PhoneNumber.cell_phone, lat: Faker::Address.latitude, lng: Faker::Address.longitude)
end

User.all.each do |user|
  user.update(
    username: Faker::Internet.username(user.full_name),
    email: Faker::Internet.free_email(user.full_name)
  )
  user.save
end

11.times do
  Friendship.create(user: User.all.sample, friend: User.all.sample, accepted: true)
end

20.times do
  Spot.create(user: User.all.sample, place: Place.all.sample, spot_type: "Dinner", source: nil)
end

15.times do
  Comment.create(text: Faker::Lorem.paragraph(3, true, 6), spot: Spot.all.sample, user: User.all.sample)
end
