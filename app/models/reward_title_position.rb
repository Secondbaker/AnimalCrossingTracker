class RewardTitlePosition < ApplicationRecord
    belongs_to :reward_title
    acts_as_list scope: :reward_title
    belongs_to :passport_title
end
