class Public::CartProductsController < ApplicationController
  before_action :authenticate_customer!
  
  before_action :set_customer
  
  def index
    @cart_products = CartProduct.where(customer_id: @customer.id)
  end
  
  def create
     @cart_product = CartProduct.new(cart_products_params)
    @cart_product.customer_id = @customer.id
    
    @update_cart_product =  CartProduct.find_by(product: @cart_product.product)
    if @update_cart_product.present? && @cart_product.valid?
        @cart_product.amount += @update_cart_product.amount
        @update_cart_product.destroy
    end
    
      @cart_product.save
      redirect_to cart_products_path
  end
  
  def update
   @cart_product = CartProduct.find( params[:id])
    @cart_product.update(cart_products_params)
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @cart_product = CartProduct.find( params[:id])
    @cart_product.destroy
    redirect_back(fallback_location: root_path)
  end
  
  def all_destroy
    @cart_products = CartProduct.where(customer_id: @customer.id)
    @cart_products.destroy_all
    redirect_back(fallback_location: root_path)
  end
  
  private
  
  def set_customer
    @customer = current_customer
  end
  
  def cart_products_params
    params.require(:cart_product).permit(:product_id ,:amount)
  end

  
end
