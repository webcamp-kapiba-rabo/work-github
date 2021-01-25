class Public::OrdersController < ApplicationController

    def new
    end

    def show
        @order = Order.find(params[:id])
        @order_products = @order.order_products
    end

    def index
        @orders = Order.where(customer_id:current_customer)
    end

    def create
    end




end
