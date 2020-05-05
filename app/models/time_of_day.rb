# frozen_string_literal: true

class TimeOfDay < ApplicationRecord
  include FilterableAttribute
  has_one :collectible_attribute, as: :collectible_attribute_value
  has_and_belongs_to_many :hours

  def active_at_time(time: Time)
    result = false
    
    self.hours.each do |my_hour|
      if my_hour.name.include? 'a'
        hour_num = (my_hour.name.split('a')[0].to_i) % 12
      else
        hour_num = (my_hour.name.split('p')[0].to_i + 12) % 24
      end
      
      if hour_num == time.hour
        result = true
      end
    end

    return result
  end

  def filters
    { current_time: "current time" }
  end
end
