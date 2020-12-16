class CreateBirds < ActiveRecord::Migration[6.0]
  def change
    create_table :birds do |t|
      t.references :user, null: false, foreign_key: true
      t.string :size
      t.string :age
      t.string :type
      t.string :details
      t.string :image1
      t.string :image2
      t.string :image3

      t.timestamps
    end
  end
end
