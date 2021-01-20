class CreateOrderProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :order_products do |t|
      t.integer "order_id"
      t.integer "product_id"
      t.integer "amount", null: false
      t.integer "including_tax_price", null: false
      t.integer "making_status", null: false, default: 0
      t.timestamps
    end
  end
end
