class Public::ProductsController < ApplicationController

  def index
    @products = Product.all
    # 上を消して、@products = Product.page(params[:page]).reverse_orderを追加？
    # admin側の商品データがpublic側に反映されるはず？
  end

  def show
    @product = Product.find(params[:id])
    @cart_product = CartProduct.new
  end

end
