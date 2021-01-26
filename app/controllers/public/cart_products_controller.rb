class Public::CartProductsController < ApplicationController
  
  before_action :set_customer
  
  def index
    @cart_products = CartProduct.where(customer_id: @customer.id)
  end
  
  def create
     @cart_product = CartProduct.new(cart_products_params)
    @cart_product.customer_id = @customer.id
    redirect_to cart_products_path
  end
  
  def update
    @cart_products = CartProduct.where(customer_id: @customer.id)
    @cart_products.update(cart_products_params)
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    CartProducts.find_by(customer_id: @customer.id, product_id: params[:product_id]).destroy
    redirect_back(fallback_location: root_path)
  end
  
  def all_destroy
    CartProducts.where(customer_id: @customer.id).destroy
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
