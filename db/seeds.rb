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

#takes a string which is a list of hour names with spaces between them
#returns a TimeOfDay
def parseTimeOfDay(time_of_day:String, verbose:boolean = false)
    creation = TimeOfDay.create
    if verbose
        puts "-\t" + time_of_day
    end
    hours = time_of_day.split(' ')
    hours.each do |hour|
        if !Hour.find_by(name: hour)
            if verbose
                puts "Error:  Probably misspelled hour: " + hour
            end
        else
            creation.hours << Hour.find_by(name: hour)
        end
    end
    return creation
end

#takes a string of format '\w+;.?\w.?...' 
#returns a CollectibleAttributeList of StringCollectibleAttributes
def parseTitles!(titles:String, collectible_attribute_list:CollectibleAttributeList, verbose:boolean = false)
    title_values = titles.split(";")
    title_values.each do |value|
        title = StringCollectibleAttribute.create(value:value)
        if verbose
            puts "-\t" + title.value
        end
        collectible_attribute_list.collectible_attributes.create(collectible_attribute_value: StringCollectibleAttribute.find_by(value:value))
    end
    
end

#takes a string of format '\d+;.?\d.?...'
#returns a CollectibleAttributeList of NumberCollectibleAttributes
def parseNumberList(numbers:String, verbose:boolean = false)
    number_values = numbers.split(";")
    creation = CollectibleAttributeList.create
    number_values.each do |value|
        if value =~ /[uU]nknown/
            creation.collectible_attributes.create(collectible_attribute_value: NumberCollectibleAttribute.create(value:0))
        else
            creation.collectible_attributes.create(collectible_attribute_value: NumberCollectibleAttribute.create(value:value))
        end
        if verbose
            puts "-\t" + creation.collectible_attributes.last.collectible_attribute_value.value.to_s
        end
    end
    return creation
end

def createBugs!(bugs:IslandCollection, bug_name:String, thumbnail_url:String, bell_value:String, time_of_year:String, time_of_day:String, bug_location:String, verbose:boolean = false)
    if thumbnail_url =~ /[uU]nknown/
        thumbnail_url = "https://playcrazygame.com/wp-content/uploads/2019/08/Default-Skin-Icons.jpg"
    end
    
    creation = bugs.collectibles.find_by(name: bug_name)
    if creation == nil
        #create bug
        creation = bugs.collectibles.create(name: bug_name, thumbnail: thumbnail_url, complete: false)
    else
        creation.collectible_attributes.destroy_all
    end
    if verbose
        puts "Creating " + bug_name
    end

    #begin setting attributes

    #bell_value
    creation.collectible_attributes.create(collectible_attribute_value: BellValue.create(value:bell_value), label: 'Value')

    #time_of_day
    bug_t_d = parseTimeOfDay(time_of_day:time_of_day, verbose:verbose)
    creation.collectible_attributes.create(collectible_attribute_value: bug_t_d, label: 'Active Hours')

    #time_of_year
    bug_t_y = parseTimeOfYear(time_of_year:time_of_year, verbose:verbose)
    creation.collectible_attributes.create(collectible_attribute_value: bug_t_y, label: 'Seasonality')

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
    creation.collectible_attributes.create(collectible_attribute_value: bug_l, label: 'Location')
    
end

def createFish!(fish:IslandCollection, fish_name:String, thumbnail_url:String, bell_value:String, time_of_day:String, time_of_year:String, fishing_location:String, shadow_size:String, verbose:boolean = false)
    
    creation = fish.collectibles.find_by(name: fish_name)
    if creation == nil
        #create fish
        creation = fish.collectibles.create(name: fish_name, thumbnail: thumbnail_url, complete: false)
    else
        creation.collectible_attributes.destroy_all
    end
    if verbose
        puts "Creating " + fish_name
    end
    
    #begin setting attributes
    
    #bell_value
    creation.collectible_attributes.create(collectible_attribute_value: BellValue.create(value:bell_value), label: 'Value')
   
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
    creation.collectible_attributes.create(collectible_attribute_value: fish_shadow, label: 'Shadow Size')
    
    #time_of_day
    fish_t_d = parseTimeOfDay(time_of_day:time_of_day, verbose:verbose)
    creation.collectible_attributes.create(collectible_attribute_value: fish_t_d, label: 'Active Hours')
    
    #time_of_year
    fish_t_y = parseTimeOfYear(time_of_year:time_of_year, verbose:verbose)
    creation.collectible_attributes.create(collectible_attribute_value: fish_t_y, label: 'Seasonality')
    
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
    creation.collectible_attributes.create(collectible_attribute_value: fish_spot, label: 'Location')
end

def createFossil!(fossils:IslandCollection, fossil_name:String, thumbnail_url:String, bell_value:string, verbose:boolean = false)
    if verbose
        puts "Creating " + fossil_name
    end
    if thumbnail_url =~ /[uU]nknown/
        thumbnail_url = "https://playcrazygame.com/wp-content/uploads/2019/08/Default-Skin-Icons.jpg"
    end
    creation = fossils.collectibles.find_by(name: fossil_name)
    if creation == nil
        creation = fossils.collectibles.create(name:fossil_name, thumbnail:thumbnail_url, complete:false)
    else
        creation.collectible_attributes.destroy_all
    end
    
    #begin adding collectible attributes

    #bell_value
    creation.collectible_attributes.create(collectible_attribute_value: BellValue.create(value:bell_value), label: 'Value')
