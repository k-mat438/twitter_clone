# frozen_string_literal: true

class User < ApplicationRecord
  has_one_attached :image
  has_one_attached :header_image
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: %i[github]

  validates :name, presence: true, length: { maximum: 10 }
  validates :phone_number, presence: true, uniqueness: true
  validates :birth, presence: true

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, uid: auth.uid) do |user|
      user.email = auth.info.email || "#{auth.uid}@example.com"
      user.password = Devise.friendly_token[0, 20]
      user.name = auth.info.name # assuming the user model has a name
      user.phone_number = "000-#{auth.uid}-#{auth.provider}"
      user.birth = '2000-01-01' # default value
      # user.image = auth.info.image # assuming the user model has an image
      # If you are using confirmable and the provider(s) you use validate emails,
      # uncomment the line below to skip the confirmation emails.
      user.skip_confirmation!
    end
  end

  def get_header_image(width, height)
    unless header_image.attached?
      file_path = Rails.root.join('app/assets/images/default_image.png')
      header_image.attach(io: File.open(file_path), filename: 'default-image.png', content_type: 'image/png')
    end
    header_image.variant(resize_to_limit: [width, height]).processed
  end
end
