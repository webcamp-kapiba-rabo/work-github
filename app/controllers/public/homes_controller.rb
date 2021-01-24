class Public::HomesController < ApplicationController
  
  def top
    @admin_products = Product.all
  end
  
  def about
  end
  
end
