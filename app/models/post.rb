# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :post_images

  validates :content, length: { maximum: 140 }
  validates :post_images, presence: true, unless: :content?
end
