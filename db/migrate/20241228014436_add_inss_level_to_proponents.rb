class AddInssLevelToProponents < ActiveRecord::Migration[8.0]
  def change
    add_column :proponents, :inss_level, :string
  end
end
