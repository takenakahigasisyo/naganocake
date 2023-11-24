class Public::OrdersController < ApplicationController
 def new
   @order = Order.new
   @customer = current_customer
 end

 def confirm
    @current = current_customer
    @shipping_fee = 800
    @cart_items = current_customer.cart_items
    @order = Order.new(order_params)
   if params[:order][:address_option] == "0"
        @order.postcode = @current.postcode
        @order.address = @current.address
        @order.name = @current.first_name + @current.first_name
   elsif params[:order][:address_option] == "1"
        address = Address.find(params[:order][:address_id])
        @order.name = address.name
        @order.address = address.address
        @order.postcode = address.postcode
   elsif params[:order][:address_option] = "2"
        @order.postcode = params[:order][:postcode]
        @order.address = params[:order][:address]
        @order.name = params[:order][:name]
   else
        render 'new'
   end

 end

   def create
    @order = Order.new(order_params)
    @order.save
    @cart_items.each do |cart_item|
     @order_detail = OrderDetail.new
     @order_detail.order_id = @order.id
     @order_detail.item_id = cart_item.item_id
     @order_detail.amount = cart_item.amout
     @order_detail.price_on_order = cart_item.item.price.tax_calc
     @order_detail.save
    end
    redirect_to orders_completion_path
   end

   def completion
   end

  def index
   @order = Order.new
   @orders = Order.all
  end

private
 def order_params
   params.require(:order).permit(:payment_method, :postcode, :address, :name, :shipping_fee, :billing_amount, :address_option, :address_id)
 end
end
