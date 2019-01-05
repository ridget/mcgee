class CreateRaces < ActiveRecord::Migration[5.2]
  def change
    create_table :races, id: :uuid do |t|
      t.string :type
      t.string :name
      t.column :parent_race_id, :uuid, null: true
      t.foreign_key :races, column: :parent_race_id
      t.text :description

      t.timestamps
    end
  end
end
