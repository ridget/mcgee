class CreateAbilityScores < ActiveRecord::Migration[5.2]
  def up
    execute <<-DDL
          CREATE TYPE ability_name AS ENUM (
            'STR', 'DEX', 'CON', 'INT', 'WIS', 'CHA'
          );
        DDL

    create_table :ability_scores, id: :uuid do |t|
      t.references :player_character, foreign_key: true, type: :uuid, null: false
      t.column :ability, :ability_name, null: false
      t.column :score, :integer, null: false
      t.timestamps
    end
  end

  def down
    drop_table :ability_scores
    execute "DROP type ability_name;"
  end
end
