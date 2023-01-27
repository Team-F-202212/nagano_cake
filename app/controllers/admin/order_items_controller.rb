class Admin::OrderItemsController < ApplicationController
    def update
        order_item = OrderItem.find(params[:id])
        order_item.update(order_item_params)
        order_items = OrderItem.where(order_id: order_item.order_id)
        order_item.order.update(status: "prepare") if order_items.all?{ |v| v.making_status == "complete_make" }
        redirect_to request.referer
    end
    
    private

    def order_item_params
        params.require(:order_item).permit(:making_status)
    end
end
