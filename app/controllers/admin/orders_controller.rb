class Admin::OrdersController < ApplicationController

  def index
    @orders = Order.all.page(params[:page]).per(10)
  end

  def show
    @order = Order.find(params[:id])
    @selected_status = @order.status
    @order_detail = @order.order_details
    # @order_detail = OrderDetail.where(order_id: @order.id, created_at: @order.created_at)
  end

  def update
    @order = Order.find(params[:id])
    @order.status = params[:status]
    @order.update(order_params)
    redirect_to request.referer
  end


  private

  def order_params
    params.require(:order).permit(:status)
  end

end
