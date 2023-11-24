class CartItem < ApplicationRecord

  belongs_to :customer
  belongs_to :item

  def sum_of_price
    amount * item.tax_calc
  end

  # def get_image(width, height)
  #   unless image.attached?
  #     file_path = Rails.root.join('app/assets/images/test_cow.jpg')
  #     image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  #   end
  #   image
  # end
  

	def total_price
		c_items.to_a.sum { |item| item.total_price }
	end

end

