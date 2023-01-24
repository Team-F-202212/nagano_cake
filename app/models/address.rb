class Address < ApplicationRecord
 
  def address_diplay
    '〒' + postal_code + ' ' + address + ' ' + name
  end
  
  #validates :name, presence: true
  #validates :postal_code, presence: true
  #validates :address, presence: true
end