end

def createVillager!(villagers:IslandCollection, villager_name:String, thumbnail_url:String, villager_gender:String, villager_personality:String, villager_species:String, birthday:String, villager_catchphrase:String, verbose:boolean = false)
    
    creation = villagers.collectibles.find_by(name:villager_name)
    if creation == nil
        creation = villagers.collectibles.create(name:villager_name, thumbnail:thumbnail_url, complete:false)
    end
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
    creation.collectible_attributes.create(collectible_attribute_value: VillagerGender.create(value: villager_gender_int), label: 'Gender')
    

    #villager_personality
    villager_personality_type = StringCollectibleAttribute.create(value: villager_personality, label:'Personality')
    if verbose
        puts "-\t" + villager_personality_type.value
    end
    creation.collectible_attributes.create(collectible_attribute_value: villager_personality_type, label: 'Personality')
    
    #villager_species
    villager_species_type = StringCollectibleAttribute.create(value: villager_species, label: 'Species')
    if verbose
        puts "\t" + villager_species_type.value
    end
    creation.collectible_attributes.create(collectible_attribute_value: villager_species_type, label: 'Species')

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
    creation.collectible_attributes.create(collectible_attribute_value: Birthday.create(value: date_of_birth), label: 'Birthday')

    v_catchphrase = StringCollectibleAttribute.create(value:villager_catchphrase, label: 'Catchphrase')
    if verbose
        puts "-\t" +  v_catchphrase.value
    end
    creation.collectible_attributes.create(collectible_attribute_value: v_catchphrase, label: 'Catchphrase')

end

def createNookMiles!(nook_miles:nook_miles, name:String, description:String, milestones:String, passport_title_1:String, passport_title_2:String, miles:String, verbose:boolean = false)
    
    creation = nook_miles.collectibles.find_by(name:name)
    if creation == nil
        creation = nook_miles.collectibles.create(name:name, thumbnail:"http://google.jpg", complete:false)
    end
    if verbose
        puts "Creating " + name
    end

    #begin adding collectible_attributes

    #description
    creation.collectible_attributes.create(collectible_attribute_value: StringCollectibleAttribute.create(value:description), label: 'Description')
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
    creation.collectible_attributes.create(collectible_attribute_value:creation_milestones, label: 'Milestones')
    
    if verbose
        puts "-Passport Title 1"
    end
    #passport_title_1
    creation_reward_titles = creation.collectible_attributes.create(collectible_attribute_value: CollectibleAttributeList.create, label: 'Passport Title 1')
    parseTitles!(titles: passport_title_1, collectible_attribute_list: creation_reward_titles.collectible_attribute_value, verbose:verbose)

    if verbose
        puts "-Passport Title 2"
    end
    #passport_title_2
    creation_reward_titles = creation.collectible_attributes.create(collectible_attribute_value: CollectibleAttributeList.create, label: 'Passport Title 2')
    parseTitles!(titles: passport_title_2, collectible_attribute_list: creation_reward_titles.collectible_attribute_value, verbose:verbose)

    #miles
    if verbose
        puts "-Miles"
    end
    creation_miles = parseNumberList(numbers: miles, verbose:verbose)
    creation.collectible_attributes.create(collectible_attribute_value:creation_miles, label: 'Miles')
end

def getFish(csv:CSV::Table, verbose:boolean = false)
    fish = IslandCollection.find_by(title: "Fish", default: true)
    if fish == nil
        fish = IslandCollection.create(title: "Fish", default: true)
    end
    if verbose
        puts "Creating IslandCollection:\tFish"
    end
    csv.each do |fish_data|
        createFish!(fish:fish, fish_name:fish_data["Fish"], thumbnail_url:fish_data["Image"], bell_value: fish_data["Value"], fishing_location:fish_data["Location"], shadow_size:fish_data["Shadow Size"], time_of_day:fish_data["Time (New)"], time_of_year:fish_data["Month"], verbose:verbose)
    end
end

def getBugs(csv:CSV::Table, verbose:boolean = false)
    bugs = IslandCollection.find_by(title: 'Bugs', default: true)
    if bugs == nil
        bugs = IslandCollection.create(title: "Bugs", default: true)
    end
    if verbose
        puts "Creating IslandCollection:\tBugs"
    end
    csv.each do |bug_data|
        createBugs!(bugs:bugs, bug_name:bug_data["Bugs"], thumbnail_url:bug_data["Image"], bell_value:bug_data["Value"], time_of_year:bug_data["Month"], time_of_day:bug_data["Time"], bug_location:bug_data["Location"], verbose:verbose)
    end
end

