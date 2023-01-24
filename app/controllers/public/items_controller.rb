class Public::ItemsController < ApplicationController

  def index
    @items = Item.all

  end
  
  
  
  def show
    @item = Item.find(params[:id])
    @item.with_tax_price
  end
end
