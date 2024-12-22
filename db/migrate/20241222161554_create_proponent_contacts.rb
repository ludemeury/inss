class CreateProponentContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :proponent_contacts do |t|
      t.string :value
      t.string :kind
      t.references :proponent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
