# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#takes a string which is a list of month names with spaces between them
#returns a TimeOfYear
def parseTimeOfYear(time_of_year:String, verbose:boolean = false)
    creation = TimeOfYear.create
    if verbose
        puts "-\t" + time_of_year
    end
    months = time_of_year.split(' ')
    months.each do |month|
        if !Month.find_by(name: month)
            if verbose
                puts "Error:  Probably misspelled month: " + month
            end
        else
            creation.months << Month.find_by(name: month)
        end
    end
    return creation
end

#takes a string of format '[(#)# [am/pm] - (#)# [am/pm](; (#)# [am/pm] - (#)# [am/pm](;...))/All day]'
#returns a TimeOfDay
def parseTimeOfDay(time_of_day:String, verbose:boolean = false)
    creation = TimeOfDay.create
    if time_of_day =~ /[aA]ll [dD]ay/
        creation.timespans << Timespan.create(start: "12:00am", end: "12:00am")
        if verbose
            puts "-\tAll day"
        end
    else

        times = time_of_day.split(';')
        times.each do |time|
            start_time = time.split('-')[0]
            end_time = time.split('-')[1]
            creation.timespans << Timespan.create(start: start_time, end: end_time)
            if verbose
                puts "-\t" + start_time + " to " + end_time
            end
        end
        
    end
    return creation
end

#takes a string of format '\w+;.?\w.?...'
#returns a RewardTitle
def parseTitles(titles:String, verbose:boolean = false)
    title_values = titles.split(";")
    creation = RewardTitle.create
    title_values.each do |value|
        title = PassportTitle.find_by(value: value)
        if !PassportTitle.find_by(value: value)
            title = PassportTitle.create(value:value)
            if verbose
                puts "Created PassportTitle " + title.value
            end
        end
        position = creation.reward_title_positions.create
        title.reward_title_positions << position
        puts "-\t" + position.position.to_s + " - " + title.value 
    end
    return creation
end

#takes a string of format '\d+;.?\d.?...'
#returns a Milestone for now
def parseNumberList(numbers:String, verbose:boolean = false)
    number_values = numbers.split(";")
    creation = Milestone.create
    number_values.each do |value|
        if value =~ /[uU]nknown/
            creation.milestone_values << MilestoneValue.create(value:0)
        else
            creation.milestone_values << MilestoneValue.create(value:value)
        end
        if verbose
            puts "-\t" + creation.milestone_values.last.value.to_s
        end
    end
    return creation
end

def createBugs!(bugs:IslandCollection, bug_name:String, thumbnail_url:String, bell_value:String, time_of_year:String, time_of_day:String, bug_location:String, verbose:boolean = false)
    if thumbnail_url =~ /[uU]nknown/
        thumbnail_url = "https://playcrazygame.com/wp-content/uploads/2019/08/Default-Skin-Icons.jpg"
    end
    #create bug
    creation = bugs.collectibles.create(name: bug_name, thumbnail: thumbnail_url, complete: false)
    if verbose
        puts "Creating " + bug_name
    end

    #begin setting attributes

    #bell_value
    creation.collectible_attributes.create(collectible_attribute_value: BellValue.create(value:bell_value), collectible_attribute_type: CollectibleAttributeType.find_by(name:'Bell Value'))

    #time_of_day
    bug_t_d = parseTimeOfDay(time_of_day:time_of_day, verbose:verbose)
    creation.collectible_attributes.create(collectible_attribute_value: bug_t_d, collectible_attribute_type: CollectibleAttributeType.find_by(name: 'Time of Day'))

    #time_of_year
    bug_t_y = parseTimeOfYear(time_of_year:time_of_year, verbose:verbose)
    creation.collectible_attributes.create(collectible_attribute_value: bug_t_y, collectible_attribute_type: CollectibleAttributeType.find_by(name: 'Time of Year'))

    #bug_location
    
    if !BugSpot.find_by(name:bug_location)
        BugSpot.create(name:bug_location)
        if verbose
            puts "New BugSpot:\t" + bug_location
        end
    end
    bug_l = BugLocation.create
    if verbose
        puts "-\t" + bug_location
    end
    bug_l.bug_spots<< BugSpot.find_by(name:bug_location)
    creation.collectible_attributes.create(collectible_attribute_value: bug_l, collectible_attribute_type: CollectibleAttributeType.find_by(name:'Bug Location'))
    
end

