class Public::AddressesController < ApplicationController

    def index
        @addresses = Address.all
        @address = Address.new
    end

    def create
        @address = Address.new(address_params)
        @address.customer_id = current_customer.id
        @address.save
       redirect_to addresses_path, notice: "配送先を登録しました"
    end

    def edit
        @address = Address.find(params[:id])
    end

    def update
        @address = Address.find(params[:id])
        @address.update(address_params)
        redirect_to addresses_path(@address.id), notice: "配送先を変更しました"
    end

    def destroy
        @address = Address.find(params[:id])
        @address.destroy
        # @addresses = current_customer.address
        redirect_to addresses_path, notice: "配送先を削除しました"
    end



 private
  def address_params
    params.require(:address).permit(:postcode, :address, :name)
  end
end
