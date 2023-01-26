class Public::CartItemsController < ApplicationController
  
  def create
    
    @cart_item = CartItem.new(cart_item_params)

    @cart_item.customer_id = current_customer.id

    @cart_item.save
    redirect_to cart_items_path
  end
  
  def index
    @cart_items = CartItem.all
    # @cart_item = CartItem.find(params[:id])
    # @item.with_tax_price
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end
  
  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to 'cart_items/index'
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all
    item.destroy_all
    redirect_to cart_items_path
  end
    
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
end
