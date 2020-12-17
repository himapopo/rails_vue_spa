class AddNameToBird < ActiveRecord::Migration[6.0]
  def change
    add_column :birds, :name, :string
    remove_column :birds, :type
  end
end
