class CreatePlayerCharacters < ActiveRecord::Migration[5.2]
  def change
    create_table :player_characters, id: :uuid do |t|
      t.string :name, null: false
      t.string :hair
      t.string :eyes
      t.integer :age
      t.integer :level, default: 1, null: false
      t.timestamps
    end
  end
end
