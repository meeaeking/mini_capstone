class ChangeSupplierIdInteger < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :supplier_id, :integer
  end
end
