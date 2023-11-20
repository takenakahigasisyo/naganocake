class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
    @genre = Genre.all
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end
  
  def show
    
  end
  
  def edit
    
  end
  
  
  def update
    
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :genre_id, :price, :explanation, :is_saled, :item_image)
  end
  
end
