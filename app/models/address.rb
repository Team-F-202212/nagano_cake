class Address < ApplicationRecord
  
  def address_diplay
    '〒' + postal_code + ' ' + address + ' ' + name
  end
end
