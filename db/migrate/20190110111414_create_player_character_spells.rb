class CreatePlayerCharacterSpells < ActiveRecord::Migration[5.2]
  def change
    create_table :player_character_spells, id: :uuid do |t|
      t.references :player_character, foreign_key: true, type: :uuid, null: false, index: true
      t.references :spell, foreign_key: true, type: :uuid, null: false, index: true
      t.boolean :prepared, null: false, default: false

      t.timestamps
    end
  end
end
