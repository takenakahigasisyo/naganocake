class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @customer = current_customer
    @customer_name = @customer.last_name + @customer.first_name
    @customer_furigana = @customer.last_name_furigana + @customer.first_name_furigana
    @postcode = @customer.postcode
    @address = @customer.address
    @phone_number = @customer.phone_number
    @email = @customer.email
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_my_page_path(@customer), notice: "マイページを変更しました。"
    else
      render "edit"
    end
  end

  def confirm
  end

  def leave
    @customer = current_customer
    @customer.update(is_active: false)
    reset_session
    flash[:notice] = "退会しました"
    redirect_to root_path
  end


  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name,:last_name_furigana,:first_name_furigana,:email,:postcode,:address,:phone_number,:encrypted_password)
  end

end


