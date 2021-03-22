class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
        has_many :cart_products
        has_many :addresses
        has_many :orders
        validates :email, uniqueness: true
        validates :encrypted_password, uniqueness: true ,confirmation: true
        validates :last_name, presence: true
        validates :first_name, presence: true
        validates :last_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
        validates :first_name_kana, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
        validates :postal_code, format: /\A[0-9]+\z/ ,presence: true
        validates :address, presence: true
        validates :telephone_number, format:/\A[0-9]+\z/ ,presence: true

  def full_name
    first_name + last_name
  end

end


  # 退会
#   def active_for_authentication?
#     super && (self.is_deleted == false)
#   end
# end

