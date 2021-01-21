class User < ApplicationRecord
#  attr_accessor :image  #データベースに保存しないカラムを追加できる
  has_many :birds
  has_secure_password

  validates :email, uniqueness:true, presence:true
  validates :name, presence:true
end
