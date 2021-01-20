class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.integer "genre_id"
      t.string "name", null: false
      t.text "body"
      t.integer "excluding_tax_price", null: false
      t.string "image_id"
      t.boolean "sale_status", null: false
      t.timestamps
    end
  end
end
