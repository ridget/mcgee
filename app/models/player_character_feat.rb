class PlayerCharacterFeat < ApplicationRecord
  belongs_to :player_character
  belongs_to :feat
  belongs_to :feat_ability_score_increase, optional: true, class_name: "FeatAbilityScoreIncreaseOption", foreign_key: :feat_ability_score_increase_id
end
