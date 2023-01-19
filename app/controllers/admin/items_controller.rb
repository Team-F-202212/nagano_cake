class Admin::ItemsController < ApplicationController
    
    def new
    @item = Item.new
    @genres = Genre.all
    
    end
  
  def create
    item = Item.new(item_params)
    item.genre_id = genre.id
    item.save
    redirect_to admin_items_path
    
  end
  
  def index
      @items = Item.all
    
  end
  
  def edit
  
  end
  
  def update
    
  end
  
  def destroy
  
  end
  
  
  private 
  
  def item_params
    params.require(:item).permit(:image, :name, :introduction, :price)
  end
  
  
end
