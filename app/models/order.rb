class Order < ApplicationRecord

  belongs_to :customer
  has_many :order_details, dependent: :destroy

  attribute :address_id, :integer
  attribute :address_option, :integer
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum status: { payment_waiting: 0, payment_confirmation: 1, production: 2, preparation_shipping: 3, shipped: 4}

end
