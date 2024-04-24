# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    content { 'テスト文章です' }
    association :user
  end
end
