class CreateProponentDocuments < ActiveRecord::Migration[8.0]
  def change
    create_table :proponent_documents do |t|
      t.string :document
      t.string :kind
      t.references :proponent, null: false, foreign_key: true

      t.timestamps
    end
  end
end
