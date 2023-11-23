class Address < ApplicationRecord

  belongs_to :customer


  def address_display
  '〒' + postcode + ' ' + address + ' ' + name
  end

  
  validates :name, presence: true
  validates :postcode, length: { minimum: 7, maximum: 7 }
  validates :address, presence: true
  
end
