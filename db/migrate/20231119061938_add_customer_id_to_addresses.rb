class AddCustomerIdToAddresses < ActiveRecord::Migration[6.1]
  def change #customer_id追加しました
    add_column :addresses, :customer_id, :integer
  end
end
