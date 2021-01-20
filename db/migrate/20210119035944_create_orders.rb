class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.integer "customer_id"
      t.integer "delivery_fee", null: false,default: 800
      t.integer "billing_amount", null: false
      t.boolean "payment_method", null: false,default: 0
      t.integer "order_status", null: false,default: 0
      t.string "name", null: false
      t.integer "customer_id"
      t.string "postcode", null: false
      t.string "address", null: false
      t.string "name", null: false
      t.timestamps
    end
  end
end
