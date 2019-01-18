class PlayerCharacter < ApplicationRecord
  belongs_to :race
  belongs_to :party
  has_one :player_class
  has_many :ability_scores
  has_many :party_members, ->(player_character) { where.not(id: player_character.id)}, through: :party, class_name: "PlayerCharacter", source: :members
  has_many :ability_score_increases, through: :race
  has_many :player_character_feats
  has_many :feats, through: :player_character_feats
  has_many :feat_ability_score_increases, through: :player_character_feats
  has_many :player_character_spells, class_name: "PlayerCharacterSpell"
  has_many :prepared_player_character_spells, -> { where(prepared: true) }, class_name: "PlayerCharacterSpell"
  has_many :prepared_spells, through: :prepared_player_character_spells, class_name: "Spell", source: :spell
  has_many :known_spells, through: :player_character_spells, class_name: "Spell", source: :spell
end
