class Admin::GenreController < ApplicationController

  def index
    @products = Product.all
    @product = Product.new
  end

  def edit
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to request.referer
  end

  def update
    @product = Product.find(params[:id])
    @product.update(product_params)
    redirect_to admin_genres_path
  end

  private
  def product_params
  params.require(:product).permit(:name)
  end

end
