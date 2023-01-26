class Public::CartItemsController < ApplicationController
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    if CartItem.find_by(customer_id: current_customer.id, item_id: @cart_item.item_id)
      @add_cart_item = CartItem.find_by(customer_id: current_customer.id, item_id: @cart_item.item_id)
      @add_cart_item.amount += @cart_item.amount
      @cart_item.save
      redirect_to cart_items_path
    else
      @cart_item.save
      redirect_to cart_items_path
    end
  end
  
  def index
    @cart_items = CartItem.where(customer_id: current_customer.id)
    # @cart_item = CartItem.find(params[:id])
    # @item.with_tax_price
  end
  
  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end
  
  def destroy_all
    current_customer.cart_items.destroy_all
    redirect_to cart_items_path
  end
  
  def destroy
    item = CartItem.find(params[:id])
    item.destroy
    redirect_to cart_items_path
  end
  
  
    
  
  private
  
  def cart_item_params
    params.require(:cart_item).permit(:customer_id, :item_id, :amount)
  end
end
