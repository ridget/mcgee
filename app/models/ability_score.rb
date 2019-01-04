class AbilityScore < ApplicationRecord
  ABILITY_LABELS = {"STR" => "Strength", "DEX" => "Dexterity", "CON" => "Constitution", "INT" => "Intelligence", "WIS" => "Wisdom", "CHA" => "Charisma"}

  belongs_to :player_character
end
