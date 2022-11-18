# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


user1 = User.create!(username: 'scgavin122', password: 'baseball12' )
user2 = User.create!(username: 'charmander', password: 'password' )

sub1 = Sub.create(title: 'fav pokemon' , description: 'idk, there are over 150', moderator_id: 1 )
sub2 = Sub.create(title: 'videogames' , description: 'No time', moderator_id: 2 )

