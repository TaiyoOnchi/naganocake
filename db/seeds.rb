# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Admin
Admin.find_or_create_by!(email: "a@a") do |admin|
  admin.password = "aaaaaa"
end

# Customer
Customer.find_or_create_by!(email: "a@a") do |customer|
  customer.last_name = "a"
  customer.first_name = "a"
  customer.last_name_kana = "a"
  customer.first_name_kana = "a"
  customer.postal_code = "a"
  customer.address = "a"
  customer.phone_number = "a"
  customer.password = "aaaaaa"
end

Customer.find_or_create_by!(email: "taro.sato@example.com") do |customer|
  customer.last_name = "佐藤"
  customer.first_name = "太郎"
  customer.last_name_kana = "サトウ"
  customer.first_name_kana = "タロウ"
  customer.postal_code = "1234567"
  customer.address = "東京都新宿区西新宿1-1-1"
  customer.phone_number = "08012345678"
  customer.password = "satoTR"
end

# Genre
Genre.find_or_create_by!(name: 'ケーキ') do |genre|
  genre.is_deleted = false
end

# Items
Item.find_or_create_by!(name: "イチゴケーキ", genre_id: 1) do |item|
  item.introduction = "イチゴ"
  item.price = 100
  item.is_deleted = false
end

Item.find_or_create_by!(name: "チョコケーキ", genre_id: 1) do |item|
  item.introduction = "チョコ"
  item.price = 120
  item.is_deleted = true
end

Item.find_or_create_by!(name: "抹茶ケーキ", genre_id: 1) do |item|
  item.introduction = "抹茶"
  item.price = 400
  item.is_deleted = false
end

# Address
Address.find_or_create_by!(customer_id: 1, postal_code: "2021234", address: "博多") do |address|
  address.name = "佐藤"
end
