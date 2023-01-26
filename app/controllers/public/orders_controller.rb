class Public::OrdersController < ApplicationController
  def index
    @orders = Order.all
    @order_items = OrderItem.all
  end
  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.all
  end

  def create
    @order = Order.new(params[:id])
    @order.save
    redirect_to orders_path
  end

  def new



    @order = Order.new(customer_id: current_customer.id)
    

  end


  def cofirm
    @order = Order.new(order_params)
    @order.postal_code = current_customer.postal_code
    @order.address = current_customer.address
    @order.name = current_customer.first_name + current_customer.last_name
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_payment, :status)
  end

end

