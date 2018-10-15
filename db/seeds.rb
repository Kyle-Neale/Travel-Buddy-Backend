require 'faker'

10.times do
  User.create(full_name: Faker::Name.unique.name, password_digest: Faker::Internet.password, email: Faker::Internet.email)
end

User.all.each do |user|
  user.update(username: Faker::Internet.username(user.full_name))
  user.save
end
