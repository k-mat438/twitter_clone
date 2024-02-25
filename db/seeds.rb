# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# product1 = Product.new(
#   name: 'Fancy Product',
#   price: '40000'
# )
# product1.image.attach(io: File.open(Rails.root.join('app/assets/images/image.jpg')), filename: 'image.jpg')
# product1.save!

# email,phone ==== unique!!!
user1 = User.new(
  name: 'bluebird',
  email: 'livinGfossil@admin.com',
  phone_number: 0o00000000,
  birth: '2000-01-01',
  password: 'hogehoge',
  confirmed_at: Time.now
)
user1.image.attach(io: File.open(Rails.root.join('app/assets/images/blue_bird.png')), filename: 'blue_bird.png')
user1.save!

user2 = User.new(
  name: 'Chatgpt',
  email: 'hoge1@ano.com',
  phone_number: 111_111_111,
  birth: '2000-01-01',
  password: 'hogehoge',
  confirmed_at: Time.now
)
user2.image.attach(io: File.open(Rails.root.join('app/assets/images/anonymous.png')), filename: 'anonymous.png')
user2.save!

user3 = User.new(
  name: 'たまご',
  email: 'hoge2@ano.com',
  phone_number: 0o11111111,
  birth: '2000-01-01',
  password: 'hogehoge',
  confirmed_at: Time.now
)
user3.image.attach(io: File.open(Rails.root.join('app/assets/images/twitter_egg.png')), filename: 'twitter_egg.png')
user3.save!

user1.posts.create!(content: '旧管理者の青い鳥です')
user2.posts.create!(content: '匿名投稿です')
user2.posts.create!(content: '100億ドル欲しいです')
user1.posts.create!(content: 'イーロンマスクは好きですか？')
user3.posts.create!(content: '初めまして、たまごと申します')
user2.posts.create!(content: '「100億ドル欲しい。夢は大きく持たないとね。 #100億ドル #夢 #願望」')
user1.posts.create!(content: '青い鳥が空高く舞い、風に乗って遠くへと飛んでいく。')
user1.posts.create!(content: 'その姿は自由の象徴であり、心に安らぎと希望を運んでくるように感じられる。')
user1.posts.create!(content: '誰もがその青い鳥のように自由になりたいと願うのだろう。by chatgpt')
user3.posts.create!(content: '卵は生物学的には多くの動物の生命の始まりであり、栄養学的には非常に栄養価が高い食品です。')
user2.posts.create!(content: '人生の夢を語るとき、星空のように無限の可能性が広がる。')
user2.posts.create!(content: '私の夢は、世界をより良い場所にすること。')
user2.posts.create!(content: '一歩ずつ、夢に向かって歩んでいきます。皆さんの夢は何ですか？ #夢 #可能性 #未来')
user3.posts.create!(content: 'たんぱく質、ビタミン、ミネラル、脂肪が豊富に含まれており、健康に良い影響を与えます。')
user3.posts.create!(content: '多様性と栄養価の高さから、私たちの生活に欠かせない存在です。')
