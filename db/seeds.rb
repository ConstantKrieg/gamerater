# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)



Publisher.create name: "Codemasters"
Genre.create name: "Sim"
Platform.create title: "PC"
Game.create name: "F1 2016", genre_id: Genre.first.id, publisher_id: Publisher.first.id