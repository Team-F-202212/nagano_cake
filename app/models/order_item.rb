class OrderItem < ApplicationRecord

  def sum_of_order_price
    price * amount
  end

    belongs_to :item
    belongs_to :order
    enum making_status: { not_make: 0, wait_make: 1, now_make: 2, complete_make: 3}

end
