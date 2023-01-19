class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :genre
  
  validates :name, presence: true
  validates :introduction, presence: true
  validates :price, presence: true
  validates :image, presence: true
  validates :admin, inclusion: {in: [true, false]}
  
  def with_tax_price
    (price*1.1).floor
  end
  
end
