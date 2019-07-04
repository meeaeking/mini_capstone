class MakeChanges < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :description
    change_column :products, :price, :decimal, precision: 5, scale: 2
  end
end
