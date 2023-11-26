class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  def index
    @cart_items = current_customer.cart_items
        #カートに入っている商品画像のリスト
    # @product_images = ActiveStorage::Attachment.where(record_type:"Product", record_id: @cart_items)
  end


  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    flash[:notice] = "カート内の商品が更新されました。"
    redirect_back(fallback_location: items_path)
  end




  # 最後のredirectは削除。カート追加エラー解消のため
  def create
    amount = cart_item_params[:amount]
    item_id = cart_item_params[:item_id]
    if cart_item = CartItem.find_by(item_id: item_id)
      amount = cart_item.amount + amount.to_i
      cart_item.update(amount: amount)
      redirect_to cart_items_path
    else
      @cart_item = CartItem.new(cart_item_params)
  		if @cart_item.save
  			redirect_to cart_items_path
  		else
  			redirect_to request.referer
  		end
    end
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_item = current_customer.cart_items
    cart_item.destroy_all
    redirect_to cart_items_path
  end

  private
  def cart_item_params
   params.require(:cart_item).permit(:item_id, :amount, :customer_id, :image)# customer_id追記（みかん）
  end
end
