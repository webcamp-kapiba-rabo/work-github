class Product < ApplicationRecord
    belongs_to :genre
    has_many :cart_products, dependent: :destroy
    has_many :order_products, dependent: :destroy
    attachment :image

    validates :name, length:  { in: 1..20 }, presence: true
    validates :body, length: { maximum: 50 }, presence: true
    validates :excluding_tax_price, length: { in: 1..7 }, presence: true
    validates :sale_status, inclusion: { in: [true, false] }

    def self.search(search)
      return Product.all unless search
      Product.where(['content LIKE ?', "%#{search}%"])
    end
    
    def including_tax_price
        (self.excluding_tax_price * 1.1).floor
    end

end