def createFish!(fish:IslandCollection, fish_name:String, thumbnail_url:String, bell_value:String, time_of_day:String, time_of_year:String, fishing_location:String, shadow_size:String, verbose:boolean = false)

    #create fish
    creation = fish.collectibles.create(name: fish_name, thumbnail: thumbnail_url, complete: false)
    if verbose
        puts "Creating " + fish_name
    end
    
    #begin setting attributes
    
    #bell_value
    creation.collectible_attributes.create(collectible_attribute_value: BellValue.create(value:bell_value), collectible_attribute_type: CollectibleAttributeType.find_by(name:'Bell Value'))
   
    #shadow_size
    #we need to add new sizes to the list of possible sizes while we seed
    if !FishSize.find_by(name:shadow_size)
        FishSize.create(name:shadow_size)
        if verbose
            puts "New FishSize:\t" + shadow_size
        end
    end
    fish_shadow = ShadowSize.create
    if verbose
        puts "-\t" + shadow_size
    end
    fish_shadow.fish_sizes << FishSize.find_by(name:shadow_size)
    creation.collectible_attributes.create(collectible_attribute_value: fish_shadow, collectible_attribute_type: CollectibleAttributeType.find_by(name:'Shadow Size'))
    
    #time_of_day
    fish_t_d = parseTimeOfDay(time_of_day:time_of_day, verbose:verbose)
    creation.collectible_attributes.create(collectible_attribute_value: fish_t_d, collectible_attribute_type: CollectibleAttributeType.find_by(name:'Time of Day'))
    
    #time_of_year
    fish_t_y = parseTimeOfYear(time_of_year:time_of_year, verbose:verbose)
    creation.collectible_attributes.create(collectible_attribute_value: fish_t_y, collectible_attribute_type: CollectibleAttributeType.find_by(name:'Time of Year'))
    
    #fishing_location

    #multiple fishing_locations can be passed in through one string
    #if a location is in parenthesis, it means it's actually part of the previous location
    #otherwise, it is a separate location
    fish_locations = fishing_location.split(" ")
    corrected_fish_locations = []
    previous = ""
    fish_locations.each do |location|
        if location.include?('(')
            corrected_fish_locations.pop
            corrected_fish_locations.push(previous + " " + location)
        else
            corrected_fish_locations.push(location)
        end
        previous = location
    end

    fish_spot = FishingLocation.create
    corrected_fish_locations.each do |location|
        if !FishingSpot.find_by(name:location)
            FishingSpot.create(name:location)
            if verbose
                puts "New FishingSpot:\t" + location
            end
        end
        if verbose
            puts "-\t" + location
        end
        fish_spot.fishing_spots << FishingSpot.find_by(name:location)
    end
    creation.collectible_attributes.create(collectible_attribute_value: fish_spot, collectible_attribute_type: CollectibleAttributeType.find_by(name:'Fishing Location'))
end

def createFossil!(fossils:IslandCollection, fossil_name:String, thumbnail_url:String, bell_value:string, verbose:boolean = false)
    if verbose
        puts "Creating " + fossil_name
    end
    if thumbnail_url =~ /[uU]nknown/
        thumbnail_url = "https://playcrazygame.com/wp-content/uploads/2019/08/Default-Skin-Icons.jpg"
    end
    creation = fossils.collectibles.create(name:fossil_name, thumbnail:thumbnail_url, complete:false)
    
    #begin adding collectible attributes

    #bell_value
    creation.collectible_attributes.create(collectible_attribute_value: BellValue.create(value:bell_value), collectible_attribute_type: CollectibleAttributeType.find_by(name:'Bell Value'))
end

