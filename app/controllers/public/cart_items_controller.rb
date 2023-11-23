class Public::CartItemsController < ApplicationController
  def index
    @cart_item = CartItem.find(params[:id])
  end
  
  def destroy_all
    cart_item = CartItem.find(params[:id])
    cart_item.destroy_all
    redirect_to '/items'
    
    
  end
end
