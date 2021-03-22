class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
has_many :cart_products

        validates :email, uniqueness: true
        validates :encrypted_password, uniqueness: true
        validates :last_name, presence: true
        validates :first_name, presence: true
        validates :last_name_kana, presence: true
        validates :first_name_kana, presence: true
        validates :postal_code, presence: true
        validates :address, presence: true
        validates :telephone_number, presence: true
end


  # 退会
#   def active_for_authentication?
#     super && (self.is_deleted == false)
#   end
# end

