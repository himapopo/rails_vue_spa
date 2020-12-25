class User < ApplicationRecord
#  attr_accessor :image  #データベースに保存しないカラムを追加できる
  attr_accessor :remember_token
  has_many :birds, dependent: :destroy
  has_many :likes
  has_many :followers, class_name: 'Follow', foreign_key: 'user_id'
  has_many :followees, class_name: 'Follow', foreign_key: 'follow_id'
  has_secure_password

  validates :email, uniqueness:true, presence:true
  validates :name, presence:true
  validates :area, presence:true
  validates :profile, presence:true
  
end
