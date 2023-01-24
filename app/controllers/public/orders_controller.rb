class Public::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @order_items = OrderItem.all
  end
  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.all
  end
  private

  def order_params
    params.require(:order).permit(:address, :postal_code, :name, :total_payment, :status)
  
  def new
    
  end


  end
end  
