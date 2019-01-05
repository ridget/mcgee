class CreateFeatAbilityScoreIncreaseOptions < ActiveRecord::Migration[5.2]
  def change
    create_table :feat_ability_score_increase_options, id: :uuid do |t|
      t.references :feat, foreign_key: true, type: :uuid, null: false
      t.integer :ability_score_bonus, null: false
      t.column :ability, :ability_name, null: false

      t.timestamps
    end
  end
end
