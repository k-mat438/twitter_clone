# frozen_string_literal: true

class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :introduction, default: ''
      t.string :location, default: '地球'
      t.string :website, default: ''
    end
  end
end
