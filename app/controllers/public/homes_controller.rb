class Public::HomesController < ApplicationController
  
  def top
    @products = Product.all.order(created_at: :asc)
  end
  
  def about
  end
  
end
