class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @orders = Order.all.page(params[:page]).per(10) #perの値を3から10に変えました。
  end
  
  
end
