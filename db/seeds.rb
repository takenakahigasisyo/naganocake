# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

 2.times do |n|
 Genre.create(
  name: "テストジャンル#{n + 1}"
  )
 end

5.times do |no|
  Item.create!(
  	genre_id: 1,
  	name: "シュトーレン#{no + 1}",
  	price: "#{no + 100}",
  	explanation: "うまい",
  	is_saled: "true",
  	item_image: ActiveStorage::Blob.create_and_upload!(io: File.open(Rails.root.join("app/assets/images/no_image.jpg")),filename: 'no_image.jpg')
	)
end

5.times do |n|
 Customer.create(
  last_name: "テスト",
  first_name: "太郎#{n + 1}",
  last_name_furigana: "テスト",
  first_name_furigana: "タロウ#{n + 1}",
  email: "tesr@email#{n + 1}",
  postcode: "00#{n + 1}000#{n + 1}",
  address: "東京都千代田区#{n + 1}",
  phone_number: "010001000#{n + 1}",
  encrypted_password: "test_pass#{n + 1}",
  # 表記あってる？
  is_active: true
  )
 end
  
 Admin.create(
  email: "test_admin@email",
  encrypted_password: "test_admin"
  )

 
 
 5.times do |n|
 CartItem.create(
  customer_id: "#{n + 1}",
  item_id: "#{n + 1}",
  amount: "#{n + 1}",
 )
 end
 
 5.times do |n|
  Order.create!(
  customer_id: "#{n + 1}",
  shipping_fee: "800", 
  billing_amount: "1000",
  payment_method: 0,
  name: "ケーキ#{n + 1}",
  postcode: 1111111,
  address: "福岡県",
  status: 0
 )
end

5.times do |n|
 OrderDetail.create(
  order_id: "#{n + 1}",
  item_id: "#{n + 1}",
  amount: "#{n + 1}",
  price_on_order: "800",
  making_status: 0,
  )
 end