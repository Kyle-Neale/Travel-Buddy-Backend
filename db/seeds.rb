require 'faker'

10.times do
  User.create(full_name: Faker::Name.unique.name, password_digest: Faker::Internet.password)
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
