class AddSexToBird < ActiveRecord::Migration[6.0]
  def change
    add_column :birds, :sex, :string
  end
end
