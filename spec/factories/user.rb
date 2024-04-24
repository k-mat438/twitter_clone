# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { 'tester' }
    email { 'tester@example.com' }
    phone_number { '0123456789' }
    birth { Date.new(2003, 1, 1) }
    password { 'hogehoge' }
    confirmed_at { Time.zone.today }
  end
end
