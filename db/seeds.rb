# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CollectibleAttribute.destroy_all

Rarity.destroy_all
BellValue.destroy_all
TimeOfDay.destroy_all
#TimeOfYear.destroy_all

Collectible.destroy_all
Collection.destroy_all

Month.destroy_all
Month.create(name: "January", number: 1)
Month.create(name: "February", number: 2)
Month.create(name: "March", number: 3)
Month.create(name: "April", number: 4)
Month.create(name: "May", number: 5)
Month.create(name: "June", number: 6)
Month.create(name: "July", number: 7)
Month.create(name: "August", number: 8)
Month.create(name: "September", number: 9)
Month.create(name: "October", number: 10)
Month.create(name: "November", number: 11)
Month.create(name: "December", number: 12)

rarity_type = CollectibleAttributeType.create(name: "Rarity")
bell_value_type = CollectibleAttributeType.create(name: "Bell Value")
time_of_day_type = CollectibleAttributeType.create(name: "Time of Day")

Rarity.create(value: 1)
BellValue.create(value: 154)
TimeOfDay.create(start: "8:00am", end: "8:00pm")

fish_collection = Collection.create(title: "Fish")
first_fish = fish_collection.collectibles.create(name: "Shark", thumbnail: "https://m.sharkclean.com/include/images/products/hero-ZU780WBKT.jpg", complete: false)
first_fish.collectible_attributes.create(collectible_attribute_value: Rarity.first, collectible_attribute_type: CollectibleAttributeType.first)
first_fish.collectible_attributes.create(collectible_attribute_value: BellValue.first, collectible_attribute_type: bell_value_type)
first_fish.collectible_attributes.create(collectible_attribute_value: TimeOfDay.first, collectible_attribute_type: time_of_day_type)
#fish_one_atts = first_fish.collectible_attributes;
#fish_one_atts.create(name: "Time", value: "6:00pm - 8:00pm")
#fish_one_atts.create(name: "Month Range", value: "August")
#fish_one_atts.create(name: "Location", value: "Mountains for some reason")
#fish_one_atts.create(name: "Size", value: "Shark sized")
#fish_one_atts.create(name: "Rarity", value: "Very rary")
#fish_one_atts.create(name: "Value", value: "10000000 bells")

second_fish = fish_collection.collectibles.create(name: "Seahorse", thumbnail: "https://horseislove.com/wp-content/uploads/2018/11/can_horses_swim.jpg", complete: true)
#fish_two_atts = second_fish.collectible_attributes;
#fish_two_atts.create(name: "Time", value: "6:00pm - 8:00pm")
#fish_two_atts.create(name: "Month Range", value: "August")
#fish_two_atts.create(name: "Location", value: "Mountains for some reason")
#fish_two_atts.create(name: "Size", value: "Seahorse sized")
#fish_two_atts.create(name: "Rarity", value: "Very rary")
#fish_two_atts.create(name: "Value", value: "10000000 bells")

#Collection.create(title: "Bugs")
#Collection.find_by(title: "Bugs").collectibles.create().collectible_attributes.create(name: "rarity")


#CollectibleAttribute.destroy_all

#Rarity.destroy_all
#BellValue.destroy_all
#TimeOfDay.destroy_all
#TimeOfYear.destroy_all
#Collectible.destroy_all
#Collection.destroy_all