def createVillager!(villagers:IslandCollection, villager_name:String, thumbnail_url:String, villager_gender:String, villager_personality:String, villager_species:String, birthday:String, villager_catchphrase:String, verbose:boolean = false)
    creation = villagers.collectibles.create(name:villager_name, thumbnail:thumbnail_url, complete:false)
    if verbose
        puts "Created " + creation.name
    end

    #begin adding collectible attributes

    #villager_gender
    #the ISO standard says that 0 is unknown, 1 is male, 2 is female, and 9 is not applicable
    villager_gender_int = 0
    if villager_gender =~ /[mM]+/
        villager_gender_int = 1
    elsif villager_gender =~ /[fF]+/
        villager_gender_int = 2
    end
    creation.collectible_attributes.create(collectible_attribute_value: VillagerGender.create(value: villager_gender_int), collectible_attribute_type: CollectibleAttributeType.find_by(name: 'Gender'))
    

    #villager_personality
    if !PersonalityType.find_by(name:villager_personality)
        if verbose
            puts "New PersonalityType:\t" + villager_personality
        end
        PersonalityType.create(name:villager_personality)
    end
    villager_personality_type = VillagerPersonality.create
    villager_personality_type.personality_types << PersonalityType.find_by(name: villager_personality)
    if verbose
        puts "-\t" + villager_personality_type.personality_types.first.name
    end
    creation.collectible_attributes.create(collectible_attribute_value: villager_personality_type, collectible_attribute_type: CollectibleAttributeType.find_by(name:'Personality'))
    
    #villager_species
    if !Species.find_by(name:villager_species)
        if verbose
            puts "New Species:\t" + villager_species
        end
        Species.create(name:villager_species)
    end

    villager_species_type = VillagerSpecies.create
    villager_species_type.species << Species.find_by(name: villager_species)
    if verbose
        puts "\t" + villager_species_type.species.first.name
    end
    creation.collectible_attributes.create(collectible_attribute_value: villager_species_type, collectible_attribute_type: CollectibleAttributeType.find_by(name:'Species'))

    #villager_birthday
    #it looks like this is the unknown birthday
    date_of_birth = Date.new(2000, 1, 1)
    unless birthday =~ /[uU]nknown/
        bd_month = birthday.sub(/ \d+[snrt][tdh]/, '')
        bd_day = birthday.sub(/\w+ /, '').sub(/[snrt][tdh]/, '')
        date_of_birth = Date.new(2001, Month.find_by(name:bd_month).number, bd_day.to_i)
    end
    if verbose
        puts "-\t" + date_of_birth.to_s
    end
    creation.collectible_attributes.create(collectible_attribute_value: Birthday.create(value: date_of_birth), collectible_attribute_type: CollectibleAttributeType.find_by(name:'Birthday'))

    #villager_catchphrase
    if !Catchphrase.find_by(name:villager_catchphrase)
        if verbose
            puts "New Catchphrase:\t" + villager_catchphrase
        end
        Catchphrase.create(name: villager_catchphrase)
    end

    v_catchphrase = VillagerCatchphrase.create
    v_catchphrase.catchphrases << Catchphrase.find_by(name:villager_catchphrase)
    if verbose
        puts "-\t" +  v_catchphrase.catchphrases.first.name
    end
    creation.collectible_attributes.create(collectible_attribute_value: v_catchphrase, collectible_attribute_type: CollectibleAttributeType.find_by(name:'Catchphrase'))

end

def createNookMiles!(nook_miles:nook_miles, name:String, description:String, milestones:String, passport_title_1:String, passport_title_2:String, miles:String, verbose:boolean = false)
    creation = nook_miles.collectibles.create(name:name, thumbnail:"http://google.jpg", complete:false)
    if verbose
        puts "Creating " + name
    end

    #begin adding collectible_attributes

    #description
    creation.collectible_attributes.create(collectible_attribute_value: Description.create(information:description), collectible_attribute_type: CollectibleAttributeType.find_by(name:'Description'))
    if verbose
        short_description = description
        unless (description.length <= 20)
            short_description = short_description[0..20] + "..."
        end
        puts "-\t" + short_description
    end

    #milestones
    if verbose
        puts "-Milestones"
     end
    creation_milestones = parseNumberList(numbers: milestones, verbose:verbose)
    creation.collectible_attributes.create(collectible_attribute_value:creation_milestones, collectible_attribute_type: CollectibleAttributeType.find_by(name:'Milestones'))
    

    #passport_title_1
    creation_reward_titles = parseTitles(titles: passport_title_1, verbose:verbose)
    creation.collectible_attributes.create(collectible_attribute_value: creation_reward_titles, collectible_attribute_type: CollectibleAttributeType.find_by(name: 'Passport Title 1'))

    #passport_title_2
    creation_reward_titles = parseTitles(titles: passport_title_2, verbose:verbose)
    creation.collectible_attributes.create(collectible_attribute_value: creation_reward_titles, collectible_attribute_type: CollectibleAttributeType.find_by(name: 'Passport Title 2'))

    #miles
    if verbose
        puts "-Miles"
    end
    creation_miles = parseNumberList(numbers: miles, verbose:verbose)
    creation.collectible_attributes.create(collectible_attribute_value:creation_miles, collectible_attribute_type: CollectibleAttributeType.find_by(name:'Miles'))
