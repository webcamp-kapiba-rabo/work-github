class Admin::OrdersController < ApplicationController

  def show
    @order = Order.find(params[:id])
    @order_products = @order.order_products.all
  end

  def index
    @orders = Order.all
    @order = Customer.find.(params[:id]).order.page(params[:page])
  end


end
