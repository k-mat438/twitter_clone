class AddColumnsToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :introduction, :string, default: ""
    add_column :users, :location, :string, default: "地球"
    add_column :users, :website, :string, default: ""
  end
end
