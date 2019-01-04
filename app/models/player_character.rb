class PlayerCharacter < ApplicationRecord
  belongs_to :party
  has_many :party_members, ->(player_character) { where.not(id: player_character.id)}, through: :party, class_name: "PlayerCharacter", source: :members
  has_one :player_class
  has_many :ability_scores
end
