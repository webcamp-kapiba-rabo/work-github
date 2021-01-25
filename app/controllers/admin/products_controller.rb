class Admin::ProductController < ApplicationController
  
  def top
    @orders = Order.all
  end
  
  def index
    @products = product.all
    @product = Product.new
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
    redirect_to book_path(@book_new.id)
  end
  
  def update
     @product = Product.find(params[:id])
     @product.update(product_params)
     redirect_to admin_product_path(@product)
  end
  
  private
  def product_params
  params.require(:product).permit(:name, :body, :excluding_tax_price, :image, :sale_status)
  end
    
  
end
