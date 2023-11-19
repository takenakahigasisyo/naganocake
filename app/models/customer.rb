class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :orders, dependent: :destroy
    has_many :addresses, dependent: :destroy
    has_many :cart_items, dependent: :destroy
    validates :encrypted_password,length: {minimum: 6}
    
    # ログイン時に退会済みのユーザーが同じアカウントでログイン出来ないようにする記載
  def active_for_authentication?
    # 質問：superの意味は？
    super && (is_active == true)
  end
  
end
