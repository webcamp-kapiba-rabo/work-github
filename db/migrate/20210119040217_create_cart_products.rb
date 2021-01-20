class CreateCartProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :cart_products do |t|
      t.integer "product_id"
      t.integer "customer_id"
      t.string "amount", null: false, default: 0
      t.timestamps
    end
  end
end
