class Order < ApplicationRecord
  belongs_to :customer
  enum payment_method: { credit_card: 0, transfer: 1 }
  enum oders_status: { payment_waiting: 0, payment_confirmation: 1, production: 2, preparation_shipping: 3, shipped: 4}


end
