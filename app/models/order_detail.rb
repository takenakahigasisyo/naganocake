class OrderDetail < ApplicationRecord
  
  belongs_to :item
  belongs_to :order
  
  enum making_status: { unable_to_start: 0, waiting_for_production: 1, production: 2, production_completed: 3} #記述されていなかったので記述
  
end
