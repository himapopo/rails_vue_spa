class User < ApplicationRecord
#  attr_accessor :age  データベースに保存しないカラムを追加できる
  has_one_attached :avatar
  has_secure_password

end
