# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CollectibleAttribute.destroy_all
Collectible.destroy_all
Collection.destroy_all

fish_collection = Collection.create(title: "Fish")
first_fish = fish_collection.collectibles.create()
first_fish.collectible_attributes.create(name: "Checkbox", value: "Checked")
first_fish.collectible_attributes.create(name: "Name", value: "Shark")
first_fish.collectible_attributes.create(name: "Time", value: "6:00pm - 8:00pm")
first_fish.collectible_attributes.create(name: "Month Range", value: "August")
first_fish.collectible_attributes.create(name: "Location", value: "Mountains for some reason")
first_fish.collectible_attributes.create(name: "Size", value: "Shark sized")
first_fish.collectible_attributes.create(name: "Rarity", value: "Very rary")
first_fish.collectible_attributes.create(name: "Value", value: "10000000 bells")

Collection.create(title: "Bugs")
Collection.find_by(title: "Bugs").collectibles.create().collectible_attributes.create(name: "rarity")

