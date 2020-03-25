# frozen_string_literal: true

json.array! @fishing_locations, partial: 'fishing_locations/fishing_location', as: :fishing_location
