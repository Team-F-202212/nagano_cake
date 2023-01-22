class OrderItem < ApplicationRecord
  def sum_of_order_price
    price * amount
  end
end
