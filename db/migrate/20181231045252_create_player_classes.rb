class CreatePlayerClasses < ActiveRecord::Migration[5.2]
  def change
    create_table :player_classes do |t|
      t.references :player_character, type: :uuid, foreign_key: true, null: :false
      t.references :playable_class, type: :uuid, foreign_key: true, null: false

      t.timestamps
    end
  end
end
