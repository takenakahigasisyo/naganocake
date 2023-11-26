class Item < ApplicationRecord
  
  belongs_to :genre
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  has_one_attached :item_image
  

  # 税込み価格の計算
  def tax_calc
    (price * 1.1).floor 
  end
    
  #
  validates :name, presence: true
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 1}
  validates :explanation, presence: true
  #validates :genre_id, presence: true
  
  def get_item_image
    (item_image.attached?) ? item_image : 'no_image.jpg'
  end
  
end
