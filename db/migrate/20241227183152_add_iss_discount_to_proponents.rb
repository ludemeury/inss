class AddIssDiscountToProponents < ActiveRecord::Migration[8.0]
  def change
    add_column :proponents, :inss_discount, :decimal
  end
end
