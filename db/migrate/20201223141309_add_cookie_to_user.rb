class AddCookieToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :cookie, :boolean, default: false
  end
end
