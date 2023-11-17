class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    validates :last_name,presence: true
    validates :first_name,presence: true
    validates :last_name_furigana,presence: true
    validates :first_name_furigana,presence: true
    validates :email,presence: true
    validates :postcode,presence: true
    validates :address,presence: true
    validates :phone_number,presence: true
    validates :encrypted_password,presence: true,length: {minimum: 6}
end
