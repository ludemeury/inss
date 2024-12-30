class CreateProponentReports < ActiveRecord::Migration[8.0]
  def change
    create_table :proponent_reports do |t|
      t.string :indicator
      t.decimal :amount

      t.timestamps
    end
  end
end
