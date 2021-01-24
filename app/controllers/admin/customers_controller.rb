class Admin::CustomersController < ApplicationController
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
    @Customer.update(user_params)
    redirect_to admin_customer_path(@customer.id)
  end
  
end
