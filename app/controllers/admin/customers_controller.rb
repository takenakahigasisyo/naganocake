class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
      @customers = Customer.page(params[:page]).per(10)
  end

  def show
    @customer = Customer.find(params[:id])
    @customer_name = @customer.last_name + @customer.first_name
  end

  def edit
    @customer = Customer.find(params[:id])
    @customer_name = @customer.last_name + @customer.first_name
  end
  
  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to admin_customer_path(@customer), notice: "会員情報編を変更しました。"
    else
      render "edit"
    end
  end
  
  
  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name,:last_name_furigana,:first_name_furigana,:email,:postcode,:address,:phone_number,:encrypted_password,:is_active)
  end
end
