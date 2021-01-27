class ChangeDataAmountToCartProducts < ActiveRecord::Migration[5.2]
  def up
    change_column :cart_products, :amount, :integer, default: 0
  end
  
  def down
    change_column :cart_products, :amount, :string, default: "0"
  end
end
