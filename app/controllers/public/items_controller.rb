class Public::ItemsController < ApplicationController

  def index
    @items = Item.where(is_active: 'true').page(params[:page]).per(8)
    @genres = Genre.all
  end
  
  
  
  def show
    @genres = Genre.all
    # @cart_item = CartItem.new(cart_item_params)
    @item = Item.find(params[:id])
    @item.with_tax_price
    @cart_item = CartItem.new(item_id: @item.id)
  end
end
