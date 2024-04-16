# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'tester' }
    sequence(:email) { |n| "tester#{n}@example.com" }
    phone_number { 0o01 }
    birth { '2003-01-01' }
    password { 'hogehoge' }
    confirmed_at { Time.zone.today }
  end
end
