class Admin::ProductsController < ApplicationController
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
    @product.save
    redirect_to admin_product_path(@product)
  end
  
  def update
     @product = Product.find(params[:id])
     @product.update(product_params)
     redirect_to admin_product_path(@product)
  end
  
  private
  def product_params
  params.require(:product).permit(:genre_id, :name, :body, :excluding_tax_price, :image, :sale_status)
  end
    
    
end
