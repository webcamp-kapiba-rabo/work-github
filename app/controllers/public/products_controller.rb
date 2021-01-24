class Public::ProductController < ApplicationController

  def index
    @products = Product.all
    @product = Product
    # 上を消す？@products = Product.page(params[:page]).reverse_order
    # admin側の商品データがpublic側に反映されるはず？
  end

  def show
    @admin_product = product.find(params[:id])
  end

end
