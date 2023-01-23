class Public::CartItemsController < ApplicationController
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cat_item.user_id = current_user.id
    @cart_item.save
    redirect_to cart_item_path
  end
  
  def index
    @cart_items = CartItem.all
    # @cart_item = CartItem.find(params[:id])
    # @item.with_tax_price
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(item_params)
    redirect_to cart_items_path
  end
  
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to 'cart_items/index'
  end
    
  
  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount, :created_at, :update_at, :item_id, :amount)
  end
end
