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

  private
  def cart_item_params
   params.require(:cart_item).permit(:item_id, :amount)
  end
end
