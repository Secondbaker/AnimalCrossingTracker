# frozen_string_literal: true

json.array! @collectibles, partial: 'collectibles/collectible', as: :collectible
