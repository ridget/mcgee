class Party < ApplicationRecord
  has_many :members, class_name: "PlayerCharacter"
end
