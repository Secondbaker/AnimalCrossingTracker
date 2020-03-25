# frozen_string_literal: true

json.extract! time_of_year, :id, :months_id, :created_at, :updated_at
json.url time_of_year_url(time_of_year, format: :json)
