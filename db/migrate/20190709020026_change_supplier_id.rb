class ChangeSupplierId < ActiveRecord::Migration[6.0]
  def change
    change_column :products, :supplier_id, "numeric USING CAST(price AS numeric)"
  end
end
