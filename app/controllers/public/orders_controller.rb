class Public::OrdersController < ApplicationController
  def index
    @orders = Order.where(customer_id: current_customer.id)
    @order_items = OrderItem.where(customer_id: current_customer.id)
  end
  
  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(customer_id: current_customer.id)
  end

  def create
  end

  def new
    @order = Order.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  
  def confirm
    @cart_items = current_customer.cart_items
    @confirm_order = Order.new(order_params)
    if params[:order][:select_address] == "0"
      @confirm_order.address = current_customer.address
      @confirm_order.postal_code = current_customer.postal_code
      @confirm_order.name = "#{current_customer.last_name + current_customer.first_name}"
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @confirm_order.postal_code = @address.postal_code
      @confirm_order.address = @address.address
      @confirm_order.name = @address.name
    # @order = Order.new(params[:id])
    # @order.save
    # redirect_to orders_path
    end
    # @order = Order.new(order_params)
    # @order.postal_code = current_customer.postal_code
    # @order.address = current_customer.address
    # @order.name = current_customer.first_name + current_customer.last_name
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :name, :total_payment, :status)
  end

end

