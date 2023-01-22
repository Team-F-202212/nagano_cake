class Order < ApplicationRecord
  def sum_of_order_price
    if not total_payment == nil
    total_payment + postage
    end
  end
end
