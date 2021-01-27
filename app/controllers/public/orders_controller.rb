class Public::OrdersController < ApplicationController
    def show
        @order = Order.find(params[:id])
        @order_products = @order.order_products
    end

    def index
        @orders = Order.all


    end

    def new
        @order = Order.new
        @select_address = current_customer.addresses.pluck(:address, :id)
    end
    # |
    # クレジットor銀行払い, 住所
    # ↓
    def verification
        #  Parameters:
            # {"order"=>{
                # "payment_method"=>"クレジットカード",
                # "selected_address"=>"", "address_option"=>"3",
                # "postcode"=>"11111",
                # "address"=>"住所",
                # "name"=>"あああ"}}

        @order = Order.new
        @order.name = current_customer.family_name  + current_customer.first_name
        # ...

        # 自分の住所
        if params[:order][:address_option] == "1"
            @order.name = current_customer.family_name+current_customer.first_name
            @order.address = current_customer.address
            @order.postcode = current_customer.postcode
        end

        #  既存の住所
        if params[:order][:address_option] == "2"
            existing_address = current_customer.addresses.find(params[:order][:selected_address].to_i)
            @order.name = existing_address.name
            @order.address = existing_address.address
            @order.postcode = existing_address.postcode
        end

        #  新しい住所
        if params[:order][:address_option] == "3"
            # 新規住所も作成
            address = Address.new
            address.postcode = params[:order][:postcode]
            address.address = params[:order][:address]
            address.name = params[:order][:name]
            address.customer_id = current_customer.id
            address.save

            @order.name = params[:order][:name]
            @order.postcode = params[:order][:postcode]
            @order.address = params[:order][:address]
        end



        @cart_products = current_customer.cart_products
       # binding.pry
    end
    # |
    # クレジットor銀行払い, 住所
    # ↓
    def create
        # binding.pry
        @order = current_customer.orders.new(order_params)
        @order.save
        @cart_products = current_customer.cart_products
        @cart_products.each do |cart_product|

            @order_product = @order.order_products.new
            @order_product.product_id = cart_product.product.id
            @order_product.amount = cart_product.amount
            @order_product.including_tax_price = cart_product.product.excluding_tax_price * 1.1
            @order_product.save
        end
        current_customer.cart_products.destroy_all
        redirect_to orders_done_path
    end

    def done
    end

    private
  def order_params
  params.require(:order).permit(:postcode, :billing_amount, :name, :address )
  end
end
