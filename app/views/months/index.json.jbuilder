# frozen_string_literal: true

json.array! @months, partial: 'months/month', as: :month
