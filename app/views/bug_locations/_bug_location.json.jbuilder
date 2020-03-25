# frozen_string_literal: true

json.extract! bug_location, :id, :created_at, :updated_at
json.url bug_location_url(bug_location, format: :json)
