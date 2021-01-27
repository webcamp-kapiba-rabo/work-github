module Public::CartProductsHelper
    
    def total_price(cart_products)
        price = 0
        cart_products.each do |cart_product|
          price  +=  cart_product.amount.to_i * (cart_product.product.excluding_tax_price.to_i * 1.1).floor
        end
        return price
    end
    
end
