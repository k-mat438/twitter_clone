# frozen_string_literal: true

class Relationship < ApplicationRecord
  # 存在しないテーブルを参照しないため,しっかりUserテーブルを参照するため
  belongs_to :following, class_name: 'User'
  belongs_to :follower, class_name: 'User'
end
