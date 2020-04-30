# frozen_string_literal: true

json.extract! bell_value, :id, :value, :created_at, :updated_at
json.url bell_value_url(bell_value, format: :json)
