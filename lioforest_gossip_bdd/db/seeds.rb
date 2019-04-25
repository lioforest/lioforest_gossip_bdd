# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
City.destroy_all
User.destroy_all
Gossip.destroy_all
Tag.destroy_all


10.times do
	c = City.create(name: Faker::TvShows::GameOfThrones.city, zip_code: Faker::Address.zip_code)
	puts "City #{c.name}"
end
	puts "----------------------"

10.times do
	u = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.name, description: Faker::Movies::StarWars.wookiee_sentence, age: rand(2..99), email: Faker::Internet.email, city: City.all.sample)
	puts "User #{u.first_name}"
end
	puts "----------------------"

20.times do
	g = Gossip.create(title: Faker::Superhero.descriptor, content: Faker::Lorem.paragraphs(4), date: Faker::Date.backward(15), user: User.all.sample)
	puts "Gossip #{g.title}"
end
	puts "----------------------"


10.times do
	t= Tag.create(title: Faker::Cannabis)
	puts "Tag #{t.title}"
end
	puts "----------------------"

# Au moins un tag par potin
Gossip.all.each do |gos|
	gos.tags << Tag.all.sample
	puts "Ajout d'un tag à un potin"
end
	puts "----------------------"

