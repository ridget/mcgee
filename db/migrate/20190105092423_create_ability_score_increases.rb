class CreateAbilityScoreIncreases < ActiveRecord::Migration[5.2]
  def change
    create_table :ability_score_increases, id: :uuid do |t|
      t.references :race, foreign_key: true, type: :uuid, null: false
      t.integer :ability_score_bonus, null: false
      t.column :ability, :ability_name, null: false

      t.timestamps
    end
  end
end