def getFossils(csv:CSV::Table, verbose:boolean = false)
    fossils = IslandCollection.find_by(title: "Fossils", default: true)
    if fossils == nil
        fossils = IslandCollection.create(title: "Fossils", default: true)
    end

    if verbose
        puts "Creating IslandCollection:\tFossils"
    end
    csv.each do |fossil_data|
        createFossil!(fossils:fossils, fossil_name:fossil_data["Fossil"], thumbnail_url:fossil_data["Image"], bell_value:fossil_data["Value"], verbose:verbose)
    end
end

def getVillagers(csv:CSV::Table, verbose:boolean = false)
    villagers = IslandCollection.find_by(title: 'Villagers', default: true)
    if villagers == nil
        villagers = IslandCollection.create(title: "Villagers", default: true)
    end
    if verbose
        puts "Creating IslandCollection:\tVillagers"
    end
    csv.each do |villager_data|
        createVillager!(villagers:villagers, villager_name:villager_data['Villager'], thumbnail_url:villager_data['Image'], villager_gender:villager_data['Gender'], villager_personality:villager_data['Personality'], villager_species:villager_data['Species'], birthday:villager_data['Birthday'], villager_catchphrase:villager_data['Catchphrase'], verbose:verbose)
    end
end

def getNookMiles(csv:CSV::Table, verbose:boolean = false)
    nook_miles = IslandCollection.find_by(title: 'Nook Miles', default: true)
    if nook_miles == nil
        nook_miles = IslandCollection.create(title: "Nook Miles", thumbnail: "http://google.jpg", default: true)
    end
    if verbose
        puts "Creating IslandCollection:\tNook Miles"
    end
    csv.each do |nook_miles_data|
        createNookMiles!(nook_miles:nook_miles, name:nook_miles_data["Name"], description:nook_miles_data["Description"], milestones:nook_miles_data["Milestones"], passport_title_1:nook_miles_data["Passport Title 1"], passport_title_2:nook_miles_data["Passport Title 2"], miles:nook_miles_data["Miles"], verbose:verbose)
    end
end
start_time = Time.now
verbose = true
allowed_env = [  ]
if allowed_env.include?(Rails.env)
    if verbose
        puts "Destroying MyCollectedCollectible"
    end
    MyCollectedCollectible.destroy_all

    if verbose
        puts "Destroying User"
    end
    User.destroy_all
end

if verbose
    puts "Destroying StringCollectibleAttribute"
end
StringCollectibleAttribute.destroy_all

if verbose
    puts "Destroying Birthday"
end
Birthday.destroy_all

if verbose
    puts "Destroying VillagerGender"
end
VillagerGender.destroy_all

if verbose
    puts "Destroying ShadowSize"
end
ShadowSize.destroy_all

if verbose
    puts "Destroying CollectibleAttribute"
end
CollectibleAttribute.destroy_all

if verbose
    puts "Destroying BellValue"
end
BellValue.destroy_all

if verbose
    puts "Destroying TimeOfDay"
end
TimeOfDay.destroy_all

if verbose
    puts "Destroying TimeOfYear"
end
TimeOfYear.destroy_all

if verbose
    puts "Destroying FishingLocation"
end
FishingLocation.destroy_all

if verbose
    puts "Destroying BugLocation"
end
BugLocation.destroy_all

if allowed_env.include?(Rails.env)
    if verbose
        puts "Destroying Collectible"
    end
    Collectible.destroy_all
end
if verbose
    puts "Destroying CollectibleAttributeList"
end
CollectibleAttributeList.destroy_all

if allowed_env.include?(Rails.env)
    if verbose
        puts "Destroying IslandCollection"
    end
    IslandCollection.destroy_all
end

if allowed_env.include?(Rails.env)

    if verbose
        puts "Destroying Month"
    end
    Month.destroy_all
    if verbose
        puts "Creating Months"
    end
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

    if verbose
        puts "Destroying Hour"
    end
    Hour.destroy_all
    if verbose
        puts "Creating Hours"
    end
    Hour.create(name: '12a')
    Hour.create(name: '1a')
    Hour.create(name: '2a')
    Hour.create(name: '3a')
    Hour.create(name: '4a')
    Hour.create(name: '5a')
    Hour.create(name: '6a')
    Hour.create(name: '7a')
    Hour.create(name: '8a')
    Hour.create(name: '9a')
    Hour.create(name: '10a')
    Hour.create(name: '11a')
    Hour.create(name: '12p')
    Hour.create(name: '1p')
    Hour.create(name: '2p')
    Hour.create(name: '3p')
    Hour.create(name: '4p')
    Hour.create(name: '5p')
    Hour.create(name: '6p')
    Hour.create(name: '7p')
    Hour.create(name: '8p')
    Hour.create(name: '9p')
    Hour.create(name: '10p')
    Hour.create(name: '11p')


    if verbose
        puts "Destroying FishingSpot"
    end
    FishingSpot.destroy_all

    if verbose
        puts "Destroying BugSpot"
    end
    BugSpot.destroy_all

    if verbose
        puts "Destroying FishSize"
    end
    FishSize.destroy_all
end

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

puts 'Finished in ' + (Time.now - start_time).to_s + 's'