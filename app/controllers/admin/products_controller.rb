class Admin::ProductController < ApplicationController
  
  def top
  end
  
  def index
    @products = product.all
    @product = Product.new
  end
  
  def show
  end
  
  def edit
  end
  
  def new
  end
  
  def create
  end
  
  def update
  end
    
  
end
