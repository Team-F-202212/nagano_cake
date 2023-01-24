class Order < ApplicationRecord

  def sum_of_order_price
    if not total_payment == nil
    total_payment + postage
    end
  end


    enum payment_method: { credit_card: 0, transfer: 1 }
    enum status: { waiting: 0, paid: 1, making: 2, prepare: 3, shipped: 4 }
    has_many :order_items
    has_many :items, through: :order_items



end
