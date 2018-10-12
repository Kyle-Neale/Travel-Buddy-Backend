eric = User.create(first_name: 'Eric', last_name: 'Kim')
kyle = User.create(first_name: 'Kyle', last_name: 'Neale')
my_first_friend = Friendship.create(user: eric, friend: kyle)

dumbo = Place.create(name: "Dumbo")
we_work = Spot.create(place: dumbo, name: "WeWork", address: "81st Prospect Street", phone_number: 6464259124)
we_work2 = Spot.create(place: dumbo, name: "WeWork2", address: "81st Prospect Street", phone_number: 6464259124)

UserSpot.create(user: eric, spot: we_work)
UserSpot.create(user: eric, spot: we_work2)


Comment.create(text: 'I love my job! It doesn\'t suck.', user: eric, spot: we_work)
