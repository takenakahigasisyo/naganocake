class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item
  has_one_attached :image
  
  validates :amount, presence: true # エラーメッセージ表示のために必要（みかん）

  def sum_of_price
    amount * item.tax_calc
  end
  
	def total_price
		c_items.to_a.sum { |item| item.total_price }
	end

end

