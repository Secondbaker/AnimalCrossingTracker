# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CollectibleAttribute.destroy_all
Timespan.destroy_all
Rarity.destroy_all
BellValue.destroy_all
TimeOfDay.destroy_all
TimeOfYear.destroy_all
FishingLocation.destroy_all
BugLocation.destroy_all
Collectible.destroy_all
Collection.destroy_all

Month.destroy_all
january = Month.create(name: 'January', number: 1)
february = Month.create(name: 'February', number: 2)
march = Month.create(name: 'March', number: 3)
april = Month.create(name: 'April', number: 4)
may = Month.create(name: 'May', number: 5)
june = Month.create(name: 'June', number: 6)
july = Month.create(name: 'July', number: 7)
august = Month.create(name: 'August', number: 8)
september = Month.create(name: 'September', number: 9)
october = Month.create(name: 'October', number: 10)
november = Month.create(name: 'November', number: 11)
december = Month.create(name: 'December', number: 12)

FishingSpot.destroy_all
pier = FishingSpot.create(name: 'Pier')
pond = FishingSpot.create(name: 'Pond')
river = FishingSpot.create(name: 'River')
river_clifftop = FishingSpot.create(name: 'River (Clifftop)')
river_mouth = FishingSpot.create(name: 'River (Mouth)')
sea = FishingSpot.create(name: 'Sea')
sea_raining = FishingSpot.create(name: 'Sea (Raining)')

BugSpot.destroy_all
question = BugSpot.create(name: '?')
shell_disguise = BugSpot.create(name: 'On beach disguised as shells')
flying = BugSpot.create(name: 'Flying')
flying_by_light = BugSpot.create(name: 'Flying by light')
flying_by_rare_flowers = BugSpot.create(name: 'Flying by rare flowers')
under_rocks = BugSpot.create(name: 'Under rocks (hit the rock)')
hopping = BugSpot.create(name: 'Hopping')
tree_stump = BugSpot.create(name: 'On a tree stump')
beach_rocks = BugSpot.create(name: 'On beach rocks')
flowers = BugSpot.create(name: 'On flowers')
white_flowers = BugSpot.create(name: 'On white flowers')
ground = BugSpot.create(name: 'On ground')
ponds_rivers = BugSpot.create(name: 'On ponds and rivers')
rocks_rain = BugSpot.create(name: 'On rocks (raining)')
trash = BugSpot.create(name: 'On trash items')
tree = BugSpot.create(name: 'On trees')
palm_tree = BugSpot.create(name: 'On palm trees')
shaking_tree = BugSpot.create(name: 'Shaking trees')
leaf_disguise = BugSpot.create(name: 'Under trees disguised as leaves')
underground = BugSpot.create(name: 'Underground')
villagers_heads = BugSpot.create(name: 'Villagers\' heads')


rarity_type = CollectibleAttributeType.create(name: 'Rarity')
bell_value_type = CollectibleAttributeType.create(name: 'Bell Value')
time_of_day_type = CollectibleAttributeType.create(name: 'Time of Day')
time_of_year_type = CollectibleAttributeType.create(name: 'Time of Year')
fishing_location_type = CollectibleAttributeType.create(name: 'Fishing Location')
bug_location_type = CollectibleAttributeType.create(name: 'Bug Location')

Rarity.create(value: 1)
BellValue.create(value: 154)
TimeOfDay.create(timespans: [Timespan.create(start: "2:00am", end: "3:00am"), Timespan.create(start: "5:00pm", end: "7:00pm")] )

TimeOfYear.create
TimeOfYear.first.months << [january, february, april, august, december]

FishingLocation.create
FishingLocation.first.fishing_spots << [pond, river]

BugLocation.create
BugLocation.first.bug_spots << [villagers_heads, shell_disguise]

fish_collection = Collection.create(title: 'Fish')
first_fish = fish_collection.collectibles.create(name: 'Shark', thumbnail: 'https://vignette.wikia.nocookie.net/animalcrossing/images/5/5b/Shark_HHD_Icon.png/revision/latest?cb=20161105204315', complete: false)
first_fish.collectible_attributes.create(collectible_attribute_value: Rarity.first, collectible_attribute_type: CollectibleAttributeType.first)
first_fish.collectible_attributes.create(collectible_attribute_value: BellValue.first, collectible_attribute_type: bell_value_type)
first_fish.collectible_attributes.create(collectible_attribute_value: TimeOfDay.first, collectible_attribute_type: time_of_day_type)
first_fish.collectible_attributes.create(collectible_attribute_value: TimeOfYear.first, collectible_attribute_type: time_of_year_type)
first_fish.collectible_attributes.create(collectible_attribute_value: FishingLocation.first, collectible_attribute_type: fishing_location_type)
first_fish.collectible_attributes.create(collectible_attribute_value: BugLocation.first, collectible_attribute_type: bug_location_type)
# fish_one_atts = first_fish.collectible_attributes;
# fish_one_atts.create(name: "Time", value: "6:00pm - 8:00pm")
# fish_one_atts.create(name: "Month Range", value: "August")
# fish_one_atts.create(name: "Location", value: "Mountains for some reason")
# fish_one_atts.create(name: "Size", value: "Shark sized")
# fish_one_atts.create(name: "Rarity", value: "Very rary")
# fish_one_atts.create(name: "Value", value: "10000000 bells")

second_fish = fish_collection.collectibles.create(name: 'Seahorse', thumbnail: 'https://vignette.wikia.nocookie.net/animalcrossing/images/a/aa/Sea_Horse_HHD_Icon.png/revision/latest?cb=20161105204235', complete: true)
# fish_two_atts = second_fish.collectible_attributes;
# fish_two_atts.create(name: "Time", value: "6:00pm - 8:00pm")
# fish_two_atts.create(name: "Month Range", value: "August")
# fish_two_atts.create(name: "Location", value: "Mountains for some reason")
# fish_two_atts.create(name: "Size", value: "Seahorse sized")
# fish_two_atts.create(name: "Rarity", value: "Very rary")
# fish_two_atts.create(name: "Value", value: "10000000 bells")

# Collection.create(title: "Bugs")
# Collection.find_by(title: "Bugs").collectibles.create().collectible_attributes.create(name: "rarity")

# CollectibleAttribute.destroy_all

# Rarity.destroy_all
# BellValue.destroy_all
# TimeOfDay.destroy_all
# TimeOfYear.destroy_all
# Collectible.destroy_all
# Collection.destroy_all
