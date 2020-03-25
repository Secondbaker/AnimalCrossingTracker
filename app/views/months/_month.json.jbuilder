# frozen_string_literal: true

json.extract! month, :id, :name, :number, :created_at, :updated_at
json.url month_url(month, format: :json)
