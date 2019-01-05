class Feat < ApplicationRecord
  has_many :ability_score_increase_options, class_name: "FeatAbilityScoreIncreaseOption"
end
