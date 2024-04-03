# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :post_images
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :reposts, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :notifications, dependent: :destroy

  validates :content, length: { maximum: 140 }
  validates :post_images, presence: true, unless: :content?

  def create_notification_like!(current_user)
    user_id = self.user_id
    temp = Notification.where(['send_id = ? and receive_id = ? and post_id = ? and action = ?', current_user.id,
                               user_id, id, 'like'])
    return unless temp.blank? && current_user.id != user_id

    notification = current_user.notifications.build(post_id: id, receive_id: user_id, action: 'like')

    notification.checked = true if notification.send_id == notification.receive_id
    notification.save if notification.valid?
  end

  def create_notification_repost!(current_user)
    user_id = self.user_id
    temp = Notification.where(['send_id = ? and receive_id = ? and post_id = ? and action = ?', current_user.id,
                               user_id, id, 'repost'])
    return unless temp.blank? && current_user.id != user_id

    notification = current_user.notifications.build(post_id: id, receive_id: user_id, action: 'repost')

    notification.checked = true if notification.send_id == notification.receive_id
    notification.save if notification.valid?
  end

  def create_notification_comment!(current_user, comment_id)
    user_id = self.user_id

    return unless current_user.id != user_id

    notification = current_user.notifications.build(post_id: id, receive_id: user_id, comment_id:,
                                                    action: 'comment')

    notification.checked = true if notification.send_id == notification.receive_id
    notification.save if notification.valid?
  end
end
