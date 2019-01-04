class AddPartyIdToPlayerCharacters < ActiveRecord::Migration[5.2]
  def change
    add_reference :player_characters, :party, type: :uuid, foreign_key: true
  end
end
