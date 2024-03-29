class User < ApplicationRecord
  #  attr_accessor :image  #データベースに保存しないカラムを追加できる
  attr_accessor :remember_token

  has_many :birds, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :followers, class_name: "Follow", foreign_key: "user_id", dependent: :destroy
  has_many :followees, class_name: "Follow", foreign_key: "follow_id", dependent: :destroy
  has_secure_password

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true
  validates :area, presence: true
  validates :profile, presence: true

  def follow(user)
    followees.find_or_create_by(user_id: user.id) if id != user.id
  end

  def unfollow(user)
    foolow = followees.find_by(user_id: user.id)
    foolow.destroy if foolow
  end
end
