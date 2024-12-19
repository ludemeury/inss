class CreateProponents < ActiveRecord::Migration[8.0]
  def change
    create_table :proponents do |t|
      t.string :name
      t.date :birthdate
      t.decimal :income

      t.timestamps
    end
  end
end
