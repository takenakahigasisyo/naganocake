class Admin::ItemsController < ApplicationController
  
  def index
    @items = Item.all.page(params[:page]).per(10)
  end
  
  def new
    @item = Item.new
    @genre = Genre.all
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path(@item)
    else
      @genre = Genre.all
      render 'new'
    end
  end
  
  def show
    @item = Item.find(params[:id])
    @tax_included_price = @item.price * 1.1
  end
  
  def edit
    @item = Item.find(params[:id])
    @genre = Genre.all
    @selected_genre_id = @item.genre.id
  end
  
  
  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path(@item.id)
    else
      @genre = Genre.all
      render "edit"
    end
  end
  
  private

  def item_params
    params.require(:item).permit(:name, :genre_id, :price, :explanation, :is_saled, :item_image)
  end
  
end
