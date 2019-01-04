class PlayerClass < ApplicationRecord
  belongs_to :player_character
  belongs_to :playable_class, class_name: "PlayableClass"
end
