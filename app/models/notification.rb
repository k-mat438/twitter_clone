# frozen_string_literal: true

class Notification < ApplicationRecord
  belongs_to :sender, class_name: 'User', foreign_key: 'send_id', inverse_of: :notifications
  belongs_to :receiver, class_name: 'User', foreign_key: 'receive_id', inverse_of: :passive_notifications
  belongs_to :post, optional: true
  belongs_to :comment, optional: true
end
