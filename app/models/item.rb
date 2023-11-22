class Item < ApplicationRecord
  
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_one_attached :item_image
  
  # 税込み価格の計算
  def tax_calc
    (price * 1.1).floor 
  end
  
end
