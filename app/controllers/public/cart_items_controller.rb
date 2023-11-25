class Public::CartItemsController < ApplicationController

  def index
    @cart_items = current_customer.cart_items

  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    flash[:notice] = "カート内の商品が更新されました。"
    redirect_back(fallback_location: items_path)
  end

  def destroy_all
    cart_item = CartItem.find(params[:id])
    cart_item.destroy_all
    redirect_to '/items'
  end

  
  # みかん記載。item.showページから商品をカート追加するために必要
  def create
    cart_item = CartItem.new(cart_item_params)
		if cart_item.save
			redirect_to cart_items_path 
		else
			flash[:notice] = "個数を選択してください"
			redirect_to request.referer
		end
  end
  
  private
  def cart_item_params
   params.require(:cart_item).permit(:item_id, :amount, :customer_id)# customer_id追記（みかん）
  end
end
