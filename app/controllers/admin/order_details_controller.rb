class Admin::OrderDetailsController < ApplicationController
  
  def update
    @order_detail = OrderDetail.find(params[:id])
    @order = @order_detail.order # OrderDetailに関連するOrderを取得
    @order_details = @order.order_details # Orderに関連する全てのOrderDetailを取得
    @order_detail.making_status = params[:making_status]
    @order_detail.update(order_detail_params)
    if @order_details.all? { |detail| detail.making_status == "production_completed" } # 全てのOrderDetailのmaking_statusが "製作完了" であれば
      @order.update(status: "preparation_shipping") # Orderのstatusを "発送準備中" に更新
    end
    redirect_to request.referer
  end
  
  private

  def order_detail_params
    params.require(:order_detail).permit(:making_status)
  end
  
end
