class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  PER = 10
  
  def index
    @customers = Customer.page(params[:page]).per(PER)
  end
  
  def show
    @customer = Customer.find(params[:id])
  end
  
  def edit
    @customer = Customer.find(params[:id])
  end
  
  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to admin_customer_path(@customer.id)
  end
  
  private
  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email, :membership_status)
  end
  
end
