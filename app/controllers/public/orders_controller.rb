class Public::OrdersController < ApplicationController
    before_action :authenticate_customer!
    
    def show
        @order = Order.find(params[:id])
        @order_products = @order.order_products
    end

    def index
        @orders = Order.where(customer_id:current_customer)
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
    end
    # |
    # クレジットor銀行払い, 住所
    # ↓
    def create
    end

    def done
    end
end
