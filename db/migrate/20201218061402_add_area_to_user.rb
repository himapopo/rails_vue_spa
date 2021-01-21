class AddAreaToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :area, :string
    add_column :users, :profile, :text
  end
end
