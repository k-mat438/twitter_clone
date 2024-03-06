# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :post_images
end
