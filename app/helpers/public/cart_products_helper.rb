module Public::CartProductsHelper
    
    def total_price(products)
        price = 0
        products.each do |product|
          price  +=  self.amount.to_i * (product.excluding_tax_price.to_i * 1.1).floor
        end
        return price
    end
    
end
