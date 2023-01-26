class Public::ItemsController < ApplicationController

  def index
    @items = Item.where(is_active: 'true').page(params[:page]).per(8)

  end
  
  
  
  def show
    # @cart_item = CartItem.new(cart_item_params)
    @item = Item.find(params[:id])
    @item.with_tax_price
    @cart_item = CartItem.new(@items_params)
  end
end
