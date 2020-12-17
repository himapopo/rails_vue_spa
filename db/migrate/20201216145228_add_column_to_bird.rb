class AddColumnToBird < ActiveRecord::Migration[6.0]
  def change
    remove_column :birds, :details, :string
    add_column :birds, :details, :text
  end
end
