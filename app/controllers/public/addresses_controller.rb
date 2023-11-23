class Public::AddressesController < ApplicationController
  
  def index
    @addresses = Address.where(customer_id: current_customer.id)
    @address = Address.new
  end
  
  def edit
    @address = Address.find(params[:id])
  end
  
  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to request.referer
    else
      @addresses = Address.where(customer_id: current_customer.id)
      render 'index'
    end
  end
  
  def update
    @address = Address.find(params[:id])
    if @address.update(address_params)
      redirect_to addresses_path(current_customer)#, notice: "You have updated book successfully."
    else
      render "edit"
    end
  end
  
  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to request.referer
  end
  
  private

  def address_params
    params.require(:address).permit(:name, :postcode, :address)
  end
  
end
