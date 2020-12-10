class User < ApplicationRecord
#  attr_accessor :image  #データベースに保存しないカラムを追加できる
  has_secure_password

  validates :email, uniqueness:true
end
