class Race < ApplicationRecord
  has_many :sub_races
  has_many :ability_score_increases
end
