class Admin::ItemsController < ApplicationController
  before_action :authenticate_admin!
  # before_action :ensure_correct_admin, only: [:edit, :update]
    
    def new
    @item = Item.new
    @genres = Genre.all
    
    end
  
  def create
    item = Item.new(item_params)
    item.save
      redirect_to admin_item_path(item.id)
  end
  
  def index 
    @items = Item.page(params[:page])
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
  
  # def ensure_correct_admin
    # @item = Item.find(params[:id])
  # unless current_admin
      # redirect_to new_admin_session_path
  # end
  # end
 
end
