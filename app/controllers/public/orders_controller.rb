class Public::OrdersController < ApplicationController
 def new
   @order = Order.new
   @customer = current_customer
   @address = @customer_address
 end

 def confirm
    @order = Order.new(order_params)
   if order_params[:order][:address_option] == "0"
        @order.postcode = current_customer.postcode
        @order.address = current_customer.address
        @order.name = current_customer.name
   elsif params[:order][:address_option] == "1"
        @addresses = Address.all
        @address_confirm = Address.find(params[:order][:address_id])
   elsif params[:order][:address_option] = "2"
        @order.postcode = params[:order][:postcode]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
   else
        render 'new'
   end
 end



private
 def order_params
   params.require(:order).permit(:payment_method, :postcode, :address, :name, :shipping_fee, :billing_amount, :address_option, :address_id)
 end
end
