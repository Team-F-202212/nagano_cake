class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #validates :first_name, presence: true
  #validates :last_name, presence: true
  #validates :first_name_kana, presence: true
  #validates :last_name_kana, presence: true
  #validates :postal_code, presence: true
  #validates :address, presence: true
  #validates :telephone_number, presence: true
  #validates :email, presence: true
  def active_for_authentication?
    super && (is_deleted == "in_use")
  end

         
  enum is_deleted: { in_use: false, withdrawal: true }
  
  has_many :cart_items
end
