class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  has_many :order_items
  has_many :orders, through: :order_items
  
  # validates :name, presence: true
  # validates :introduction, presence: true
  # validates :price, presence: true
  # validates :image, presence: true
  
  # def with_tax_price
  #   (price*1.1).floor
  # end
  
end
