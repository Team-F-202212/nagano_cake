class Admin::OrdersController < ApplicationController
    def show
        @order = Order.find(params[:id])
        @order_items = @order.order_items
    end
    
    def update
        order = Order.find(params[:id])
        order.update(order_params)
        if order.status != "waiting"
            order_items = OrderItem.where(order_id: order.id)
            order_items.each do |item|
                item.making_status = "wait_make"
                item.save
            end
        end
        if order.status == "shipped"
            order_items = OrderItem.where(order_id: order.id)
            order_items.each do |item|
                item.making_status = "complete_make"
                item.save
            end
        end
        redirect_to request.referer
    end
    
    private

    def order_params
        params.require(:order).permit(:status)
    end
end
