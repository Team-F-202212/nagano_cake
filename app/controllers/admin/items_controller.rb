class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
    
    def new
    @item = Item.new
    @genres = Genre.all
    
    end
  
  def create
    item = Item.new(item_params)
    item.save
      redirect_to admin_items_path
  end
  
  def index
      @items = Item.all
  end
  
  def show
    @item = Item.find(params[:id])
    @item.with_tax_price
    
    
  end
  
  def edit
    @genres = Genre.all
    @item = Item.find(params[:id])
  
  end
  
  def update
    item = Item.find(params[:id])
    item.update(item_params)
    redirect_to admin_item_path(item.id)
  end
  
  
  private 
  
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price, :genre_id, :is_active)
  end
  
  
end
