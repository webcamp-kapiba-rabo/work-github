class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @customer = current_customer
  end
    
  def edit
    @customer = current_customer
  end
    
  def update
    customer = current_customer
    customer.update(customer_params)
    redirect_to customer_path
  end
    
  def quit
  end
  
  def goodbye
    @customer = current_customer
    @customer.update(membership_status: false)
    reset_session
    redirect_to root_path
  end
  
  
  private
  def customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postcode, :address, :phone_number, :email, :membership_status)
  end
    
  
end