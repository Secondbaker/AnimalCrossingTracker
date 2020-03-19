# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Rarity.destroy_all
BellValue.destroy_all
TimeOfDay.destroy_all
TimeOfYear.destroy_all
CollectibleAttribute.destroy_all
Collectible.destroy_all
Collection.destroy_all

fish_collection = Collection.create(title: "Fish")
first_fish = fish_collection.collectibles.create(name: "Shark", thumbnail: "https://m.sharkclean.com/include/images/products/hero-ZU780WBKT.jpg", complete: false)
fish_one_atts = first_fish.collectible_attributes;
fish_one_atts.create(name: "Time", value: "6:00pm - 8:00pm")
fish_one_atts.create(name: "Month Range", value: "August")
fish_one_atts.create(name: "Location", value: "Mountains for some reason")
fish_one_atts.create(name: "Size", value: "Shark sized")
fish_one_atts.create(name: "Rarity", value: "Very rary")
fish_one_atts.create(name: "Value", value: "10000000 bells")

second_fish = fish_collection.collectibles.create(name: "Seahorse", thumbnail: "https://horseislove.com/wp-content/uploads/2018/11/can_horses_swim.jpg", complete: true)
fish_two_atts = second_fish.collectible_attributes;
fish_two_atts.create(name: "Time", value: "6:00pm - 8:00pm")
fish_two_atts.create(name: "Month Range", value: "August")
fish_two_atts.create(name: "Location", value: "Mountains for some reason")
fish_two_atts.create(name: "Size", value: "Seahorse sized")
fish_two_atts.create(name: "Rarity", value: "Very rary")
fish_two_atts.create(name: "Value", value: "10000000 bells")

Collection.create(title: "Bugs")
Collection.find_by(title: "Bugs").collectibles.create().collectible_attributes.create(name: "rarity")

Rarity.destroy_all
BellValue.destroy_all
TimeOfDay.destroy_all
TimeOfYear.destroy_all
CollectibleAttribute.destroy_all
Collectible.destroy_all
Collection.destroy_all