end

def getFish(csv:CSV::Table, verbose:boolean = false)
    fish = IslandCollection.create(title: "Fish")
    if verbose
        puts "Creating IslandCollection:\tFish"
    end
    csv.each do |fish_data|
        createFish!(fish:fish, fish_name:fish_data[0], thumbnail_url:fish_data[1], bell_value: fish_data[2], fishing_location:fish_data[3], shadow_size:fish_data[4], time_of_day:fish_data[5], time_of_year:fish_data[6], verbose:verbose)
    end
end

def getBugs(csv:CSV::Table, verbose:boolean = false)
    bugs = IslandCollection.create(title: "Bugs")
    if verbose
        puts "Creating IslandCollection:\tBugs"
    end
    csv.each do |bug_data|
        createBugs!(bugs:bugs, bug_name:bug_data["Bugs"], thumbnail_url:bug_data["Image"], bell_value:bug_data["Value"], time_of_year:bug_data["Month"], time_of_day:bug_data["Time"], bug_location:bug_data["Location"], verbose:verbose)
    end
end

def getFossils(csv:CSV::Table, verbose:boolean = false)
    fossils = IslandCollection.create(title: "Fossils")
    if verbose
        puts "Creating IslandCollection:\tFossils"
    end
    csv.each do |fossil_data|
        createFossil!(fossils:fossils, fossil_name:fossil_data["Fossil"], thumbnail_url:fossil_data["Image"], bell_value:fossil_data["Value"], verbose:verbose)
    end
end

def getVillagers(csv:CSV::Table, verbose:boolean = false)
    villagers = IslandCollection.create(title: "Villagers")
    if verbose
        puts "Creating IslandCollection:\tVillagers"
    end
    csv.each do |villager_data|
        createVillager!(villagers:villagers, villager_name:villager_data['Villager'], thumbnail_url:villager_data['Image'], villager_gender:villager_data['Gender'], villager_personality:villager_data['Personality'], villager_species:villager_data['Species'], birthday:villager_data['Birthday'], villager_catchphrase:villager_data['Catchphrase'], verbose:verbose)
    end
end

def getNookMiles(csv:CSV::Table, verbose:boolean = false)
    nook_miles = IslandCollection.create(title: "Nook Miles", thumbnail: "http://google.jpg")
    if verbose
        puts "Creating IslandCollection:\tNook Miles"
    end
    csv.each do |nook_miles_data|
        createNookMiles!(nook_miles:nook_miles, name:nook_miles_data["Name"], description:nook_miles_data["Description"], milestones:nook_miles_data["Milestones"], passport_title_1:nook_miles_data["Passport Title 1"], passport_title_2:nook_miles_data["Passport Title 2"], miles:nook_miles_data["Miles"], verbose:verbose)
    end
end
RewardTitlePosition.destroy_all
RewardTitle.destroy_all
Description.destroy_all
VillagerCatchphrase.destroy_all
Birthday.destroy_all
VillagerSpecies.destroy_all
VillagerPersonality.destroy_all
VillagerGender.destroy_all
ShadowSize.destroy_all
CollectibleAttribute.destroy_all
Timespan.destroy_all
Rarity.destroy_all
BellValue.destroy_all
TimeOfDay.destroy_all
TimeOfYear.destroy_all
FishingLocation.destroy_all
BugLocation.destroy_all
Collectible.destroy_all
IslandCollection.destroy_all
Collection.destroy_all

CollectibleAttributeType.destroy_all
rarity_type = CollectibleAttributeType.create(name: 'Rarity')
bell_value_type = CollectibleAttributeType.create(name: 'Bell Value')
time_of_day_type = CollectibleAttributeType.create(name: 'Time of Day')
time_of_year_type = CollectibleAttributeType.create(name: 'Time of Year')
fishing_location_type = CollectibleAttributeType.create(name: 'Fishing Location')
bug_location_type = CollectibleAttributeType.create(name: 'Bug Location')
shadow_size_type = CollectibleAttributeType.create(name: 'Shadow Size')
mood_type = CollectibleAttributeType.create(name: 'Mood')
villager_gender = CollectibleAttributeType.create(name: 'Gender')
villager_personality = CollectibleAttributeType.create(name: 'Personality')
villager_species = CollectibleAttributeType.create(name: 'Species')
birthday_type = CollectibleAttributeType.create(name: 'Birthday')
catchphrase_type = CollectibleAttributeType.create(name: 'Catchphrase')
description_type = CollectibleAttributeType.create(name: 'Description')
milestone_type = CollectibleAttributeType.create(name: 'Milestones')
title_1_type = CollectibleAttributeType.create(name: 'Passport Title 1')
title_2_type = CollectibleAttributeType.create(name: 'Passport Title 2')
miles_type = CollectibleAttributeType.create(name: 'Miles')

