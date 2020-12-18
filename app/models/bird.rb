class Bird < ApplicationRecord
  belongs_to :user

  validates :image1, presence:true
  validates :name, presence:true
  validates :size, presence:true
  validates :details, presence:true
  validates :age, presence:true
  validates :sex, presence:true
end
