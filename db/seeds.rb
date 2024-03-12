# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
    email: "a@a",
    password: "aaaaaa"
)

Customer.create!(
    last_name: "a",
    first_name: "a",
    last_name_kana: "a",
    first_name_kana:"a",
    postal_code: "a",
    address: "a",
    phone_number: "a",
    email: "a@a",
    password: "aaaaaa"
    )

Genre.create!(name: 'Action')

Item.create!(
    genre_id: "1",
    name: "ケーキ",
    introduction: "イチゴ",
    price: "10",
    is_deleted: "false"
    )

Item.create!(
    genre_id: "1",
    name: "ケーキ",
    introduction: "チョコ",
    price: "11",
    is_deleted: "true"
    )


    
Address.create!(
    customer_id: "1",
    postal_code: "2021234",
    address: "博多",
    name: "佐藤"
    )
    
Item.create!(
    genre_id: "1",
    name: "ケーキ2",
    introduction: "抹茶",
    price: "400",
    is_deleted: "false"
    )