MoodName.destroy_all
#hard_to_say = MoodName.create(name: 'Hard to say')
#lazy = MoodName.create(name: 'Lazy')


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

PersonalityType.destroy_all
#p_t_1 = PersonalityType.create(name: 'Jock')
#p_t_2 = PersonalityType.create(name: 'Sleepy')

Species.destroy_all
#s_1 = Species.create(name: 'Bird')

Catchphrase.destroy_all
#c_1 = Catchphrase.create(name: 'aye aye')

FishingSpot.destroy_all
#pier = FishingSpot.create(name: 'Pier')
#pond = FishingSpot.create(name: 'Pond')
#river = FishingSpot.create(name: 'River')
#river_clifftop = FishingSpot.create(name: 'River (Clifftop)')
#river_mouth = FishingSpot.create(name: 'River (Mouth)')
#sea = FishingSpot.create(name: 'Sea')
#sea_raining = FishingSpot.create(name: 'Sea (Raining)')

BugSpot.destroy_all
#question_bug = BugSpot.create(name: '?')
#shell_disguise = BugSpot.create(name: 'On beach disguised as shells')
#flying = BugSpot.create(name: 'Flying')
#flying_by_light = BugSpot.create(name: 'Flying by light')
#flying_by_rare_flowers = BugSpot.create(name: 'Flying by rare flowers')
#under_rocks = BugSpot.create(name: 'Under rocks (hit the rock)')
#hopping = BugSpot.create(name: 'Hopping')
#tree_stump = BugSpot.create(name: 'On a tree stump')
#beach_rocks = BugSpot.create(name: 'On beach rocks')
#flowers = BugSpot.create(name: 'On flowers')
#white_flowers = BugSpot.create(name: 'On white flowers')
#ground = BugSpot.create(name: 'On ground')
#ponds_rivers = BugSpot.create(name: 'On ponds and rivers')
#rocks_rain = BugSpot.create(name: 'On rocks (raining)')
#trash = BugSpot.create(name: 'On trash items')
#tree = BugSpot.create(name: 'On trees')
#palm_tree = BugSpot.create(name: 'On palm trees')
#shaking_tree = BugSpot.create(name: 'Shaking trees')
#leaf_disguise = BugSpot.create(name: 'Under trees disguised as leaves')
#underground = BugSpot.create(name: 'Underground')
#villagers_heads = BugSpot.create(name: 'Villagers\' heads')

FishSize.destroy_all
#narrow = FishSize.create(name: 'Narrow')
#question_fish = FishSize.create(name: '? (Fin)')
#one = FishSize.create(name: '1')
#two = FishSize.create(name: '2')
#three = FishSize.create(name: '3')
#four = FishSize.create(name: '4')
#five = FishSize.create(name: '5')
#six = FishSize.create(name: '6')
#six_fin = FishSize.create(name: '6 (Fin)')

PassportTitle.destroy_all

verbose = true

csv_text = CSV.read(Rails.root.join('lib', 'seeds', 'Animal Crossing_ New Horizons Tracker - Fish.csv'), headers: true)

getFish(csv: csv_text, verbose:verbose)

csv_text = CSV.read(Rails.root.join('lib', 'seeds', 'Animal Crossing_ New Horizons Tracker - Bugs.csv'), headers: true)

getBugs(csv: csv_text, verbose:verbose)

csv_text = CSV.read(Rails.root.join('lib', 'seeds', 'Animal Crossing_ New Horizons Tracker - Fossils.csv'), headers: true)

getFossils(csv: csv_text, verbose:verbose)

csv_text = CSV.read(Rails.root.join('lib', 'seeds', 'Animal Crossing_ New Horizons Tracker - Villagers.csv'), headers: true)

getVillagers(csv: csv_text, verbose:verbose)

csv_text = CSV.read(Rails.root.join('lib', 'seeds', 'Animal Crossing_ New Horizons Tracker - Nook Miles.csv'), headers: true)

getNookMiles(csv: csv_text, verbose:verbose)