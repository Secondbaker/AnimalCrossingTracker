# frozen_string_literal: true

class TimeOfDay < ApplicationRecord
  include FilterableAttribute
  has_one :collectible_attribute, as: :collectible_attribute_value
  has_and_belongs_to_many :hours

  def active_at_time(time: Time)
    result = false
    puts 'Time:  ' + time.to_s
    self.hours.each do |my_hour|
      if my_hour.name.include? 'a'
        hour_num = my_hour.name.split('a')[0].to_i % 12
      else
        hour_num = my_hour.name.split('p')[0].to_i % 12 + 12
      end
      if hour_num == time.hour
        result = true
      end
    end
    return result
  end

  def filters
    { current_time: "current time", active: { "12am": "12am", "1am": "1am", "2am": "2am", "3am": "3am", "4am": "4am", "5am": "5am", "6am": "6am", "7am": "7am", "8am": "8am", "9am": "9am", "10am": "10am", "11am": "11am",
      "12pm": "12pm", "1pm": "1pm", "2pm": "2pm", "3pm": "3pm", "4pm": "4pm", "5pm": "5pm", "6pm": "6pm", "7pm": "7pm", "8pm": "8pm", "9pm": "9pm", "10pm": "10pm", "11pm": "11pm" } }
  end
end
