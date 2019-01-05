class CreatePlayerCharacterFeats < ActiveRecord::Migration[5.2]
  def change
    create_table :player_character_feats, id: :uuid do |t|
      t.references :player_character, foreign_key: true, null: false, type: :uuid
      t.references :feat, foreign_key: true, null: false, type: :uuid
      t.references :feat_ability_score_increase, foreign_key: {to_table: :feat_ability_score_increase_options}, null: true, type: :uuid

      t.timestamps
    end
  end
end
