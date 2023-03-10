class Item < ApplicationRecord
  
  belongs_to :genre
  has_many :cart_items

  # validates :name, presence: true
  # validates :introduction, presence: true
  # validates :price, presence: true
  # validates :image, presence: true


  has_one_attached :image
 
  
   def with_tax_price
     (price * 1.1).floor
   end
  has_many :order_items
  has_many :orders, through: :order_items


  
  


end
