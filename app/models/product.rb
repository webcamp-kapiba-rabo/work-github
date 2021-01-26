class Product < ApplicationRecord
    belongs_to :genre
    has_many :cart_products, dependent: :destroy
    has_many :order_products, dependent: :destroy
    attachment :image_id
    
    def including_tax_price
        (self.excluding_tax_price * 1.1).floor
    end
    
end
