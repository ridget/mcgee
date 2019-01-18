class PlayerCharacterSpell < ApplicationRecord
  belongs_to :player_character
  belongs_to :spell
end
