class Public::OrdersController < ApplicationController
  def index
    @orders = Order.where(customer_id: current_customer.id)
    # @order_items = OrderItem.where(order_id: @order.id)
  end
  
  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  def create
    order = Order.new(order_params)
    order.customer_id = current_customer.id
    order.save
    cart_items = current_customer.cart_items
    cart_items.each do |cart_item|
      order_items = order.order_items.new
      order_items.item_id = cart_item.item_id
      order_items.amount = cart_item.amount
      order_items.price = (cart_item.item.price * 1.1).to_i
      order_items.making_status = "not_make"
      order_items.save
    end
    current_customer.cart_items.destroy_all
    redirect_to complete_path
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
    params.require(:order).permit(:postage, :payment_method, :postal_code, :address, :name, :total_payment, :status)
  end

end

