# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :post_images
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reposts, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  validates :content, length: { maximum: 140 }
  validates :post_images, presence: true, unless: :content?
end
