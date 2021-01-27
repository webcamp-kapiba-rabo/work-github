class Admin::ProductsController < ApplicationController
  before_action :authenticate_admin!
   PER = 10

  def top
    @orders = Order.page(params[:page]).per(PER)
  end

  def index
    @products = Product.page(params[:page]).per(PER)
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
    flash[:create] = "商品情報を追加しました"
    redirect_to admin_product_path(@product)
    else
      @products = Product.all
      render ("admin/products/new")
    end
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
    flash[:update] = "商品情報を更新しました"
    redirect_to admin_product_path(@product)
    else
      @products = Product.find(params[:id])
      render ("admin/products/edit")
    end
  end

  private
  def product_params
  params.require(:product).permit(:genre_id, :name, :body, :excluding_tax_price, :image, :sale_status)
  end


end
