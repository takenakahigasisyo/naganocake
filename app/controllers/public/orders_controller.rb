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
        @order.name = @current.first_name + @current.last_name
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
    @order.customer_id = current_customer.id
    @order.save
    @cart_items = current_customer.cart_items
    @cart_items.each do |cart_item|
     @order_detail = OrderDetail.new
     @order_detail.order_id = @order.id
     @order_detail.item_id = cart_item.item_id
     @order_detail.amount = cart_item.amount
     @order_detail.price_on_order = cart_item.item.tax_calc
     @order_detail.save
    end
    redirect_to orders_completion_path
   end

   def completion
   end

  def index
   @orders = Order.all
  end

  def show
   @order = Order.new
   @order_show = Order.find(params[:id])
  end

private
 def order_params
   params.require(:order).permit(:payment_method, :postcode, :address, :name, :shipping_fee, :billing_amount, :address_option, :address_id)
 end
end