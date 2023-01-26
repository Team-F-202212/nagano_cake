class Public::ItemsController < ApplicationController

  def index
    @items = Item.all
    # @images = Images.all
  end
  
  
  
  def show
    # @cart_item = CartItem.new(cart_item_params)
    @item = Item.find(params[:id])
    @item.with_tax_price
    @cart_item = CartItem.new(@items_params)
  end
end
