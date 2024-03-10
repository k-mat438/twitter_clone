# frozen_string_literal: true

class ChangePosts < ActiveRecord::Migration[7.0]
  def up
    change_column_null :posts, :content, :string, null: false, limit: 140
  end

  def down
    change_column_null :posts, :content, :string, null: false
  end
end
