class Public::ProductsController < ApplicationController
  before_action :authenticate_customer!,except: [:index]
  PER = 10

  def index
    @products = Product.page(params[:page]).per(PER)
    # 上を消して、@products = Product.page(params[:page]).reverse_orderを追加？
    # admin側の商品データがpublic側に反映されるはず？
  end

  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
    @update_cart_product =  CartProduct.find_by(product: @product, customer: current_customer)
    @cart_products = CartProduct.where(customer_id: current_customer.id)
  end

end
