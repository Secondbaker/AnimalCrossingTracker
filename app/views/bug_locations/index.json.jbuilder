# frozen_string_literal: true

json.array! @bug_locations, partial: 'bug_locations/bug_location', as: :bug_location
