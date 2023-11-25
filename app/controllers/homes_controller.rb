class HomesController < ApplicationController
  before_action :authenticate_customer!
  def top
    @items = Item.where(is_saled: true).order(created_at: :desc)
  end

  def about
  end
end


    # def top
    # 	items = Item.where(is_selling: true)
    #   @recomend_items = items.limit(9).order(updated_at: "DESC")
    #   if customer_signed_in?
    #     @cart_items = CartItem.where(customer_id:[current_customer.id])
    #   end
    # end

