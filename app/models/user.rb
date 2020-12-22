class User < ApplicationRecord
#  attr_accessor :image  #データベースに保存しないカラムを追加できる
  attr_accessor :remember_token
  has_many :birds, dependent: :destroy
  has_many :likes
  has_secure_password

  validates :email, uniqueness:true, presence:true
  validates :name, presence:true
  validates :area, presence:true
  validates :profile, presence:true

  # def User.digest(string)
  #   cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
  #                                                 BCrypt::Engine.cost
  #   BCrypt::Password.create(string, cost: cost)
  # end

  # def User.new_token
  #   SecureRandom.urlsafe_base64
  # end

  # def remember
  #   self.remember_token = User.new_token
  #   update_attribute(:remember_digest, User.digest(remember_token))
  # end
end
