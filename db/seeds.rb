# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

9.times do |n|
    User.create!(last_name_characters: "確認",first_name_characters: "太郎#{n}",last_name_kana: "カクニン#{n}",first_name_kana: "タロウ#{n}",email: "test#{n}@test.com", password: "1234567#{n}",password_confirmation: "1234567#{n}",postal_code: "000-000#{n}", address: "東京都渋谷区神南0-0-#{n}", phone_number: "000-000#{n}")
end

User.create!(last_name_characters: "渡部",first_name_characters: "竣太",last_name_kana: "ワタベ",first_name_kana: "シュンタ",email: "shunta1@gmail.com", password: "shuntainfratop",password_confirmation: "shuntainfratop",postal_code: "123-4567", address: "埼玉県さいたま市浦和区", phone_number: "080-1234-5678")