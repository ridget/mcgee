class AddRaceToPlayerCharacters < ActiveRecord::Migration[5.2]
  def change
    add_reference :player_characters, :race, type: :uuid, foreign_key: true
  end
end
