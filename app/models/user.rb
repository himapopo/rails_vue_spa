class User < ApplicationRecord
#  attr_accessor :image  #データベースに保存しないカラムを追加できる
  has_many :birds, dependent: :destroy
  has_many :likes
  has_secure_password

  validates :email, uniqueness:true, presence:true
  validates :name, presence:true
  validates :area, presence:true
  validates :profile, presence:true

end
