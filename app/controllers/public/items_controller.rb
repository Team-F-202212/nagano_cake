class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    @genres = Genre.all
  end
  
  
  
  def show
    @item = Item.find(params[:id])
    @item.with_tax_price
    @cart_item = CartItem.new(item_id: @item.id)
  end
end
