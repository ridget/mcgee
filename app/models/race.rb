class Race < ApplicationRecord
  has_many :sub_races
  has_many :racial_bonuses
end
