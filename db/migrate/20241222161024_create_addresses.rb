class CreateAddresses < ActiveRecord::Migration[8.0]
  def change
    create_table :addresses do |t|
      t.references :addressable, polymorphic: true, null: false
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code
      t.integer :number
      t.string :complement
      t.string :district
      t.string :kind

      t.timestamps
    end
  end
end
