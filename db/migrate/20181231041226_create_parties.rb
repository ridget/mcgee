class CreateParties < ActiveRecord::Migration[5.2]
  def change
    create_table :parties, id: :uuid do |t|
      t.string :name

      t.timestamps
    end
  end
end
